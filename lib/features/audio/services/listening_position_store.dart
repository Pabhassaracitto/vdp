// lib/features/audio/services/listening_position_store.dart
//
// Lưu "thói quen nghe" offline-first (plan §8) — cùng pattern SharedPreferences
// với ProgressNotifier: đọc 1 lần lúc mở, ghi khi đổi/pause/đóng module.
//   audio.speed            → tốc độ dùng chung (H3)
//   audio.repeatMode       → chế độ lặp (H2)
//   audio.playScope        → phạm vi phát: tịnh tiến hay chỉ 1 mục (0.10.3)
//   audio.pos.<moduleId>   → vị trí nghe dở của từng module (H4)

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Vị trí nghe dở: track + cue.
class ListeningPosition {
  final String trackId;
  final int cueIndex;
  final int? positionMs;
  final DateTime? updatedAt;

  const ListeningPosition({required this.trackId, this.cueIndex = 0, this.positionMs, this.updatedAt});

  Map<String, Object?> toJson() => {
    'trackId': trackId, 'cueIndex': cueIndex,
    if (positionMs != null) 'positionMs': positionMs,
    if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
  };

  static ListeningPosition? tryParse(Object? raw) {
    if (raw is! Map) return null;
    final trackId = raw['trackId'];
    if (trackId is! String || trackId.trim().isEmpty) return null;
    final cueIndex = raw['cueIndex'];
    final positionMs = raw['positionMs'];
    final updatedAt = raw['updatedAt'];
    return ListeningPosition(
      trackId: trackId,
      cueIndex: cueIndex is int ? cueIndex : 0,
      positionMs: positionMs is num ? positionMs.toInt() : null,
      updatedAt: updatedAt is String ? DateTime.tryParse(updatedAt) : null,
    );
  }
}

abstract class ListeningPositionStore {
  Future<double?> loadSpeed();
  Future<void> saveSpeed(double speed);

  /// Trả về tên RepeatMode ('off' | 'one' | 'all') hoặc null nếu chưa lưu.
  Future<String?> loadRepeatMode();
  Future<void> saveRepeatMode(String mode);

  /// Trả về tên PlayScope ('onward' | 'single') hoặc null nếu chưa lưu
  /// (VDP 0.10.3 — góp ý "nghe 1 mục hay tịnh tiến"): 'single' = đọc xong mục
  /// đang chọn thì DỪNG, không nhảy sang mục kế tiếp.
  ///
  /// Có sẵn implementation mặc định để các store giả trong test (và bản cài
  /// trước 0.10.3, chưa từng ghi khoá này) không phải sửa gì — thiếu khoá thì
  /// hành vi cũ (tịnh tiến) được giữ nguyên.
  Future<String?> loadPlayScope() async => null;
  Future<void> savePlayScope(String scope) async {}

  Future<ListeningPosition?> loadPosition(String moduleId);
  Future<void> savePosition(String moduleId, ListeningPosition position);
}

class SharedPrefsListeningPositionStore implements ListeningPositionStore {
  const SharedPrefsListeningPositionStore();

  static const _speedKey = 'audio.speed';
  static const _repeatKey = 'audio.repeatMode';
  static const _playScopeKey = 'audio.playScope';
  static String _posKey(String moduleId) => 'audio.pos.$moduleId';
  static const _lastModuleKey = 'audio.lastModuleId';

  @override
  Future<double?> loadSpeed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_speedKey);
  }

  @override
  Future<void> saveSpeed(double speed) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_speedKey, speed);
  }

  @override
  Future<String?> loadRepeatMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_repeatKey);
  }

  @override
  Future<void> saveRepeatMode(String mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_repeatKey, mode);
  }

  @override
  Future<String?> loadPlayScope() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_playScopeKey);
  }

  @override
  Future<void> savePlayScope(String scope) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_playScopeKey, scope);
  }

  @override
  Future<ListeningPosition?> loadPosition(String moduleId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_posKey(moduleId));
    if (raw == null || raw.isEmpty) return null;
    try {
      return ListeningPosition.tryParse(jsonDecode(raw));
    } catch (_) {
      return null; // dữ liệu hỏng — coi như chưa nghe dở, không crash.
    }
  }

  @override
  Future<void> savePosition(String moduleId, ListeningPosition position) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_posKey(moduleId), jsonEncode(position.toJson()));
    await prefs.setString(_lastModuleKey, moduleId);
  }

  /// Used by the app-level Continue Listening row; absent on pre-P2 installs.
  static Future<String?> loadLastModuleId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastModuleKey);
  }
}
