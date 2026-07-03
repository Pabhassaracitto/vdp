// lib/shared/providers/progress_provider.dart
// User Progress - Lưu local với SharedPreferences (Offline-First)

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/study_module.dart';

const _kProgressKey = 'vdp_user_progress';

class ProgressNotifier extends StateNotifier<UserProgress> {
  bool _warningDismissed = false;

  bool get warningDismissed => _warningDismissed;

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
      _warningDismissed = prefs.getBool('vdp_warning_dismissed') ?? false;
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
            reviewCount: (m['reviewCount'] as int?) ?? 0,
            lastReviewedAt: m['lastReviewedAt'] != null
                ? DateTime.tryParse(m['lastReviewedAt'] as String)
                : null,
            nextReviewDue: m['nextReviewDue'] != null
                ? DateTime.tryParse(m['nextReviewDue'] as String)
                : null,
          );
        });

        // Load bookmarks - backward compatible (mặc định rỗng nếu cũ)
        final bookmarkedCittaIds = Set<String>.from(
          data['bookmarkedCittaIds'] ?? <String>[],
        );
        final bookmarkedCetasikaIds = Set<String>.from(
          data['bookmarkedCetasikaIds'] ?? <String>[],
        );

        // Load personal notes - backward compatible
        final notesRaw = data['personalNotes'] as Map<String, dynamic>? ?? {};
        final personalNotes = Map<String, String>.from(notesRaw);

        state = UserProgress(
          moduleProgress: mp,
          lastStudied:
              DateTime.tryParse(data['lastStudied'] as String? ?? '') ??
                  DateTime.now(),
          lastModuleId: data['lastModuleId'] as String?,
          allModulesUnlocked: data['allModulesUnlocked'] as bool? ?? false,
          bookmarkedCittaIds: bookmarkedCittaIds,
          bookmarkedCetasikaIds: bookmarkedCetasikaIds,
          personalNotes: personalNotes,
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
          'reviewCount': v.reviewCount,
          'lastReviewedAt': v.lastReviewedAt?.toIso8601String(),
          'nextReviewDue': v.nextReviewDue?.toIso8601String(),
        };
      });
      await prefs.setString(
        _kProgressKey,
        jsonEncode({
          'moduleProgress': mp,
          'lastStudied': state.lastStudied.toIso8601String(),
          'lastModuleId': state.lastModuleId,
          'allModulesUnlocked': state.allModulesUnlocked,
          'bookmarkedCittaIds': state.bookmarkedCittaIds.toList(),
          'bookmarkedCetasikaIds': state.bookmarkedCetasikaIds.toList(),
          'personalNotes': state.personalNotes,
        }),
      );
    } catch (_) {}
  }

  /// Ghi lại điểm quiz và cập nhật logic Spaced Repetition
  /// Cấu trúc khoảng cách: 1, 3, 7, 14, 30 ngày cho các mốc điểm 80+
  void recordQuizScore(String moduleId, double score) {
    final existing = state.moduleProgress[moduleId];
    
    // Spaced Repetition Logic (Simple point-based intervals)
    int reviewCount = (existing?.reviewCount ?? 0) + 1;
    DateTime nextReviewDue = DateTime.now();
    
    if (score >= 80) {
      // Tăng khoảng cách dựa trên số lần ôn tốt
      final daysToAdd = [1, 3, 7, 14, 30][reviewCount < 5 ? reviewCount - 1 : 4];
      nextReviewDue = DateTime.now().add(Duration(days: daysToAdd));
    } else {
      // Nếu điểm thấp, ôn lại ngay sớm hơn (vẫn dùng count nhưng reset/giảm hiệu quả)
      reviewCount = (reviewCount > 1) ? reviewCount - 1 : 1;
      nextReviewDue = DateTime.now().add(const Duration(days: 1));
    }

    final updated = ModuleProgress(
      moduleId: moduleId,
      completionPercentage: score,
      quizScore: score.round(),
      viewedCittaIds: existing?.viewedCittaIds ?? [],
      completedAt: score >= 80 ? (existing?.completedAt ?? DateTime.now()) : existing?.completedAt,
      reviewCount: reviewCount,
      lastReviewedAt: DateTime.now(),
      nextReviewDue: nextReviewDue,
    );
    
    state = UserProgress(
      moduleProgress: {...state.moduleProgress, moduleId: updated},
      lastStudied: DateTime.now(),
      lastModuleId: moduleId,
      allModulesUnlocked: state.allModulesUnlocked,
      bookmarkedCittaIds: state.bookmarkedCittaIds,
      bookmarkedCetasikaIds: state.bookmarkedCetasikaIds,
      personalNotes: state.personalNotes,
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
      reviewCount: existing?.reviewCount ?? 0,
      lastReviewedAt: existing?.lastReviewedAt,
      nextReviewDue: existing?.nextReviewDue,
    );
    state = UserProgress(
      moduleProgress: {...state.moduleProgress, moduleId: updated},
      lastStudied: DateTime.now(),
      lastModuleId: moduleId,
      allModulesUnlocked: state.allModulesUnlocked,
      bookmarkedCittaIds: state.bookmarkedCittaIds,
      bookmarkedCetasikaIds: state.bookmarkedCetasikaIds,
      personalNotes: state.personalNotes,
    );
    _save();
  }

  // ─── Bookmark methods ────────────────────────────────────────────

  /// Toggle bookmark cho Citta
  void toggleCittaBookmark(String cittaId) {
    final set = Set<String>.from(state.bookmarkedCittaIds);
    if (set.contains(cittaId)) {
      set.remove(cittaId);
    } else {
      set.add(cittaId);
    }
    state = UserProgress(
      moduleProgress: state.moduleProgress,
      lastStudied: state.lastStudied,
      lastModuleId: state.lastModuleId,
      allModulesUnlocked: state.allModulesUnlocked,
      bookmarkedCittaIds: set,
      bookmarkedCetasikaIds: state.bookmarkedCetasikaIds,
      personalNotes: state.personalNotes,
    );
    _save();
  }

  /// Toggle bookmark cho Cetasika
  void toggleCetasikaBookmark(String cetasikaId) {
    final set = Set<String>.from(state.bookmarkedCetasikaIds);
    if (set.contains(cetasikaId)) {
      set.remove(cetasikaId);
    } else {
      set.add(cetasikaId);
    }
    state = UserProgress(
      moduleProgress: state.moduleProgress,
      lastStudied: state.lastStudied,
      lastModuleId: state.lastModuleId,
      allModulesUnlocked: state.allModulesUnlocked,
      bookmarkedCittaIds: state.bookmarkedCittaIds,
      bookmarkedCetasikaIds: set,
      personalNotes: state.personalNotes,
    );
    _save();
  }

  /// Kiểm tra Citta đã được bookmark chưa
  bool isCittaBookmarked(String id) => state.bookmarkedCittaIds.contains(id);

  /// Kiểm tra Cetasika đã được bookmark chưa
  bool isCetasikaBookmarked(String id) =>
      state.bookmarkedCetasikaIds.contains(id);

  // ─── Personal Notes methods ──────────────────────────────────────

  /// Lưu ghi chú cá nhân
  /// Key format: citta_CI_001, cetasika_CS_PHASSA
  void saveNote(String key, String note) {
    final notes = Map<String, String>.from(state.personalNotes);
    if (note.trim().isEmpty) {
      notes.remove(key);
    } else {
      notes[key] = note;
    }
    state = UserProgress(
      moduleProgress: state.moduleProgress,
      lastStudied: state.lastStudied,
      lastModuleId: state.lastModuleId,
      allModulesUnlocked: state.allModulesUnlocked,
      bookmarkedCittaIds: state.bookmarkedCittaIds,
      bookmarkedCetasikaIds: state.bookmarkedCetasikaIds,
      personalNotes: notes,
    );
    _save();
  }

  /// Xóa ghi chú cá nhân
  void deleteNote(String key) {
    final notes = Map<String, String>.from(state.personalNotes);
    notes.remove(key);
    state = UserProgress(
      moduleProgress: state.moduleProgress,
      lastStudied: state.lastStudied,
      lastModuleId: state.lastModuleId,
      allModulesUnlocked: state.allModulesUnlocked,
      bookmarkedCittaIds: state.bookmarkedCittaIds,
      bookmarkedCetasikaIds: state.bookmarkedCetasikaIds,
      personalNotes: notes,
    );
    _save();
  }

  /// Lấy ghi chú cá nhân theo key
  String? getNote(String key) => state.personalNotes[key];

  // ─── Reset & Unlock ──────────────────────────────────────────────

  /// Reset toàn bộ tiến độ (bao gồm bookmark + notes)
  Future<void> resetAll() async {
    state = UserProgress(
      moduleProgress: const {},
      lastStudied: DateTime.now(),
      allModulesUnlocked: false,
      bookmarkedCittaIds: const {},
      bookmarkedCetasikaIds: const {},
      personalNotes: const {},
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
      bookmarkedCittaIds: state.bookmarkedCittaIds,
      bookmarkedCetasikaIds: state.bookmarkedCetasikaIds,
      personalNotes: state.personalNotes,
    );
    _save();
  }

  Future<void> dismissWarning() async {
    _warningDismissed = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('vdp_warning_dismissed', true);
  }

  Future<void> resetWarningDismissed() async {
    _warningDismissed = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('vdp_warning_dismissed');
  }
}

final progressProvider = StateNotifierProvider<ProgressNotifier, UserProgress>(
  (ref) => ProgressNotifier(),
);

/// Provider phụ: đếm tổng số bookmark (citta + cetasika)
final bookmarkCountProvider = Provider<int>((ref) {
  final p = ref.watch(progressProvider);
  return p.bookmarkedCittaIds.length + p.bookmarkedCetasikaIds.length;
});
