// lib/core/utils/pali_tts_helper.dart
// Helper class phát âm Pali qua TTS.
// Ưu tiên: hi-IN → en-US → ngôn ngữ mặc định của thiết bị.
// Toàn bộ lỗi được bọc try-catch — không bao giờ crash app.
//
// V1.9.2: dùng chung `SharedTtsEngine` với `TtsTrackPlayer` (đọc bài học) thay
// vì tự tạo `FlutterTts()` riêng — hai instance từng giẫm lên callback hoàn
// tất/lỗi của nhau (plugin chỉ có một method channel cho cả app), khiến phiên
// nghe bài học bị treo im lặng giữa chừng sau khi người dùng phát âm Pāli ở
// đây. Xem `shared_tts_engine.dart` để biết chi tiết.

import 'shared_tts_engine.dart';

/// Trạng thái khởi tạo của TTS engine
enum _TtsInitState { uninitialized, initializing, ready, unavailable }

class PaliTtsHelper {
  // ─── Singleton ───────────────────────────────────────────────────────────
  PaliTtsHelper._internal();
  static final PaliTtsHelper instance = PaliTtsHelper._internal();
  factory PaliTtsHelper() => instance;

  // ─── Private fields ──────────────────────────────────────────────────────
  final SharedTtsEngine _engine = SharedTtsEngine.instance;
  _TtsInitState _initState = _TtsInitState.uninitialized;
  String? _selectedLanguage;

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
      // Khởi tạo nếu chưa sẵn sàng (chỉ dò giọng hỗ trợ — xem _initialize).
      if (_initState == _TtsInitState.uninitialized) {
        await _initialize();
      }

      // Không hỗ trợ → thoát nhẹ nhàng
      if (_initState == _TtsInitState.unavailable) return false;

      // Nhường focus âm thanh: dừng phiên nghe bài học trước khi đọc Pāli.
      onBeforeSpeak?.call();

      // Engine dùng CHUNG với TtsTrackPlayer — áp lại giọng/tốc độ Pāli mỗi
      // lần nói (không chỉ lúc khởi tạo), vì phiên nghe bài học có thể đã đổi
      // giọng/tốc độ trên cùng engine trong lúc đang pause chờ ở đây.
      final previousProgressHook = _engine.onProgress;
      _engine.onProgress = null; // tránh karaoke của bài học nhận nhầm sự kiện
      try {
        if (_selectedLanguage != null) {
          await _engine.raw.setLanguage(_selectedLanguage!);
        }
        await _engine.raw.setSpeechRate(_speechRate);
        await _engine.raw.setPitch(_pitch);
        await _engine.raw.setVolume(_volume);

        // Dừng bất kỳ phát âm nào đang chạy rồi nói.
        await _engine.stop();
        return await _engine.speakAndWait(text);
      } finally {
        _engine.onProgress = previousProgressHook;
      }
    } catch (e) {
      return false;
    }
  }

  /// Dừng phát âm đang chạy (nếu có).
  Future<void> stop() async {
    try {
      await _engine.stop();
    } catch (e) {}
  }

  /// Hook điều phối focus âm thanh — được gán bởi AudioPlayerNotifier để
  /// core không phụ thuộc features: trước khi phát một từ Pāli, phiên nghe
  /// bài học đang chạy (nếu có) được pause, tránh hai engine nói chồng nhau.
  static void Function()? onBeforeSpeak;

  /// Giải phóng tài nguyên TTS — gọi khi app tắt hẳn.
  Future<void> dispose() async {
    try {
      await _engine.stop();
      _initState = _TtsInitState.uninitialized;
    } catch (e) {}
  }

  // ─── Private helpers ─────────────────────────────────────────────────────

  /// Khởi tạo: chỉ dò NGÔN NGỮ hỗ trợ một lần (cache). Giọng/tốc độ/âm lượng
  /// được áp lại mỗi lần `speak()` — xem ghi chú ở trên.
  Future<void> _initialize() async {
    // Guard: tránh khởi tạo song song
    if (_initState == _TtsInitState.initializing) return;
    _initState = _TtsInitState.initializing;

    try {
      // Lấy danh sách ngôn ngữ mà thiết bị hỗ trợ
      final dynamic rawLanguages = await _engine.raw.getLanguages;
      final supportedLanguages = _parseLanguages(rawLanguages);

      // Tìm ngôn ngữ ưu tiên đầu tiên mà thiết bị hỗ trợ
      String? selectedLanguage;
      for (final lang in _preferredLanguages) {
        if (_isLanguageSupported(lang, supportedLanguages)) {
          selectedLanguage = lang;
          break;
        }
      }
      _selectedLanguage = selectedLanguage;

      // Xử lý sự kiện lỗi từ engine (không crash app) — đã gắn ở cấp
      // SharedTtsEngine, không cần gắn lại riêng ở đây.

      _initState = _TtsInitState.ready;
    } catch (e) {
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
