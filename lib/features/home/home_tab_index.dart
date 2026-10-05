// lib/features/home/home_tab_index.dart
//
// VDP 0.10.2 — index của tab đang mở trong thanh điều hướng dưới cùng của
// HomeScreen. Tách thành provider công khai (thay vì private trong
// home_screen.dart) để các tiện ích ngoài cây HomeScreen — tiêu biểu là
// thanh nghe nổi toàn app (GlobalAudioBubble) — có thể đưa người dùng quay
// về đúng tab gốc của phiên nghe, ví dụ tab Bảng Tương Ưng khi đang nghe
// playlist 121 Tâm / 52 Tâm Sở.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/navigation/app_navigator.dart';

/// Index tab Bảng Tương Ưng — tab đầu tiên trong BottomNavigationBar.
const int kHomeTabMatrix = 0;

/// StateProvider công khai cho tab đang chọn ở HomeScreen.
final homeTabIndexProvider = StateProvider<int>((ref) => kHomeTabMatrix);

/// VDP | Issue Web — route đáy (HomeScreen, chứa NavigationBar 5 tab) có đang
/// ở TRÊN CÙNG của root Navigator hay không, tức các tab đang thật sự hiển
/// thị và nhận chạm. Cần phân biệt "HomeScreen còn trong cây widget" (luôn
/// đúng — route dưới không bị dispose khi có route đẩy lên) với "HomeScreen
/// đang nhìn thấy được"; chỉ cái sau mới có NavigationBar cần nhường chỗ.
///
/// Thanh nghe nổi toàn app (`GlobalAudioBubble`) watch provider này để nâng
/// đáy lên `navBarHeight + margin` khi true — không bao giờ đè vùng bấm của
/// các tab (bug desktop-web: bubble ở sát đáy che mất NavigationBar 80px).
final homeTabsVisibleProvider = StateProvider<bool>((ref) => false);

/// VDP | Issue Web — mixin cho `ConsumerState` của màn hình các tab gốc
/// (HomeScreen): đồng bộ [homeTabsVisibleProvider] theo vòng đờ route của nó
/// qua [rootRouteObserver].
///
/// Cách dùng — thêm vào khai báo State (thứ tự các mixin quan trọng, mixin
/// này phải đứng SAU [RouteAware] vì nó ghi đè các callback của RouteAware):
/// ```dart
/// class _HomeScreenState extends ConsumerState<HomeScreen>
///     with RouteAware, HomeTabsVisibilitySync { ... }
/// ```
/// rồi gọi [syncHomeTabsVisibility] trong `didChangeDependencies` và
/// [unsyncHomeTabsVisibility] trong `dispose` (trước `super.dispose()`).
mixin HomeTabsVisibilitySync<T extends ConsumerStatefulWidget>
    on ConsumerState<T>, RouteAware {
  /// Gọi trong `didChangeDependencies`: đăng ký với [rootRouteObserver] và
  /// ghi trạng thái hiện tại (`route.isCurrent` là sự thật tức thởi, tự khôi
  /// phục được cả khi lỡ một callback điều hướng nào đó).
  void syncHomeTabsVisibility() {
    final route = ModalRoute.of(context);
    if (route == null) {
      _writeHomeTabsVisibility(false);
      return;
    }
    rootRouteObserver.subscribe(this, route);
    _writeHomeTabsVisibility(route.isCurrent);
  }

  /// Gọi trong `dispose` (trước khi huỷ tài nguyên khác): gỡ đăng ký và báo
  /// các tab không còn hiển thị.
  void unsyncHomeTabsVisibility() {
    rootRouteObserver.unsubscribe(this);
    _writeHomeTabsVisibility(false);
  }

  @override
  void didPushNext() => _writeHomeTabsVisibility(false);

  @override
  void didPopNext() => _writeHomeTabsVisibility(true);

  /// Chỉ ghi khi giá trị đổi — tránh vòng rebuild thừa giữa provider và các
  /// widget đang watch nó (GlobalAudioBubble).
  void _writeHomeTabsVisibility(bool visible) {
    final notifier = ref.read(homeTabsVisibleProvider.notifier);
    if (notifier.state != visible) {
      notifier.state = visible;
    }
  }
}
