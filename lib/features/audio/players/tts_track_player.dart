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
//
// BUG FIX (V1.9.2 — "đọc đoạn đầu rồi im lặng"): dùng `SharedTtsEngine` thay vì
// tự tạo `FlutterTts()` riêng (xem `core/utils/shared_tts_engine.dart`). Giọng
// và tốc độ được áp lại trước MỖI câu (không chỉ một lần lúc khởi tạo) vì engine
// dùng chung có thể bị `PaliTtsHelper` đổi tạm trong lúc phiên nghe đang pause.

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../core/utils/pali_tts_helper.dart';
import '../../../core/utils/shared_tts_engine.dart';
import '../models/audio_track.dart';
import '../data/tts_voice_chain.dart';
import '../data/web_tts_voice.dart';
import '../services/web_tts_voice_catalog.dart';
import '../services/web_tts_voice_preferences.dart';
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
  TtsTrackPlayer({
    SharedTtsEngine? engine,
    WebTtsVoiceCatalog? webVoiceCatalog,
  })  : _engine = engine ?? SharedTtsEngine.instance,
        _webVoiceCatalog = webVoiceCatalog ?? WebTtsVoiceCatalog.instance;

  final SharedTtsEngine _engine;
  final WebTtsVoiceCatalog _webVoiceCatalog;
  final StreamController<TrackPlayerEvent> _events =
      StreamController<TrackPlayerEvent>.broadcast();

  List<AudioCue> _cues = const [];
  String _contentLocaleTag = 'vi';
  String? _mainVoice;
  String? _paliVoice;
  List<String> _supportedLanguages = const [];
  List<WebTtsVoice> _webVoices = const [];
  DateTime? _lastWebVoiceQueryAt;
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
    final localeChanged = _contentLocaleTag != contentLocaleTag;
    final wasInitialized = _initialized;
    _cues = List.unmodifiable(cues);
    _contentLocaleTag = contentLocaleTag;
    _cursor = _Cursor.start;
    await _ensureInitialized();
    // flutter_tts giữ ngôn ngữ đã set giữa các lần load. Vì vậy đổi ngôn ngữ
    // nội dung phải chọn và áp dụng lại giọng, kể cả engine đã khởi tạo.
    if (localeChanged && wasInitialized) await _configureMainVoice();
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
    _engine.onProgress = null;
    // `SharedTtsEngine.stop()` giải phóng ngay bất kỳ `speakAndWait` nào đang
    // treo — đây là phần cốt lõi của bug fix V1.9.2: trước đây gọi thẳng
    // engine gốc có thể để lại một lời gọi `speak()` "ma" không bao giờ báo
    // xong, khiến vòng đọc tiếp theo không khởi động lại được.
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
      await _engine.raw.setSpeechRate(
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
      // Karaoke tô chữ (V1.9.2): chỉ cho cue 1-span (đoạn body) — xem
      // playlist_builder.dart, các cue khác (tóm tắt/từ khóa) hiển thị dạng
      // ghép nhiều mảnh nên chỉ tô sáng cả dòng.
      final canTrackWords = cue.spans.length == 1;

      for (var s = _cursor.span; s < cue.spans.length; s++) {
        final span = cue.spans[s];
        final sentences = splitSentences(span.text);
        final start = s == _cursor.span ? _cursor.sentence : 0;
        final wordBaseForSpan = _wordCountBeforeSpan(cue, s);
        for (var j = start; j < sentences.length; j++) {
          if (!_running || token != _runToken) return; // pause: giữ cursor tại câu dở
          _cursor = _Cursor(cueIndex, s, j);
          final wordBase =
              wordBaseForSpan + _wordCountBeforeSentence(sentences, j);
          await _speak(
            sentences[j],
            isPali: span.isPali,
            cueIndex: cueIndex,
            wordBase: canTrackWords && !span.isPali ? wordBase : null,
          );
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

  /// Tổng số từ của các span ĐỨNG TRƯỚC [spanIndex] trong [cue] — dùng làm mốc
  /// để quy đổi offset-ký-tự của flutter_tts (trong phạm vi 1 câu) thành chỉ
  /// số từ tuyệt đối trong `cue.plainText` (karaoke tô chữ).
  int _wordCountBeforeSpan(AudioCue cue, int spanIndex) {
    var count = 0;
    for (var i = 0; i < spanIndex; i++) {
      count += cue.spans[i].wordCount;
    }
    return count;
  }

  int _wordCountBeforeSentence(List<String> sentences, int sentenceIndex) {
    var count = 0;
    for (var i = 0; i < sentenceIndex; i++) {
      final trimmed = sentences[i].trim();
      if (trimmed.isEmpty) continue;
      count += trimmed.split(RegExp(r'\s+')).length;
    }
    return count;
  }

  Future<void> _speak(
    String text, {
    required bool isPali,
    required int cueIndex,
    int? wordBase,
  }) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    try {
      // Engine dùng CHUNG toàn app (SharedTtsEngine) — áp lại giọng/tốc độ
      // TRƯỚC MỖI câu thay vì chỉ một lần lúc khởi tạo, để không đọc nhầm
      // giọng/tốc độ nếu một thao tác TTS khác (phát âm Pāli) đã chỉnh engine
      // trong lúc phiên này đang pause (chính là bug "đọc rồi im lặng").
      if (isPali && _paliVoice != null) {
        await _engine.raw.setLanguage(_paliVoice!);
        _engine.onProgress = null;
      } else {
        await _applyMainVoice();
        await _engine.raw.setSpeechRate(
          engineSpeechRate(_speed, isIOS: defaultTargetPlatform == TargetPlatform.iOS),
        );
        if (wordBase != null) {
          _engine.onProgress = (spokenText, start, end, word) {
            final wordIndexInSentence =
                _wordIndexAtOffset(trimmed, start);
            _events.add(TrackPlayerEvent(
              TrackPlayerEventType.wordProgress,
              cueIndex: cueIndex,
              wordIndex: wordBase + wordIndexInSentence,
            ));
          };
        } else {
          _engine.onProgress = null;
        }
      }
      await _engine.speakAndWait(trimmed, timeout: speakTimeoutFor(trimmed, _speed));
    } catch (_) {
      // Lỗi engine từng câu: bỏ qua câu hỏng, không crash app.
    } finally {
      _engine.onProgress = null;
      if (isPali && _paliVoice != null && _mainVoice != null) {
        try {
          await _applyMainVoice();
        } catch (_) {}
      }
    }
  }

  /// Đếm số từ đứng trước ký tự ở vị trí [charOffset] trong [sentence].
  int _wordIndexAtOffset(String sentence, int charOffset) {
    final bounded = charOffset.clamp(0, sentence.length).toInt();
    final before = sentence.substring(0, bounded).trim();
    if (before.isEmpty) return 0;
    return before.split(RegExp(r'\s+')).length;
  }

  // ─── Khởi tạo engine ──────────────────────────────────────────────────────

  Future<void> _configureMainVoice() async {
    if (kIsWeb) await _refreshWebVoices();
    _mainVoice = pickTtsLanguage(
      preferred: [
        ...ttsVoiceChain(_contentLocaleTag),
        ...kUniversalVoiceFallbacks,
      ],
      supported: _supportedLanguages,
    );

    // A browser may expose SpeechSynthesis but return an empty language list
    // during its initial voice load. Still pass the content locale through so
    // the browser can use its own default voice instead of disabling TTS.
    if (_mainVoice == null && kIsWeb) {
      _mainVoice = ttsTagForContentTag(_contentLocaleTag);
    }
    if (_mainVoice == null) {
      _events.add(
        const TrackPlayerEvent(TrackPlayerEventType.voiceUnavailable),
      );
      return;
    }
    await _applyMainVoice();
  }

  Future<void> _applyMainVoice() async {
    if (kIsWeb) {
      try {
        // Pick up a newer list stabilized by Settings ("Refresh voices").
        final shared = _webVoiceCatalog.voices;
        if (shared.length > _webVoices.length) _webVoices = shared;
        final preferred =
            await WebTtsVoicePreferences.instance.selectedFor(_contentLocaleTag);
        final savedVoiceMissing = preferred != null &&
            !_webVoices.any((voice) => voice.id == preferred.id);
        if (_webVoices.isEmpty || savedVoiceMissing) {
          await _refreshWebVoices(force: savedVoiceMissing);
        }
        var voice = resolveWebTtsVoice(
          voices: _webVoices,
          contentLocaleTag: _contentLocaleTag,
          preferred: preferred,
        );
        // IN4-74: if the browser has not enumerated any voice yet, still
        // request the exact voice saved in Settings. setVoice matches by
        // name + locale and is a no-op when the browser really lacks it.
        if (voice == null &&
            preferred != null &&
            preferred.supportsLanguage(_contentLocaleTag)) {
          voice = preferred;
        }
        if (voice != null) {
          // `flutter_tts` Web selects the voice from name + locale. Apply the
          // locale first: setVoice changes SpeechSynthesisUtterance.voice, but
          // the plugin keeps the utterance language as a separate property.
          await _engine.raw.setLanguage(voice.locale);
          await _engine.raw.setVoice(voice.toFlutterTtsVoice());
          return;
        }
      } catch (_) {
        // Unsupported/stale browser voices fall back to setLanguage below.
      }
    }
    if (_mainVoice != null) await _engine.raw.setLanguage(_mainVoice!);
  }

  /// Uses the same stabilized, shared voice list as the Settings picker so a
  /// lesson resolves exactly the voice that Settings shows/previews (IN4-74).
  Future<void> _refreshWebVoices({bool force = false}) async {
    if (!kIsWeb || (_webVoices.isNotEmpty && !force)) return;
    final lastQuery = _lastWebVoiceQueryAt;
    if (lastQuery != null &&
        DateTime.now().difference(lastQuery) < const Duration(seconds: 30)) {
      // A full enumeration takes ~1.4–2.2 s. If it recently returned nothing
      // (or still lacks the saved voice), don't re-poll before every sentence.
      return;
    }
    _lastWebVoiceQueryAt = DateTime.now();
    try {
      final voices = await _webVoiceCatalog.load(force: force);
      if (voices.isNotEmpty) _webVoices = voices;
    } catch (_) {
      // Voice enumeration is an enhancement; language-based playback remains.
    }
  }

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    try {
      await _engine.raw.setVolume(1.0);
      await _engine.raw.setPitch(1.0);
      await setSpeed(_speed);

      _supportedLanguages =
          parseTtsLanguageList(await _engine.raw.getLanguages);
      if (kIsWeb) await _refreshWebVoices();
      // Giọng Pāli: cùng chuỗi với PaliTtsHelper.
      _paliVoice = pickTtsLanguage(
        preferred: kPaliVoiceChain,
        supported: _supportedLanguages,
      );
      _initialized = true;
      await _configureMainVoice();
    } catch (_) {
      _initialized = true;
      _events.add(TrackPlayerEvent(TrackPlayerEventType.engineUnavailable));
    }
  }
}
