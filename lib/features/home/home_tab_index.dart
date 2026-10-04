// lib/features/home/home_tab_index.dart
//
// VDP 0.10.2 — index của tab đang mở trong thanh điều hướng dưới cùng của
// HomeScreen. Tách thành provider công khai (thay vì private trong
// home_screen.dart) để các tiện ích ngoài cây HomeScreen — tiêu biểu là
// thanh nghe nổi toàn app (GlobalAudioBubble) — có thể đưa người dùng quay
// về đúng tab gốc của phiên nghe, ví dụ tab Bảng Tương Ưng khi đang nghe
// playlist 121 Tâm / 52 Tâm Sở.

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Index tab Bảng Tương Ưng — tab đầu tiên trong BottomNavigationBar.
const int kHomeTabMatrix = 0;

/// StateProvider công khai cho tab đang chọn ở HomeScreen.
final homeTabIndexProvider = StateProvider<int>((ref) => kHomeTabMatrix);
