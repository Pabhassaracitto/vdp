// lib/data/models/lesson_content.dart
//
// Lesson content model for the Study tab (Học / Ôn tập / Kiểm tra).
//
// DESIGN NOTES
// ------------
// * These models are **content-language** payloads loaded from
//   `assets/content/content_<locale>.json`. They are intentionally separate
//   from `assets/data/*.json`, which stays the canonical *entity* dataset
//   (cittas / cetasikas / rupas / kammas / paticcas / vithis).
// * Every item carries a **stable, language-independent id** (e.g. `M6_S01`).
//   Text is the only thing that changes per locale, so a translation can be
//   merged field-by-field across the locale fallback chain.
// * Plain Dart (no freezed/json_serializable) on purpose: this file must stay
//   buildable without running `build_runner`.
// * Parsing is defensive. A malformed entry is skipped rather than throwing,
//   so one bad translation can never crash a whole module.

import 'package:flutter/foundation.dart';

/// Placeholder used when no locale in the fallback chain supplies a value.
/// Surfacing this is deliberate: it makes missing source material auditable
/// instead of silently inventing doctrine.
const String kSourceMissing = 'source_missing';

// ─── Source reference ─────────────────────────────────────────────────────────

/// Pointer back to the original PDF so any claim can be audited.
@immutable
class LessonSourceRef {
  /// Original file name, e.g. `VDP-Nghiep.pdf`.
  final String file;

  /// 1-based page number in that PDF, or `null` when not pinned down.
  final int? page;

  /// Optional short note about what was taken from that page.
  final String? note;

  const LessonSourceRef({required this.file, this.page, this.note});

  static LessonSourceRef? tryParse(Object? raw) {
    if (raw is! Map) return null;
    final file = raw['file'];
    if (file is! String || file.trim().isEmpty) return null;
    final page = raw['page'];
    final note = raw['note'];
    return LessonSourceRef(
      file: file.trim(),
      page: page is int ? page : (page is num ? page.toInt() : null),
      note: note is String && note.trim().isNotEmpty ? note.trim() : null,
    );
  }

  static List<LessonSourceRef> parseList(Object? raw) {
    if (raw is! List) return const [];
    return raw
        .map(LessonSourceRef.tryParse)
        .whereType<LessonSourceRef>()
        .toList(growable: false);
  }

  /// Compact human-readable label, e.g. `VDP-Nghiep.pdf p.2`.
  String get label => page == null ? file : '$file p.$page';
}

// ─── Key term ─────────────────────────────────────────────────────────────────

/// A Pāli/Vietnamese glossary entry attached to a lesson section.
///
/// [pali] is intentionally allowed to survive untranslated across locales:
/// Pāli terms must stay stable in every language.
@immutable
class LessonKeyTerm {
  final String id;
  final String term;
  final String pali;
  final String meaning;

  const LessonKeyTerm({
    required this.id,
    required this.term,
    required this.pali,
    required this.meaning,
  });

  static LessonKeyTerm? tryParse(Object? raw) {
    if (raw is! Map) return null;
    final term = _str(raw['term']);
    final pali = _str(raw['pali']);
    if (term.isEmpty && pali.isEmpty) return null;
    return LessonKeyTerm(
      id: _str(raw['id']),
      term: term.isEmpty ? pali : term,
      pali: pali,
      meaning: _str(raw['meaning']),
    );
  }

  static List<LessonKeyTerm> parseList(Object? raw) {
    if (raw is! List) return const [];
    return raw
        .map(LessonKeyTerm.tryParse)
        .whereType<LessonKeyTerm>()
        .toList(growable: false);
  }
}

// ─── Lesson section (tab "Học") ───────────────────────────────────────────────

@immutable
class LessonSection {
  final String id;
  final String title;
  final String summary;
  final List<String> body;
  final List<LessonKeyTerm> keyTerms;
  final List<LessonSourceRef> sourceRefs;

  const LessonSection({
    required this.id,
    required this.title,
    required this.summary,
    required this.body,
    required this.keyTerms,
    required this.sourceRefs,
  });

  static LessonSection? tryParse(Map<String, Object?> raw) {
    final id = _str(raw['id']);
    if (id.isEmpty) return null;
    return LessonSection(
      id: id,
      title: _str(raw['title'], fallback: kSourceMissing),
      summary: _str(raw['summary']),
      body: _strList(raw['body']),
      keyTerms: LessonKeyTerm.parseList(raw['keyTerms']),
      sourceRefs: LessonSourceRef.parseList(raw['sourceRefs']),
    );
  }

  bool get hasContent => body.isNotEmpty || summary.isNotEmpty;
}

// ─── Review card (tab "Ôn tập") ───────────────────────────────────────────────

@immutable
class LessonReviewCard {
  final String id;
  final String front;
  final String back;
  final List<LessonSourceRef> sourceRefs;

  const LessonReviewCard({
    required this.id,
    required this.front,
    required this.back,
    required this.sourceRefs,
  });

  static LessonReviewCard? tryParse(Map<String, Object?> raw) {
    final id = _str(raw['id']);
    final front = _str(raw['front']);
    final back = _str(raw['back']);
    // A card with no question or no answer is unusable — drop it.
    if (id.isEmpty || front.isEmpty || back.isEmpty) return null;
    return LessonReviewCard(
      id: id,
      front: front,
      back: back,
      sourceRefs: LessonSourceRef.parseList(raw['sourceRefs']),
    );
  }
}

// ─── Quiz seed (tab "Kiểm tra") ───────────────────────────────────────────────

/// An authored, source-backed quiz question.
///
/// Seeds take priority over the auto-generated questions produced by
/// `QuizGeneratorService`; the generator still runs afterwards as a fallback so
/// existing citta/cetasika quizzes keep working.
@immutable
class LessonQuizSeed {
  final String id;

  /// Currently only `mcq` is rendered. Unknown types are ignored by the UI.
  final String type;
  final String question;
  final String correctAnswer;
  final List<String> distractors;
  final String explanation;
  final List<LessonSourceRef> sourceRefs;

  const LessonQuizSeed({
    required this.id,
    required this.type,
    required this.question,
    required this.correctAnswer,
    required this.distractors,
    required this.explanation,
    required this.sourceRefs,
  });

  static LessonQuizSeed? tryParse(Map<String, Object?> raw) {
    final id = _str(raw['id']);
    final question = _str(raw['question']);
    final correct = _str(raw['correctAnswer']);
    final distractors = _strList(raw['distractors']);
    // Need a question, a correct answer and at least one distractor to be
    // a valid multiple-choice item.
    if (id.isEmpty ||
        question.isEmpty ||
        correct.isEmpty ||
        distractors.isEmpty) {
      return null;
    }
    final type = _str(raw['type'], fallback: 'mcq');
    return LessonQuizSeed(
      id: id,
      type: type,
      question: question,
      correctAnswer: correct,
      distractors: distractors,
      explanation: _str(raw['explanation']),
      sourceRefs: LessonSourceRef.parseList(raw['sourceRefs']),
    );
  }
}

// ─── Aggregate ────────────────────────────────────────────────────────────────

/// All authored lesson content for one study module, after locale merging.
@immutable
class ModuleLessonContent {
  final String moduleId;
  final List<LessonSection> sections;
  final List<LessonReviewCard> reviewCards;
  final List<LessonQuizSeed> quizSeeds;

  const ModuleLessonContent({
    required this.moduleId,
    required this.sections,
    required this.reviewCards,
    required this.quizSeeds,
  });

  static const ModuleLessonContent empty = ModuleLessonContent(
    moduleId: '',
    sections: [],
    reviewCards: [],
    quizSeeds: [],
  );

  bool get isEmpty =>
      sections.isEmpty && reviewCards.isEmpty && quizSeeds.isEmpty;

  bool get isNotEmpty => !isEmpty;
}

// ─── Shared parsing helpers ───────────────────────────────────────────────────

String _str(Object? value, {String fallback = ''}) {
  if (value is String) {
    final trimmed = value.trim();
    if (trimmed.isNotEmpty) return trimmed;
  }
  return fallback;
}

List<String> _strList(Object? value) {
  if (value is! List) return const [];
  return value
      .whereType<String>()
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList(growable: false);
}
