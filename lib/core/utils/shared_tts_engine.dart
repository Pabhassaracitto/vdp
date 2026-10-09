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
      ..setStartHandler(_markStarted)
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
  Completer<bool>? _startSignal;

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
  }) =>
      _speakAndWait(text, timeout: timeout);

  /// Đọc [text] và trả về `true` NGAY KHI engine báo đã bắt đầu phát
  /// (`onstart`), không chờ `onend`.
  ///
  /// Dùng cho "Nghe thử" giọng trong Cài đặt (IN4-74): một số bản cài Web
  /// Speech không bao giờ phát sự kiện `onend` cho giọng online, nên chờ hoàn
  /// tất sẽ báo sai "không phát được" dù người dùng đã nghe thấy tiếng. Nếu
  /// engine không phát `onstart` nhưng lại báo hoàn tất thành công thì vẫn
  /// tính là đã phát. Trả `false` khi lỗi/bị hủy hoặc quá [startTimeout].
  /// Phần đọc vẫn tiếp tục chạy nền và tự giải phóng sau [completionTimeout].
  Future<bool> speakAndConfirmStart(
    String text, {
    Duration startTimeout = const Duration(seconds: 8),
    Duration completionTimeout = const Duration(seconds: 20),
  }) async {
    final started = Completer<bool>();
    final done = _speakAndWait(
      text,
      timeout: completionTimeout,
      startSignal: started,
    );
    unawaited(done.then((completed) {
      if (!started.isCompleted) started.complete(completed);
    }));
    try {
      return await started.future.timeout(
        startTimeout,
        onTimeout: () => false,
      );
    } finally {
      if (identical(_startSignal, started)) _startSignal = null;
    }
  }

  Future<bool> _speakAndWait(
    String text, {
    required Duration timeout,
    Completer<bool>? startSignal,
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
    // Gắn tín hiệu "đã bắt đầu" ngay trước speak() để không nhận nhầm
    // `onstart` của một câu trước đó.
    _startSignal = startSignal;
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

  void _markStarted() {
    final signal = _startSignal;
    _startSignal = null;
    if (signal != null && !signal.isCompleted) signal.complete(true);
  }

  void _finish(bool success) {
    final signal = _startSignal;
    if (signal != null && !signal.isCompleted) {
      // Hoàn tất thành công mà thiếu `onstart` vẫn nghĩa là đã phát.
      _startSignal = null;
      signal.complete(success);
    }
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
