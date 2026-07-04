// lib/shared/providers/progress_provider.dart
// User Progress — Offline-First với SharedPreferences
// Refactored: SM-2 Simplified, null-safe, đầy đủ serialize/deserialize

import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/study_module.dart';

// ─── Constants ────────────────────────────────────────────────────────────────

const _kProgressKey = 'vdp_user_progress';
const _kWarningKey = 'vdp_warning_dismissed';

/// SM-2 Simplified: khoảng cách ôn tập (ngày) theo số lần ôn liên tiếp thành công.
/// Index 0 = lần 1, index 4+ = plateau 30 ngày.
const _kSm2Intervals = <int>[1, 3, 7, 14, 30];

/// Ngưỡng điểm để tính là "lần ôn thành công".
const _kPassThreshold = 80.0;

// ─── SM-2 Helper (pure function, dễ test) ────────────────────────────────────

/// Tính interval ngày tiếp theo theo SM-2 Simplified.
///
/// [previousEf]       : Easiness Factor hiện tại (mặc định 2.5).
/// [consecutivePasses]: Số lần liên tiếp đạt điểm >= threshold.
/// [score]            : Điểm vừa đạt (0–100).
///
/// Trả về [_Sm2Result] chứa nextIntervalDays và ef mới.
_Sm2Result _computeSm2({
  required double score,
  required int consecutivePasses,
  required double previousEf,
}) {
  // Chuẩn hoá score về thang 0–5 (SM-2 gốc dùng thang này)
  final q = (score / 100 * 5).clamp(0.0, 5.0);

  // Cập nhật EF: EF' = EF + (0.1 - (5-q)*(0.08+(5-q)*0.02))
  // Clamp tối thiểu 1.3 theo spec SM-2
  final newEf =
      math.max(1.3, previousEf + 0.1 - (5 - q) * (0.08 + (5 - q) * 0.02));

  if (score < _kPassThreshold) {
    // Thất bại: reset consecutive, ôn lại sau 1 ngày
    return _Sm2Result(
      nextIntervalDays: 1,
      newEf: newEf,
      newConsecutivePasses: 0,
    );
  }

  // Thành công: tăng interval
  final newConsecutive = consecutivePasses + 1;
  final intervalIndex =
      (newConsecutive - 1).clamp(0, _kSm2Intervals.length - 1);
  final days = _kSm2Intervals[intervalIndex];

  return _Sm2Result(
    nextIntervalDays: days,
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

  // ── Persistence: Load ────────────────────────────────────────────────────

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      _warningDismissed = prefs.getBool(_kWarningKey) ?? false;

      final raw = prefs.getString(_kProgressKey);
      if (raw == null) return;

      final data = jsonDecode(raw) as Map<String, dynamic>;

      // ── Module Progress ────────────────────────────────────────────────
      final mp = <String, ModuleProgress>{};
      final mpRaw = (data['moduleProgress'] as Map<String, dynamic>?) ?? {};

      mpRaw.forEach((id, value) {
        final m = value as Map<String, dynamic>;
        mp[id] = ModuleProgress(
          moduleId: id,
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

      // ── Bookmarks (backward-compatible) ───────────────────────────────
      final bookmarkedCittaIds = Set<String>.from(
        data['bookmarkedCittaIds'] as List? ?? [],
      );
      final bookmarkedCetasikaIds = Set<String>.from(
        data['bookmarkedCetasikaIds'] as List? ?? [],
      );

      // ── Personal Notes (backward-compatible) ──────────────────────────
      final notesRaw = (data['personalNotes'] as Map<String, dynamic>?) ?? {};
      final personalNotes = notesRaw.map(
        (k, v) => MapEntry(k, v as String),
      );

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
      // Ghi log nhưng không crash — khởi động với state rỗng
      assert(() {
        // ignore: avoid_print
        print('[ProgressNotifier._load] Error: $e\n$st');
        return true;
      }());
    }
  }

  // ── Persistence: Save ────────────────────────────────────────────────────

  Future<void> _save() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Serialize module progress
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
        // ignore: avoid_print
        print('[ProgressNotifier._save] Error: $e');
        return true;
      }());
    }
  }

  // ── Quiz & Spaced Repetition ─────────────────────────────────────────────

  /// Ghi điểm quiz và cập nhật SM-2.
  ///
  /// [score]: 0.0–100.0 (điểm phần trăm)
  void recordQuizScore(String moduleId, double score) {
    assert(score >= 0 && score <= 100, 'score phải trong khoảng 0–100');

    final existing = state.moduleProgress[moduleId];

    final sm2Result = _computeSm2(
      score: score,
      consecutivePasses: existing?.consecutivePasses ?? 0,
      previousEf: existing?.easinessFactor ?? 2.5,
    );

    final now = DateTime.now();
    final passed = score >= _kPassThreshold;

    // completedAt: chỉ set lần đầu vượt ngưỡng, không ghi đè
    final completedAt =
        passed ? (existing?.completedAt ?? now) : existing?.completedAt;

    final updated = ModuleProgress(
      moduleId: moduleId,
      completionPercentage: score,
      quizScore: score.round(),
      viewedCittaIds: List<String>.from(existing?.viewedCittaIds ?? []),
      completedAt: completedAt,
      reviewCount: (existing?.reviewCount ?? 0) + 1,
      consecutivePasses: sm2Result.newConsecutivePasses,
      easinessFactor: sm2Result.newEf,
      lastReviewedAt: now,
      nextReviewDue: now.add(Duration(days: sm2Result.nextIntervalDays)),
    );

    state = _copyStateWith(
      moduleProgress: {...state.moduleProgress, moduleId: updated},
      lastStudied: now,
      lastModuleId: moduleId,
    );
    _save();
  }

  // ── Citta Viewed ─────────────────────────────────────────────────────────

  /// Đánh dấu đã xem một Tâm (idempotent).
  void markCittaViewed(String moduleId, String cittaId) {
    final existing = state.moduleProgress[moduleId];
    final viewed = <String>{...?existing?.viewedCittaIds, cittaId};

    final updated = ModuleProgress(
      moduleId: moduleId,
      completionPercentage: existing?.completionPercentage ?? 0,
      quizScore: existing?.quizScore ?? 0,
      viewedCittaIds: viewed.toList(),
      completedAt: existing?.completedAt, // giữ nguyên
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

  // ── Bookmarks ────────────────────────────────────────────────────────────

  /// Toggle bookmark Citta. Trả về trạng thái mới (true = đã bookmark).
  bool toggleCittaBookmark(String cittaId) {
    final updated = Set<String>.from(state.bookmarkedCittaIds);
    final added = updated.add(cittaId); // false nếu đã có
    if (!added) updated.remove(cittaId);

    state = _copyStateWith(bookmarkedCittaIds: updated);
    _save();
    return added;
  }

  /// Toggle bookmark Cetasika. Trả về trạng thái mới (true = đã bookmark).
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

  // ── Personal Notes ───────────────────────────────────────────────────────

  /// Lưu/xoá ghi chú.
  /// Key format: "citta_CI_001" | "cetasika_CS_PHASSA"
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

  // ── Unlock & Reset ───────────────────────────────────────────────────────

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

  // ── Warning Dismissed ────────────────────────────────────────────────────

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

  // ── Private Helpers ──────────────────────────────────────────────────────

  /// Tạo bản copy state mới với các field được override.
  /// Giữ nguyên tất cả field không được truyền vào.
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

/// Tổng số bookmark (citta + cetasika).
final bookmarkCountProvider = Provider<int>((ref) {
  final p = ref.watch(progressProvider);
  return p.bookmarkedCittaIds.length + p.bookmarkedCetasikaIds.length;
});

/// Danh sách moduleId cần ôn tập hôm nay.
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
