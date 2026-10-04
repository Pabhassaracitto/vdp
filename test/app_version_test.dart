// test/app_version_test.dart
//
// VDP 0.10.2 — giữ 3 nguồn phiên bản đồng bộ:
//   1. `appVersionName` (hiển thị trong Cài đặt)
//   2. `version:` trong pubspec.yaml (build Android/iOS)
// Trước đây Cài đặt hardcode '0.2.0' trong khi release đã tới v0.10.x —
// test này chặn lỗi "hiển thị sai phiên bản" tái phát.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vdp_app/core/constants/app_version.dart';

void main() {
  test('appVersionName khớp version name trong pubspec.yaml', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final match =
        RegExp(r'^version:\s*(\d+\.\d+\.\d+)\+(\d+)', multiLine: true)
            .firstMatch(pubspec);
    expect(match, isNotNull,
        reason: 'pubspec.yaml phải khai báo version: x.y.z+n');
    expect(appVersionName, match!.group(1),
        reason:
            'Cài đặt hiển thị $appVersionName nhưng pubspec build ${match.group(1)}');
  });

  test('build number là số nguyên dương tăng dần', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final match =
        RegExp(r'^version:\s*(\d+\.\d+\.\d+)\+(\d+)', multiLine: true)
            .firstMatch(pubspec);
    final build = int.parse(match!.group(2)!);
    expect(build, greaterThan(0));
  });
}
