// lib/core/utils/shared_tts_engine.dart
//
// BUG FIX (VDP | Audio V1.9.2): trước bản này, `PaliTtsHelper` (phát âm Pāli ở
// detail sheet) và `TtsTrackPlayer` (đọc bài học / Nhân Duyên) mỗi nơi tự tạo
// một `FlutterTts()` riêng. Plugin `flutter_tts` chỉ dùng MỘT method channel
// cho toàn app — khi nơi thứ hai gọi `setCompletionHandler`/`setErrorHandler`/
// `setCancelHandler`, nó âm thầm THAY THẾ handler của nơi đầu. Hệ quả đúng như
// báo lỗi: đang nghe lặp (lặp mục / lặp cả danh sách) thì engine đọc xong câu
// đầu, chờ callback "đã xong" để đọc câu kế — nhưng callback đó giờ lại được
// đăng ký bởi FlutterTts() khác (vd. do người dùng từng bấm phát âm Pāli ở màn
// hình chi tiết Tâm), nên vòng đọc bị treo mãi mãi ở "đang phát" mà im lặng.
//
// Lớp này là ĐIỂM DUY NHẤT trong app tạo `FlutterTts()`. Mọi nơi cần nói đều
// đi qua `speakAndWait` (tự quản lý hoàn tất bằng Completer của chính lớp này,
// không dựa vào `awaitSpeakCompletion` nội bộ của plugin — tránh đúng kiểu
// xung đột multi-instance ở trên) hoặc dùng `raw` để cấu hình giọng/tốc độ.

import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';

/// `(text, startOffset, endOffset, word)` — vị trí từ đang đọc trong CÂU vừa
/// truyền cho `speak()` (không phải trong toàn bộ đoạn văn hiển thị). Dùng cho
/// karaoke tô sáng từng chữ (bật/tắt được trong Cài đặt).
typedef TtsProgressCallback = void Function(
  String text,
  int startOffset,
  int endOffset,
  String word,
);

class SharedTtsEngine {
  SharedTtsEngine._internal() {
    _tts
      ..setCompletionHandler(() => _finish(true))
      ..setCancelHandler(() => _finish(false))
      ..setErrorHandler((message) => _finish(false));
    try {
      // Không phải mọi nền tảng hỗ trợ progress handler (karaoke theo chữ là
      // tính năng tăng cường — thiếu nó không ảnh hưởng phát âm thanh).
      _tts.setProgressHandler((text, start, end, word) {
        try {
          onProgress?.call(text, start, end, word);
        } catch (_) {}
      });
    } catch (_) {}
  }

  static final SharedTtsEngine instance = SharedTtsEngine._internal();

  final FlutterTts _tts = FlutterTts();
  Completer<bool>? _pending;

  /// Gắn tạm thời bởi [TtsTrackPlayer] khi cần theo dõi từ đang đọc (karaoke
  /// tô chữ). Không ai gắn thì không tốn gì — mặc định null.
  TtsProgressCallback? onProgress;

  /// Truy cập trực tiếp engine để cấu hình (setLanguage/setSpeechRate/...).
  /// Không gọi `speak()` qua đây — dùng [speakAndWait] để đảm bảo đồng bộ hoàn
  /// tất đúng, tránh lặp lại chính xác lỗi mà lớp này sinh ra để sửa.
  FlutterTts get raw => _tts;

  /// Đọc [text] và CHỈ trả về khi engine báo đã xong (hoàn tất / bị hủy / lỗi)
  /// hoặc hết [timeout] — tự quản lý bằng Completer riêng của lớp (không dùng
  /// `awaitSpeakCompletion` của plugin, vốn dễ vỡ khi có >1 nơi gọi handler).
  Future<bool> speakAndWait(
    String text, {
    Duration timeout = const Duration(seconds: 20),
  }) async {
    // Một phiên trong app chỉ nên có một câu đang đọc tại một thời điểm (Audio
    // Coordinator). Nếu có lời gọi chồng lấn, đợi lượt trước kết thúc thay vì
    // giẫm lên Completer cũ — đây chính là lớp bảo vệ mà bug gốc đang thiếu.
    var guard = 0;
    while (_pending != null && guard < 50) {
      try {
        await _pending!.future;
      } catch (_) {}
      guard++;
    }
    final completer = Completer<bool>();
    _pending = completer;
    try {
      await _tts.speak(text);
    } catch (_) {
      _finish(false);
    }
    try {
      return await completer.future.timeout(timeout, onTimeout: () => false);
    } finally {
      if (identical(_pending, completer)) _pending = null;
    }
  }

  void _finish(bool success) {
    final pending = _pending;
    if (pending != null && !pending.isCompleted) pending.complete(success);
  }

  /// Dừng ngay — và giải phóng bất kỳ [speakAndWait] nào đang treo, để phiên
  /// gọi nó (vd. `TtsTrackPlayer._run`) thoát vòng lặp thay vì chờ hết timeout.
  Future<void> stop() async {
    _finish(false);
    try {
      await _tts.stop();
    } catch (_) {}
  }
}
