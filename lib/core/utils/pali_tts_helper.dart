// lib/core/utils/pali_tts_helper.dart
// Helper class phát âm Pali qua TTS.
// Ưu tiên: hi-IN → en-US → ngôn ngữ mặc định của thiết bị.
// Toàn bộ lỗi được bọc try-catch — không bao giờ crash app.

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

/// Trạng thái khởi tạo của TTS engine
enum _TtsInitState { uninitialized, initializing, ready, unavailable }

class PaliTtsHelper {
  // ─── Singleton ───────────────────────────────────────────────────────────
  PaliTtsHelper._internal();
  static final PaliTtsHelper instance = PaliTtsHelper._internal();
  factory PaliTtsHelper() => instance;

  // ─── Private fields ──────────────────────────────────────────────────────
  final FlutterTts _tts = FlutterTts();
  _TtsInitState _initState = _TtsInitState.uninitialized;

  /// Ngôn ngữ ưu tiên để phát âm Pali (thứ tự giảm dần)
  static const List<String> _preferredLanguages = ['hi-IN', 'en-US', 'en-GB'];

  /// Tốc độ đọc — chậm hơn mặc định để nghe rõ từng âm tiết
  static const double _speechRate = 0.45;

  /// Cao độ giọng
  static const double _pitch = 1.0;

  /// Âm lượng (0.0 – 1.0)
  static const double _volume = 1.0;

  // ─── Public API ──────────────────────────────────────────────────────────

  /// Phát âm [text] dưới dạng Pali.
  /// Tự động khởi tạo TTS lần đầu tiên.
  /// Trả về `true` nếu phát thành công, `false` nếu không hỗ trợ.
  Future<bool> speak(String text) async {
    if (text.trim().isEmpty) return false;

    try {
      // Khởi tạo nếu chưa sẵn sàng
      if (_initState == _TtsInitState.uninitialized) {
        await _initialize();
      }

      // Không hỗ trợ → thoát nhẹ nhàng
      if (_initState == _TtsInitState.unavailable) return false;

      // Dừng bất kỳ phát âm nào đang chạy
      await _tts.stop();

      // Phát âm
      final result = await _tts.speak(text);
      return result == 1; // flutter_tts trả về 1 khi thành công
    } catch (e, stack) {
      return false;
    }
  }

  /// Dừng phát âm đang chạy (nếu có).
  Future<void> stop() async {
    try {
      await _tts.stop();
    } catch (e) {}
  }

  /// Giải phóng tài nguyên TTS — gọi khi app tắt hẳn.
  Future<void> dispose() async {
    try {
      await _tts.stop();
      _initState = _TtsInitState.uninitialized;
    } catch (e) {}
  }

  // ─── Private helpers ─────────────────────────────────────────────────────

  /// Khởi tạo FlutterTts và chọn ngôn ngữ phù hợp nhất.
  Future<void> _initialize() async {
    // Guard: tránh khởi tạo song song
    if (_initState == _TtsInitState.initializing) return;
    _initState = _TtsInitState.initializing;

    try {
      // Lấy danh sách ngôn ngữ mà thiết bị hỗ trợ
      final dynamic rawLanguages = await _tts.getLanguages;
      final supportedLanguages = _parseLanguages(rawLanguages);

      // Tìm ngôn ngữ ưu tiên đầu tiên mà thiết bị hỗ trợ
      String? selectedLanguage;
      for (final lang in _preferredLanguages) {
        if (_isLanguageSupported(lang, supportedLanguages)) {
          selectedLanguage = lang;
          break;
        }
      }

      // Áp dụng cấu hình
      if (selectedLanguage != null) {
        await _tts.setLanguage(selectedLanguage);
      } else {
        // Fallback: dùng ngôn ngữ mặc định của engine
      }

      await _tts.setSpeechRate(_speechRate);
      await _tts.setPitch(_pitch);
      await _tts.setVolume(_volume);

      // Xử lý sự kiện lỗi từ engine (không crash app)
      _tts.setErrorHandler((message) {});

      _initState = _TtsInitState.ready;
    } catch (e, stack) {
      _initState = _TtsInitState.unavailable;
    }
  }

  /// Parse kết quả `getLanguages` — API trả về dynamic (List hoặc String).
  List<String> _parseLanguages(dynamic raw) {
    if (raw == null) return [];
    if (raw is List) {
      return raw.map((e) => e.toString()).toList();
    }
    if (raw is String) {
      return raw.split(',').map((s) => s.trim()).toList();
    }
    return [];
  }

  /// Kiểm tra ngôn ngữ có trong danh sách hỗ trợ không.
  /// So sánh không phân biệt hoa thường và cả dạng "hi" lẫn "hi-IN".
  bool _isLanguageSupported(String lang, List<String> supported) {
    final langLower = lang.toLowerCase();
    final langPrefix = langLower.split('-').first; // "hi" từ "hi-IN"
    return supported.any((s) {
      final sLower = s.toLowerCase();
      return sLower == langLower || sLower.startsWith(langPrefix);
    });
  }
}
