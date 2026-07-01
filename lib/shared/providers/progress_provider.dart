// lib/shared/providers/progress_provider.dart
// User Progress - Lưu local với SharedPreferences (Offline-First)

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/study_module.dart';

const _kProgressKey = 'vdp_user_progress';

class ProgressNotifier extends StateNotifier<UserProgress> {
  ProgressNotifier()
      : super(UserProgress(
          moduleProgress: const {},
          lastStudied: DateTime.now(),
        )) {
    _load();
  }

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final json = prefs.getString(_kProgressKey);
      if (json != null) {
        final data = jsonDecode(json) as Map<String, dynamic>;
        final mp = <String, ModuleProgress>{};
        final raw = data['moduleProgress'] as Map<String, dynamic>? ?? {};
        raw.forEach((k, v) {
          final m = v as Map<String, dynamic>;
          mp[k] = ModuleProgress(
            moduleId: k,
            completionPercentage:
                (m['completionPercentage'] as num?)?.toDouble() ?? 0,
            quizScore: (m['quizScore'] as int?) ?? 0,
            viewedCittaIds: List<String>.from(m['viewedCittaIds'] ?? []),
            completedAt: m['completedAt'] != null
                ? DateTime.tryParse(m['completedAt'] as String)
                : null,
          );
        });
        state = UserProgress(
          moduleProgress: mp,
          lastStudied:
              DateTime.tryParse(data['lastStudied'] as String? ?? '') ??
                  DateTime.now(),
          lastModuleId: data['lastModuleId'] as String?,
          allModulesUnlocked: data['allModulesUnlocked'] as bool? ?? false,
        );
      }
    } catch (_) {
      // Start fresh on error
    }
  }

  Future<void> _save() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final mp = <String, dynamic>{};
      state.moduleProgress.forEach((k, v) {
        mp[k] = {
          'completionPercentage': v.completionPercentage,
          'quizScore': v.quizScore,
          'viewedCittaIds': v.viewedCittaIds,
          'completedAt': v.completedAt?.toIso8601String(),
        };
      });
      await prefs.setString(
        _kProgressKey,
        jsonEncode({
          'moduleProgress': mp,
          'lastStudied': state.lastStudied.toIso8601String(),
          'lastModuleId': state.lastModuleId,
          'allModulesUnlocked': state.allModulesUnlocked,
        }),
      );
    } catch (_) {}
  }

  /// Ghi lại điểm quiz
  void recordQuizScore(String moduleId, double score) {
    final existing = state.moduleProgress[moduleId];
    final updated = ModuleProgress(
      moduleId: moduleId,
      completionPercentage: score,
      quizScore: score.round(),
      viewedCittaIds: existing?.viewedCittaIds ?? [],
      completedAt: score >= 80 ? DateTime.now() : existing?.completedAt,
    );
    state = UserProgress(
      moduleProgress: {...state.moduleProgress, moduleId: updated},
      lastStudied: DateTime.now(),
      lastModuleId: moduleId,
      allModulesUnlocked: state.allModulesUnlocked,
    );
    _save();
  }

  /// Đánh dấu đã xem một Tâm
  void markCittaViewed(String moduleId, String cittaId) {
    final existing = state.moduleProgress[moduleId];
    final viewed = {...(existing?.viewedCittaIds ?? []), cittaId}.toList();
    final updated = ModuleProgress(
      moduleId: moduleId,
      completionPercentage: existing?.completionPercentage ?? 0,
      quizScore: existing?.quizScore ?? 0,
      viewedCittaIds: List<String>.from(viewed),
    );
    state = UserProgress(
      moduleProgress: {...state.moduleProgress, moduleId: updated},
      lastStudied: DateTime.now(),
      lastModuleId: moduleId,
      allModulesUnlocked: state.allModulesUnlocked,
    );
    _save();
  }

  /// Reset toàn bộ tiến độ
  Future<void> resetAll() async {
    state = UserProgress(
      moduleProgress: const {},
      lastStudied: DateTime.now(),
      allModulesUnlocked: false,
    );
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kProgressKey);
  }

  /// Toggle mở khóa tất cả bài học
  void toggleAllModulesUnlocked(bool unlocked) {
    state = UserProgress(
      moduleProgress: state.moduleProgress,
      lastStudied: state.lastStudied,
      lastModuleId: state.lastModuleId,
      allModulesUnlocked: unlocked,
    );
    _save();
  }
}

final progressProvider = StateNotifierProvider<ProgressNotifier, UserProgress>(
  (ref) => ProgressNotifier(),
);
