// lib/features/audio/providers/karaoke_settings_provider.dart
//
// VDP | Audio V1.9.2 §2 — tô sáng kiểu karaoke theo audio: bật/tắt tổng, và
// 2 lớp độc lập (tô cả đoạn / tô từng chữ) vì tô từng chữ dựa trên thời gian
// ƯỚC TÍNH từ `flutter_tts.setProgressHandler` (không phải mọi thiết bị hỗ
// trợ, và độ chính xác thấp hơn tô cả đoạn) — người dùng nên tự chọn mức độ
// phù hợp với mình thay vì bị áp một hành vi duy nhất.
//
// Tách khỏi `settingsProvider` (settings_screen.dart) có chủ đích: đó là
// StateProvider đơn giản, KHÔNG lưu SharedPreferences; cài đặt nghe cần nhớ
// qua lần mở app sau nên cần notifier + persist riêng (cùng mẫu hình với
// `ProgressNotifier` ở shared/providers/progress_provider.dart).

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kKaraokeEnabledKey = 'vdp_karaoke_enabled';
const _kLineHighlightKey = 'vdp_karaoke_line_highlight';
const _kWordHighlightKey = 'vdp_karaoke_word_highlight';

class KaraokeSettings {
  /// Bật/tắt tổng — tắt thì cả 2 lớp dưới đây không hiển thị dù đang bật.
  final bool karaokeEnabled;

  /// Tô nền cả đoạn/cue đang đọc (nguồn: sự kiện `cueStarted`, mọi thiết bị
  /// đều có — đáng tin cậy).
  final bool lineHighlightEnabled;

  /// Tô từng chữ đang đọc (nguồn: `wordProgress`, chỉ có trên thiết bị hỗ
  /// `setProgressHandler` của flutter_tts — ước tính, mặc định TẮT).
  final bool wordHighlightEnabled;

  const KaraokeSettings({
    this.karaokeEnabled = true,
    this.lineHighlightEnabled = true,
    this.wordHighlightEnabled = false,
  });

  bool get showLineHighlight => karaokeEnabled && lineHighlightEnabled;
  bool get showWordHighlight => karaokeEnabled && wordHighlightEnabled;

  KaraokeSettings copyWith({
    bool? karaokeEnabled,
    bool? lineHighlightEnabled,
    bool? wordHighlightEnabled,
  }) {
    return KaraokeSettings(
      karaokeEnabled: karaokeEnabled ?? this.karaokeEnabled,
      lineHighlightEnabled: lineHighlightEnabled ?? this.lineHighlightEnabled,
      wordHighlightEnabled: wordHighlightEnabled ?? this.wordHighlightEnabled,
    );
  }
}

class KaraokeSettingsNotifier extends StateNotifier<KaraokeSettings> {
  KaraokeSettingsNotifier() : super(const KaraokeSettings()) {
    _load();
  }

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      state = KaraokeSettings(
        karaokeEnabled: prefs.getBool(_kKaraokeEnabledKey) ?? true,
        lineHighlightEnabled: prefs.getBool(_kLineHighlightKey) ?? true,
        wordHighlightEnabled: prefs.getBool(_kWordHighlightKey) ?? false,
      );
    } catch (_) {
      // Không có SharedPreferences (vd. test thuần Dart) — giữ mặc định.
    }
  }

  Future<void> setKaraokeEnabled(bool value) async {
    state = state.copyWith(karaokeEnabled: value);
    await _saveBool(_kKaraokeEnabledKey, value);
  }

  Future<void> setLineHighlightEnabled(bool value) async {
    state = state.copyWith(lineHighlightEnabled: value);
    await _saveBool(_kLineHighlightKey, value);
  }

  Future<void> setWordHighlightEnabled(bool value) async {
    state = state.copyWith(wordHighlightEnabled: value);
    await _saveBool(_kWordHighlightKey, value);
  }

  Future<void> _saveBool(String key, bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key, value);
    } catch (_) {
      // Best-effort — mất bộ nhớ thói quen không nên làm crash tính năng.
    }
  }
}

final karaokeSettingsProvider =
    StateNotifierProvider<KaraokeSettingsNotifier, KaraokeSettings>(
  (ref) => KaraokeSettingsNotifier(),
);
