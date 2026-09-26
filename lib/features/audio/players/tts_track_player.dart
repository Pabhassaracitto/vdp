// lib/features/audio/players/tts_track_player.dart
//
// TrackPlayer chạy trên flutter_tts (P1). Trước khi có sherpa-onnx (P2).
//
// Điểm quan trọng (plan §7, §11):
// * Phát theo TỪNG CÂU (text_chunking) — tránh engine nuốt chữ trên đoạn dài;
//   pause/resume ở mức câu (resume đọc lại câu đang dở, không nhảy chữ).
// * Span Pāli chuyển sang giọng Pāli (hi-IN → en-US → en-GB), rồi trả lại giọng
//   nội dung — nhất quán với nút phát âm Pāli ở detail sheet.
// * Một phiên chỉ một engine nói: trước khi phát, dừng PaliTtsHelper (và ngược
//   lại PaliTtsHelper gọi AudioPlayerNotifier.pause qua hook — xem §11).
// * Lỗi engine không bao giờ crash app: nuốt lỗi, tự chữa bằng timeout.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../core/utils/pali_tts_helper.dart';
import '../models/audio_track.dart';
import '../data/tts_voice_chain.dart';
import 'text_chunking.dart';
import 'track_player.dart';
import 'tts_rate.dart';

/// Vị trí đọc: cue → span → câu trong span.
class _Cursor {
  final int cue;
  final int span;
  final int sentence;
  const _Cursor(this.cue, this.span, this.sentence);
  static const _Cursor start = _Cursor(0, 0, 0);
}

class TtsTrackPlayer implements TrackPlayer {
  TtsTrackPlayer({FlutterTts? engine}) : _engine = engine ?? FlutterTts();

  final FlutterTts _engine;
  final StreamController<TrackPlayerEvent> _events =
      StreamController<TrackPlayerEvent>.broadcast();

  List<AudioCue> _cues = const [];
  String _contentLocaleTag = 'vi';
  String? _mainVoice;
  String? _paliVoice;
  bool _initialized = false;
  bool _running = false;
  double _speed = 1.0;
  _Cursor _cursor = _Cursor.start;

  /// Token thế hệ — vô hiệu mọi vòng lặp cũ khi pause/seek/load.
  int _runToken = 0;

  @override
  Stream<TrackPlayerEvent> get events => _events.stream;

  @override
  Future<void> load({
    required List<AudioCue> cues,
    required String contentLocaleTag,
  }) async {
    await stop();
    _cues = List.unmodifiable(cues);
    _contentLocaleTag = contentLocaleTag;
    _cursor = _Cursor.start;
    await _ensureInitialized();
  }

  @override
  Future<void> play() async {
    if (_cues.isEmpty) return;
    // Một phiên chỉ một engine nói (plan §11 — Audio Coordinator).
    await PaliTtsHelper.instance.stop();
    if (!_initialized) await _ensureInitialized();
    if (_mainVoice == null) return; // lỗi đã phát event trong _ensureInitialized
    if (_cursor.cue >= _cues.length) _cursor = _Cursor.start;
    _running = true;
    final token = ++_runToken;
    // Chạy nền — không await để UI responsive.
    unawaited(_run(token));
  }

  @override
  Future<void> pause() async {
    _running = false;
    _runToken++;
    try {
      await _engine.stop();
    } catch (_) {}
  }

  @override
  Future<void> stop() async {
    await pause();
    _cursor = _Cursor.start;
  }

  @override
  Future<void> setSpeed(double speed) async {
    _speed = speed;
    try {
      await _engine.setSpeechRate(
        engineSpeechRate(speed, isIOS: defaultTargetPlatform == TargetPlatform.iOS),
      );
    } catch (_) {}
  }

  @override
  Future<void> seekCue(int cueIndex) async {
    if (_cues.isEmpty) return;
    final target = cueIndex.clamp(0, _cues.length - 1).toInt();
    final wasRunning = _running;
    await pause();
    _cursor = _Cursor(target, 0, 0);
    if (wasRunning) await play();
  }

  @override
  Future<void> dispose() async {
    await pause();
    await _events.close();
  }

  // ─── Vòng phát ────────────────────────────────────────────────────────────

  Future<void> _run(int token) async {
    while (_running && token == _runToken && _cursor.cue < _cues.length) {
      final cueIndex = _cursor.cue;
      final cue = _cues[cueIndex];
      if (_cursor.span == 0 && _cursor.sentence == 0) {
        _events.add(TrackPlayerEvent(
          TrackPlayerEventType.cueStarted,
          cueIndex: cueIndex,
        ));
      }

      for (var s = _cursor.span; s < cue.spans.length; s++) {
        final span = cue.spans[s];
        final sentences = splitSentences(span.text);
        final start = s == _cursor.span ? _cursor.sentence : 0;
        for (var j = start; j < sentences.length; j++) {
          if (!_running || token != _runToken) return; // pause: giữ cursor tại câu dở
          _cursor = _Cursor(cueIndex, s, j);
          await _speak(sentences[j], isPali: span.isPali);
          if (!_running || token != _runToken) return;
        }
      }

      // Hết cue → sang cue kế (nếu có), ngắt nghỉ nhẹ giữa các đoạn.
      final nextCue = cueIndex + 1;
      if (nextCue >= _cues.length) {
        _cursor = _Cursor(_cues.length, 0, 0); // hết track
        _running = false;
        if (token == _runToken) {
          _events.add(TrackPlayerEvent(
            TrackPlayerEventType.completed,
            cueIndex: cueIndex,
          ));
        }
        return;
      }
      _cursor = _Cursor(nextCue, 0, 0);
      await Future<void>.delayed(const Duration(milliseconds: 350));
    }
  }

  Future<void> _speak(String text, {required bool isPali}) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    try {
      if (isPali && _paliVoice != null) {
        await _engine.setLanguage(_paliVoice!);
      }
      try {
        await _engine
            .speak(trimmed)
            .timeout(speakTimeoutFor(trimmed, _speed));
      } on TimeoutException {
        // Engine treo — tự chữa để phiên nghe không đứng hình (plan §11).
      }
    } catch (_) {
      // Lỗi engine từng câu: bỏ qua câu hỏng, không crash app.
    } finally {
      if (isPali && _paliVoice != null && _mainVoice != null) {
        try {
          await _engine.setLanguage(_mainVoice!);
        } catch (_) {}
      }
    }
  }

  // ─── Khởi tạo engine ──────────────────────────────────────────────────────

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    try {
      // speak() chỉ resolve khi đọc xong — cần cho vòng phát theo câu.
      await _engine.awaitSpeakCompletion(true);
      await _engine.setVolume(1.0);
      await _engine.setPitch(1.0);
      await setSpeed(_speed);

      final supported = parseTtsLanguageList(await _engine.getLanguages);

      // Giọng nội dung: dò theo chuỗi locale của VĂN BẢN (fallback cuối: en).
      _mainVoice = pickTtsLanguage(
        preferred: [...ttsVoiceChain(_contentLocaleTag), ...kUniversalVoiceFallbacks],
        supported: supported,
      );
      // Giọng Pāli: cùng chuỗi với PaliTtsHelper.
      _paliVoice = pickTtsLanguage(
        preferred: kPaliVoiceChain,
        supported: supported,
      );

      if (_mainVoice == null) {
        _events.add(TrackPlayerEvent(TrackPlayerEventType.voiceUnavailable));
        _initialized = true;
        return;
      }
      await _engine.setLanguage(_mainVoice!);
      _initialized = true;
    } catch (_) {
      _initialized = true;
      _events.add(TrackPlayerEvent(TrackPlayerEventType.engineUnavailable));
    }
  }
}
