// lib/core/navigation/app_navigator.dart
//
// V1.9.2 §1: thanh nghe nổi toàn app (`GlobalAudioBubble`) sống BÊN NGOÀI
// Navigator thật (nó được vẽ trong `MaterialApp.builder`, ở một nhánh cây
// widget song song với `child` — xem ghi chú trong main.dart). Vì vậy nó
// không có BuildContext nào là hậu duệ của Navigator để gọi
// `Navigator.of(context)`. Khoá toàn cục này là cách chuẩn để vẫn điều
// hướng được từ một overlay như vậy.
import 'package:flutter/widgets.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'vdpRootNavigator');

/// Observer của root Navigator — dùng để HomeScreen (và chỉ HomeScreen) biết
/// khi nào route của nó thật sự đang ở trên cùng, tức NavigationBar 5 tab
/// đang hiển thị và nhận chạm. Thanh nghe nổi toàn app (`GlobalAudioBubble`)
/// đọc trạng thái này (qua `homeTabsVisibleProvider`) để NÂNG MÌNH LÊN khỏi
/// vùng bấm của các tab — fix bug desktop-web bubble che NavigationBar
/// (VDP | Issue Web). Đăng ký ở `MaterialApp.navigatorObservers` trong
/// main.dart.
final RouteObserver<ModalRoute<void>> rootRouteObserver =
    RouteObserver<ModalRoute<void>>();
