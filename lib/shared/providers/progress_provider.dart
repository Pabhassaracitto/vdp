// lib/shared/providers/progress_provider.dart
// User Progress — Offline-First với SharedPreferences
// Milestone 3 Fix: overallProgress trả về 0.0–1.0 (Bug 5.3: 9200% → 92%)
// SM-2 Simplified, null-safe, đầy đủ serialize/deserialize

import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/study_module.dart';

// ─── Constants ────────────────────────────────────────────────────────────────

const _kProgressKey = 'vdp_user_progress';
const _kWarningKey = 'vdp_warning_dismissed';

/// SM-2 Simplified intervals (ngày).
const _kSm2Intervals = <int>[1, 3, 7, 14, 30];

/// Ngưỡng điểm "lần ôn thành công" (0–100).
const _kPassThreshold = 80.0;

// ─── SM-2 Helper ─────────────────────────────────────────────────────────────

_Sm2Result _computeSm2({
  required double score,
  required int consecutivePasses,
  required double previousEf,
}) {
  final q = (score / 100 * 5).clamp(0.0, 5.0);
  final newEf = math.max(
    1.3,
    previousEf + 0.1 - (5 - q) * (0.08 + (5 - q) * 0.02),
  );

  if (score < _kPassThreshold) {
    return _Sm2Result(
      nextIntervalDays: 1,
      newEf: newEf,
      newConsecutivePasses: 0,
    );
  }

  final newConsecutive = consecutivePasses + 1;
  final intervalIndex =
      (newConsecutive - 1).clamp(0, _kSm2Intervals.length - 1);

  return _Sm2Result(
    nextIntervalDays: _kSm2Intervals[intervalIndex],
    newEf: newEf,
    newConsecutivePasses: newConsecutive,
  );
}

class _Sm2Result {
  final int nextIntervalDays;
  final double newEf;
  final int newConsecutivePasses;

  const _Sm2Result({
    required this.nextIntervalDays,
    required this.newEf,
    required this.newConsecutivePasses,
  });
}

// ─── ProgressNotifier ─────────────────────────────────────────────────────────

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

  // ── Load ─────────────────────────────────────────────────────────────────

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _warningDismissed = prefs.getBool(_kWarningKey) ?? false;

      final raw = prefs.getString(_kProgressKey);
      if (raw == null) return;

      final data = jsonDecode(raw) as Map<String, dynamic>;
      final mp = <String, ModuleProgress>{};
      final mpRaw = (data['moduleProgress'] as Map<String, dynamic>?) ?? {};

      mpRaw.forEach((id, value) {
        final m = value as Map<String, dynamic>;
        mp[id] = ModuleProgress(
          moduleId: id,
          // ── BUG FIX NOTE: completionPercentage được lưu ở thang 0–100.
          // overallProgress sẽ chia cho 100 để trả về 0.0–1.0.
          completionPercentage:
              (m['completionPercentage'] as num?)?.toDouble() ?? 0.0,
          quizScore: (m['quizScore'] as num?)?.toInt() ?? 0,
          viewedCittaIds: List<String>.from(m['viewedCittaIds'] as List? ?? []),
          completedAt: _tryParseDate(m['completedAt']),
          reviewCount: (m['reviewCount'] as num?)?.toInt() ?? 0,
          consecutivePasses: (m['consecutivePasses'] as num?)?.toInt() ?? 0,
          easinessFactor: (m['easinessFactor'] as num?)?.toDouble() ?? 2.5,
          lastReviewedAt: _tryParseDate(m['lastReviewedAt']),
          nextReviewDue: _tryParseDate(m['nextReviewDue']),
        );
      });

      final bookmarkedCittaIds = Set<String>.from(
        data['bookmarkedCittaIds'] as List? ?? [],
      );
      final bookmarkedCetasikaIds = Set<String>.from(
        data['bookmarkedCetasikaIds'] as List? ?? [],
      );
      final notesRaw = (data['personalNotes'] as Map<String, dynamic>?) ?? {};
      final personalNotes = notesRaw.map((k, v) => MapEntry(k, v as String));

      state = UserProgress(
        moduleProgress: mp,
        lastStudied: _tryParseDate(data['lastStudied']) ?? DateTime.now(),
        lastModuleId: data['lastModuleId'] as String?,
        allModulesUnlocked: data['allModulesUnlocked'] as bool? ?? false,
        bookmarkedCittaIds: bookmarkedCittaIds,
        bookmarkedCetasikaIds: bookmarkedCetasikaIds,
        personalNotes: personalNotes,
      );
    } catch (e, st) {
      assert(() {
        return true;
      }());
    }
  }

  // ── Save ─────────────────────────────────────────────────────────────────

  Future<void> _save() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final mpJson = <String, dynamic>{};

      state.moduleProgress.forEach((id, v) {
        mpJson[id] = {
          'completionPercentage': v.completionPercentage,
          'quizScore': v.quizScore,
          'viewedCittaIds': v.viewedCittaIds,
          'completedAt': v.completedAt?.toIso8601String(),
          'reviewCount': v.reviewCount,
          'consecutivePasses': v.consecutivePasses,
          'easinessFactor': v.easinessFactor,
          'lastReviewedAt': v.lastReviewedAt?.toIso8601String(),
          'nextReviewDue': v.nextReviewDue?.toIso8601String(),
        };
      });

      await prefs.setString(
        _kProgressKey,
        jsonEncode({
          'moduleProgress': mpJson,
          'lastStudied': state.lastStudied.toIso8601String(),
          'lastModuleId': state.lastModuleId,
          'allModulesUnlocked': state.allModulesUnlocked,
          'bookmarkedCittaIds': state.bookmarkedCittaIds.toList(),
          'bookmarkedCetasikaIds': state.bookmarkedCetasikaIds.toList(),
          'personalNotes': state.personalNotes,
        }),
      );
    } catch (e) {
      assert(() {
        return true;
      }());
    }
  }

  // ── Quiz & Spaced Repetition ──────────────────────────────────────────────

  /// Ghi điểm quiz và cập nhật SM-2.
  /// [score]: 0.0–100.0
  void recordQuizScore(String moduleId, double score) {
    assert(
      score >= 0 && score <= 100,
      'score phải trong khoảng 0–100, nhận được: $score',
    );

    final existing = state.moduleProgress[moduleId];
    final sm2 = _computeSm2(
      score: score,
      consecutivePasses: existing?.consecutivePasses ?? 0,
      previousEf: existing?.easinessFactor ?? 2.5,
    );

    final now = DateTime.now();
    final passed = score >= _kPassThreshold;
    final completedAt =
        passed ? (existing?.completedAt ?? now) : existing?.completedAt;

    // completionPercentage lưu ở thang 0–100
    // overallProgress provider sẽ normalize về 0.0–1.0 khi cần
    final updated = ModuleProgress(
      moduleId: moduleId,
      completionPercentage: score, // 0–100, KHÔNG nhân thêm
      quizScore: score.round(),
      viewedCittaIds: List<String>.from(existing?.viewedCittaIds ?? []),
      completedAt: completedAt,
      reviewCount: (existing?.reviewCount ?? 0) + 1,
      consecutivePasses: sm2.newConsecutivePasses,
      easinessFactor: sm2.newEf,
      lastReviewedAt: now,
      nextReviewDue: now.add(Duration(days: sm2.nextIntervalDays)),
    );

    state = _copyStateWith(
      moduleProgress: {...state.moduleProgress, moduleId: updated},
      lastStudied: now,
      lastModuleId: moduleId,
    );
    _save();
  }

  // ── Citta Viewed ──────────────────────────────────────────────────────────

  void markCittaViewed(String moduleId, String cittaId) {
    final existing = state.moduleProgress[moduleId];
    final viewed = <String>{...?existing?.viewedCittaIds, cittaId};

    final updated = ModuleProgress(
      moduleId: moduleId,
      completionPercentage: existing?.completionPercentage ?? 0,
      quizScore: existing?.quizScore ?? 0,
      viewedCittaIds: viewed.toList(),
      completedAt: existing?.completedAt,
      reviewCount: existing?.reviewCount ?? 0,
      consecutivePasses: existing?.consecutivePasses ?? 0,
      easinessFactor: existing?.easinessFactor ?? 2.5,
      lastReviewedAt: existing?.lastReviewedAt,
      nextReviewDue: existing?.nextReviewDue,
    );

    state = _copyStateWith(
      moduleProgress: {...state.moduleProgress, moduleId: updated},
      lastStudied: DateTime.now(),
      lastModuleId: moduleId,
    );
    _save();
  }

  // ── Bookmarks ─────────────────────────────────────────────────────────────

  bool toggleCittaBookmark(String cittaId) {
    final updated = Set<String>.from(state.bookmarkedCittaIds);
    final added = updated.add(cittaId);
    if (!added) updated.remove(cittaId);
    state = _copyStateWith(bookmarkedCittaIds: updated);
    _save();
    return added;
  }

  bool toggleCetasikaBookmark(String cetasikaId) {
    final updated = Set<String>.from(state.bookmarkedCetasikaIds);
    final added = updated.add(cetasikaId);
    if (!added) updated.remove(cetasikaId);
    state = _copyStateWith(bookmarkedCetasikaIds: updated);
    _save();
    return added;
  }

  bool isCittaBookmarked(String id) => state.bookmarkedCittaIds.contains(id);

  bool isCetasikaBookmarked(String id) =>
      state.bookmarkedCetasikaIds.contains(id);

  // ── Personal Notes ────────────────────────────────────────────────────────

  void saveNote(String key, String note) {
    final updated = Map<String, String>.from(state.personalNotes);
    if (note.trim().isEmpty) {
      updated.remove(key);
    } else {
      updated[key] = note.trim();
    }
    state = _copyStateWith(personalNotes: updated);
    _save();
  }

  void deleteNote(String key) {
    final updated = Map<String, String>.from(state.personalNotes)..remove(key);
    state = _copyStateWith(personalNotes: updated);
    _save();
  }

  String? getNote(String key) => state.personalNotes[key];

  // ── Unlock & Reset ────────────────────────────────────────────────────────

  void toggleAllModulesUnlocked(bool unlocked) {
    state = _copyStateWith(allModulesUnlocked: unlocked);
    _save();
  }

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

  // ── Warning ───────────────────────────────────────────────────────────────

  Future<void> dismissWarning() async {
    _warningDismissed = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kWarningKey, true);
  }

  Future<void> resetWarningDismissed() async {
    _warningDismissed = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kWarningKey);
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  UserProgress _copyStateWith({
    Map<String, ModuleProgress>? moduleProgress,
    DateTime? lastStudied,
    String? lastModuleId,
    bool? allModulesUnlocked,
    Set<String>? bookmarkedCittaIds,
    Set<String>? bookmarkedCetasikaIds,
    Map<String, String>? personalNotes,
  }) {
    return UserProgress(
      moduleProgress: moduleProgress ?? state.moduleProgress,
      lastStudied: lastStudied ?? state.lastStudied,
      lastModuleId: lastModuleId ?? state.lastModuleId,
      allModulesUnlocked: allModulesUnlocked ?? state.allModulesUnlocked,
      bookmarkedCittaIds: bookmarkedCittaIds ?? state.bookmarkedCittaIds,
      bookmarkedCetasikaIds:
          bookmarkedCetasikaIds ?? state.bookmarkedCetasikaIds,
      personalNotes: personalNotes ?? state.personalNotes,
    );
  }

  static DateTime? _tryParseDate(dynamic value) {
    if (value is! String) return null;
    return DateTime.tryParse(value);
  }
}

// ─── Providers ────────────────────────────────────────────────────────────────

final progressProvider = StateNotifierProvider<ProgressNotifier, UserProgress>(
  (ref) => ProgressNotifier(),
);

/// ── BUG FIX 5.3: overallProgress ────────────────────────────────────────────
///
/// **Root cause của bug 9200%:**
/// `completionPercentage` được lưu ở thang 0–100 (ví dụ: 92.0).
/// Trước đây code UI lại nhân thêm *100 → 9200.
///
/// **Fix:**
/// Provider này chuẩn hóa về 0.0–1.0.
/// UI chỉ cần `(overallProgress * 100).round()` để hiển thị "92%".
/// KHÔNG được nhân thêm lần nào khác.
///
/// **Quy ước dữ liệu:**
/// - `ModuleProgress.completionPercentage` : 0.0–100.0 (thang quiz)
/// - `overallProgressProvider`             : 0.0–1.0   (ratio chuẩn)
/// - UI display                            : `(ratio * 100).round()` → "92%"
final overallProgressProvider = Provider<double>((ref) {
  final progress = ref.watch(progressProvider);
  final modules = progress.moduleProgress;

  if (modules.isEmpty) return 0.0;

  // completionPercentage ∈ [0, 100] → chia 100 → [0.0, 1.0]
  final totalRatio = modules.values.fold<double>(
    0.0,
    (sum, m) => sum + (m.completionPercentage / 100.0).clamp(0.0, 1.0),
  );

  // Trả về tỷ lệ trung bình trong khoảng 0.0–1.0
  // UI: (overallProgress * 100).round() để hiển thị "%"
  return (totalRatio / modules.length).clamp(0.0, 1.0);
});

/// Tổng số bookmark (citta + cetasika).
final bookmarkCountProvider = Provider<int>((ref) {
  final p = ref.watch(progressProvider);
  return p.bookmarkedCittaIds.length + p.bookmarkedCetasikaIds.length;
});

/// Số module đã hoàn thành (quizScore >= 80).
final completedModuleCountProvider = Provider<int>((ref) {
  final p = ref.watch(progressProvider);
  return p.moduleProgress.values
      .where((m) => m.completionPercentage >= 80.0)
      .length;
});

/// Danh sách moduleId cần ôn tập hôm nay (SM-2).
final dueForReviewProvider = Provider<List<String>>((ref) {
  final p = ref.watch(progressProvider);
  final now = DateTime.now();
  return p.moduleProgress.entries
      .where((e) {
        final due = e.value.nextReviewDue;
        return due != null && !due.isAfter(now);
      })
      .map((e) => e.key)
      .toList();
});
