// lib/core/constants/app_version.dart
//
// VDP 0.10.2 — nguồn sự thật DUY NHẤT cho phiên bản hiển thị trong app.
// Trước đây màn Cài đặt hardcode '0.2.0' trong khi pubspec là một số khác
// và tag release lại là số khác nữa (v0.10.1) — ba chỗ, ba con số.
//
// Giữ đồng bộ 3 nơi khi release:
//   1. `appVersionName` bên dưới (hiển thị trong app).
//   2. `version:` trong pubspec.yaml (dùng khi build Android/iOS).
//   3. Tag git `v<version>` kích hoạt bản build release.
// pubspec không thể đọc lúc runtime mà không cần plugin, nên file này là
// bản sao được QA đối chiếu bằng test (test/app_version_test.dart).

/// Version name hiển thị trong Cài đặt — PHẢI khớp `version:` ở pubspec.yaml.
const String appVersionName = '0.10.2';
