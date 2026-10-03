import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:just_audio/just_audio.dart';

import '../models/audio_track.dart';
import 'track_player.dart';
import 'tts_track_player.dart';

/// Bridge for the native sherpa-onnx binding.  The app deliberately does not
/// bundle a model or download one during playback. A platform adapter can be
/// registered by the distribution that has installed a verified model.
abstract interface class SherpaTtsBackend {
  String get modelVersion;
  Future<bool> get isReady;
  Future<Uint8List> synthesize(String text, {required double speed});
  Future<void> dispose();
}

/// No backend is shipped until a Vietnamese model has passed legal and device
/// QA. This is the safe default and causes the P1 TTS fallback.
class UnavailableSherpaBackend implements SherpaTtsBackend {
  const UnavailableSherpaBackend();
  @override String get modelVersion => 'none';
  @override Future<bool> get isReady async => false;
  @override Future<Uint8List> synthesize(String text, {required double speed}) =>
      Future.error(StateError('No Sherpa model installed'));
  @override Future<void> dispose() async {}
}

/// P2 adapter and cache boundary. The backend returns a complete WAV. A
/// production Android/iOS adapter can feed these files to just_audio without
/// changing playlist/highlight/resume code. If initialization or synthesis
/// fails, every operation is delegated to the P1 player (never a crash).
class SherpaTtsTrackPlayer implements TrackPlayer, VolumeControllable {
  SherpaTtsTrackPlayer({SherpaTtsBackend? backend, TrackPlayer? fallback})
      : _backend = backend ?? const UnavailableSherpaBackend(),
        _fallback = fallback {
    // BUG FIX (V1.9.2 — "đọc đoạn đầu rồi im lặng, không lặp/chuyển mục"):
    // khi có fallback được TIÊM SẴN (constructor, dùng trong test), sự kiện
    // của nó cũng phải được nối vào `_events` ngay — nếu không,
    // AudioPlayerNotifier (lắng nghe `events` của CHÍNH SherpaTtsTrackPlayer)
    // không bao giờ nhận được `cueStarted`/`completed` từ engine thật bên
    // dưới, nên không thể tự chuyển mục/lặp dù audio vẫn đang đọc.
    if (_fallback != null) _listenToFallback(_fallback!);
  }

  final SherpaTtsBackend _backend;
  TrackPlayer? _fallback;
  AudioPlayer? _audio;
  StreamSubscription<TrackPlayerEvent>? _fallbackEventSub;

  TrackPlayer get _fallbackPlayer {
    final existing = _fallback;
    if (existing != null) return existing;
    final created = TtsTrackPlayer();
    _fallback = created;
    _listenToFallback(created);
    return created;
  }

  /// Nối thẳng sự kiện của engine thật (TtsTrackPlayer) vào `_events` — đây
  /// là cầu nối đã BỊ THIẾU trước V1.9.2 (xem ghi chú ở constructor).
  void _listenToFallback(TrackPlayer fallback) {
    unawaited(_fallbackEventSub?.cancel());
    _fallbackEventSub = fallback.events.listen(_events.add);
  }

  AudioPlayer get _audioPlayer => _audio ??= AudioPlayer();
  final _events = StreamController<TrackPlayerEvent>.broadcast();
  List<AudioCue> _cues = const [];
  String _locale = 'vi';
  double _speed = 1.0;
  bool _useFallback = true;
  int _run = 0;
  int _cue = 0;
  Directory? _cache;

  @override Stream<TrackPlayerEvent> get events => _events.stream;
  bool get usingSherpa => !_useFallback;

  @override
  Future<void> load({required List<AudioCue> cues, required String contentLocaleTag}) async {
    await stop();
    _cues = List.unmodifiable(cues);
    _locale = contentLocaleTag;
    _cue = 0;
    try {
      _useFallback = !(await _backend.isReady);
      if (!_useFallback) {
        final root = await getApplicationSupportDirectory();
        _cache = Directory('${root.path}/audio-cache/${_backend.modelVersion}');
        await _cache!.create(recursive: true);
      }
    } catch (_) {
      _useFallback = true;
    }
    if (_useFallback) {
      await _fallbackPlayer.load(cues: cues, contentLocaleTag: contentLocaleTag);
    }
  }

  @override Future<void> play() async {
    if (_useFallback) return _fallbackPlayer.play();
    final token = ++_run;
    for (var i = _cue; i < _cues.length; i++) {
      if (token != _run) return;
      _cue = i;
      _events.add(TrackPlayerEvent(TrackPlayerEventType.cueStarted, cueIndex: i));
      try {
        // Synthesis/cache is intentionally asynchronous and per-cue. WAV is
        // then handed to just_audio, so duration/seek are real for this cue.
        final wav = await _wavFor(_cues[i], _speed);
        await _audioPlayer.setFilePath(wav.path);
        await _audioPlayer.setSpeed(_speed);
        await _audioPlayer.play();
        await _audioPlayer.processingStateStream.firstWhere(
          (state) => state == ProcessingState.completed || token != _run,
        );
      } catch (_) {
        _useFallback = true;
        await _fallbackPlayer.load(cues: _cues, contentLocaleTag: _locale);
        await _fallbackPlayer.seekCue(i);
        await _fallbackPlayer.play();
        return;
      }
    }
    _events.add(TrackPlayerEvent(TrackPlayerEventType.completed, cueIndex: _cues.length - 1));
  }

  @override Future<void> pause() async { ++_run; if (_useFallback) { if (_fallback != null) await _fallbackPlayer.pause(); } else { await _audioPlayer.pause(); } }
  @override Future<void> stop() async { ++_run; _cue = 0; if (_useFallback) { if (_fallback != null) await _fallbackPlayer.stop(); } else if (_audio != null) { await _audioPlayer.stop(); } }
  @override Future<void> setSpeed(double speed) async { _speed = speed; if (_useFallback) await _fallbackPlayer.setSpeed(speed); }
  @override
  Future<void> setVolume(double volume) async {
    if (_useFallback && _fallbackPlayer is VolumeControllable) {
      await (_fallbackPlayer as VolumeControllable).setVolume(volume);
    } else if (!_useFallback) {
      await _audioPlayer.setVolume(volume);
    }
  }
  @override Future<void> seekCue(int cueIndex) async {
    if (_cues.isEmpty) return;
    _cue = cueIndex.clamp(0, _cues.length - 1).toInt();
    if (_useFallback) await _fallbackPlayer.seekCue(_cue);
  }
  @override
  Future<void> dispose() async {
    await _fallbackEventSub?.cancel();
    if (_audio != null) await _audioPlayer.dispose();
    await _backend.dispose();
    if (_fallback != null) await _fallbackPlayer.dispose();
    await _events.close();
  }

  Future<File> _wavFor(AudioCue cue, double speed) async {
    final text = cue.plainText;
    final key = sha256.convert(Uint8List.fromList('$text\n$_locale\n${_backend.modelVersion}\n$speed'.codeUnits)).toString();
    final file = File('${_cache!.path}/$key.wav');
    if (!await file.exists()) await file.writeAsBytes(await _backend.synthesize(text, speed: speed), flush: true);
    return file;
  }
}
