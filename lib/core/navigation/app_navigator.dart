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
