// lib/features/matrix/matrix_listen_hint.dart
//
// Góp ý 0.10.3 §1 — "người dùng sẽ không biết nhấn giữ Tâm hay Tâm Sở để phát
// âm thanh": cử chỉ nhấn giữ vốn vô hình, nên lần đầu mở Bảng Tương Ưng app
// phải CHỦ ĐỘNG nói cho người học biết. Provider này giữ trạng thái "đã xem
// hướng dẫn nghe" (SharedPreferences) để tấm hướng dẫn chỉ hiện đúng MỘT lần
// cho mỗi người dùng/cài đặt, và tự tắt khi người dùng thật sự nhấn giữ nghe
// lần đầu (họ đã tự khám phá ra cử chỉ rồi).
//
// Trạng thái là `bool?` có chủ đích:
//   • null  — chưa đọc xong SharedPreferences → KHÔNG hiện gì (tránh nháy
//             tấm hướng dẫn lên rồi biến mất trên máy đã xem từ lâu);
//   • false — chưa từng xem → hiện tấm hướng dẫn;
//   • true  — đã xem/đã tự dùng → không hiện nữa.
//
// Cùng mẫu hình với `KaraokeSettingsNotifier`: mọi thao tác với bộ nhớ đều
// best-effort (mất trí nhớ thói quen không được làm crash tính năng).

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kMatrixListenHintSeenKey = 'vdp_matrix_listen_hint_seen';

class MatrixListenHintNotifier extends StateNotifier<bool?> {
  MatrixListenHintNotifier() : super(null) {
    _load();
  }

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      state = prefs.getBool(kMatrixListenHintSeenKey) ?? false;
    } catch (_) {
      // Không có SharedPreferences (test thuần Dart / nền tảng lạ): coi như
      // đã xem để không hiện hướng dẫn trong môi trường không lưu được trạng
      // thái — tránh lặp lại tấm hướng dẫn ở mọi lần mở.
      state = true;
    }
  }

  /// Đánh dấu đã xem — gọi khi người dùng bấm "Đã hiểu" hoặc tự nhấn giữ nghe.
  Future<void> markSeen() async {
    if (state == true) return;
    state = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kMatrixListenHintSeenKey, true);
    } catch (_) {
      // Best-effort.
    }
  }

  /// Cho phép xem lại hướng dẫn (dùng ở hộp Trợ giúp) — không đụng gì tới
  /// dữ liệu khác.
  Future<void> markUnseen() async {
    if (state == false) return;
    state = false;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(kMatrixListenHintSeenKey, false);
    } catch (_) {
      // Best-effort.
    }
  }
}

final matrixListenHintSeenProvider =
    StateNotifierProvider<MatrixListenHintNotifier, bool?>(
  (ref) => MatrixListenHintNotifier(),
);
