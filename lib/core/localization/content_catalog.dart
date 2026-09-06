import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/lesson_content.dart';

/// Locale fallback order used when a content locale is missing a value.
///
/// English is the international fallback; Vietnamese is the source-backed
/// original (most VDP source PDFs are Vietnamese), so it sits last as a
/// content-of-last-resort before [kSourceMissing].
const List<String> kContentFallbackLocales = ['en', 'vi'];

/// Resolves the chain of content locales to try for [locale].
///
/// Example: `zh_Hant_TW` → `[zh_Hant_TW, zh_Hant, zh, en, vi]`.
/// The chain never contains duplicates and always ends with the global
/// fallbacks.
List<String> resolveContentLocaleChain(String locale) {
  final chain = <String>[];

  void add(String value) {
    final normalized = value.trim();
    if (normalized.isEmpty) return;
    if (!chain.contains(normalized)) chain.add(normalized);
  }

  add(locale);
  // Progressively strip subtags: zh_Hant_TW -> zh_Hant -> zh
  final separator = locale.contains('-') ? '-' : '_';
  final parts = locale.split(separator).where((p) => p.isNotEmpty).toList();
  for (var i = parts.length - 1; i > 0; i--) {
    add(parts.sublist(0, i).join(separator));
  }
  for (final fallback in kContentFallbackLocales) {
    add(fallback);
  }
  return chain;
}

class ContentCatalog {
  final String locale;
  final Map<String, dynamic> data;

  /// Lower-priority catalogs consulted field-by-field when [data] is missing a
  /// value. Ordered most-preferred first (typically `en` then `vi`).
  final List<ContentCatalog> fallbacks;

  const ContentCatalog({
    required this.locale,
    required this.data,
    this.fallbacks = const [],
  });

  static const vietnamese = ContentCatalog(locale: 'vi', data: {});

  // ── Entity text (unchanged behaviour) ──────────────────────────────────────
  // NOTE: for `vi` the canonical entity strings live in assets/data/*.json and
  // are passed in as [vietnameseFallback], so the catalog is bypassed. This is
  // deliberately left as-is so existing screens keep their exact behaviour.

  /// Reads `<section>.<id>.<field>` from this catalog only.
  Object? _entityField(String section, String id, String field) {
    final sectionData = data[section];
    if (sectionData is! Map) return null;
    final item = sectionData[id];
    if (item is! Map) return null;
    return item[field];
  }

  String text(
    String section,
    String id,
    String field,
    String vietnameseFallback,
  ) {
    // Vietnamese entity strings are canonical in assets/data/*.json and are
    // passed in directly, so the catalog is bypassed entirely.
    if (locale == 'vi') return vietnameseFallback;
    for (final catalog in _chain) {
      if (catalog.locale == 'vi') break; // vi entity text lives in the dataset
      final value = catalog._entityField(section, id, field);
      if (value is String && value.trim().isNotEmpty) return value;
    }
    return vietnameseFallback;
  }

  List<String> textList(
    String section,
    String id,
    String field,
    List<String> vietnameseFallback,
  ) {
    if (locale == 'vi') return vietnameseFallback;
    for (final catalog in _chain) {
      if (catalog.locale == 'vi') break;
      final value = catalog._entityField(section, id, field);
      if (value is List) {
        final strings = value.whereType<String>().toList(growable: false);
        if (strings.isNotEmpty) return strings;
      }
    }
    return vietnameseFallback;
  }

  String nestedText(
    String section,
    String id,
    String nestedCollection,
    String nestedId,
    String field,
    String vietnameseFallback,
  ) {
    if (locale == 'vi') return vietnameseFallback;
    for (final catalog in _chain) {
      if (catalog.locale == 'vi') break;
      final collection = catalog._entityField(section, id, nestedCollection);
      if (collection is! Map) continue;
      final nested = collection[nestedId];
      if (nested is! Map) continue;
      final value = nested[field];
      if (value is String && value.trim().isNotEmpty) return value;
    }
    return vietnameseFallback;
  }

  // ── Lesson content (Học / Ôn tập / Kiểm tra) ───────────────────────────────

  /// Catalogs to consult, highest priority first.
  List<ContentCatalog> get _chain => [this, ...fallbacks];

  /// Raw `studyModules.<moduleId>.<key>` list for this catalog only.
  List<Map<String, Object?>> _rawItems(String moduleId, String key) {
    final modules = data['studyModules'];
    if (modules is! Map) return const [];
    final module = modules[moduleId];
    if (module is! Map) return const [];
    final items = module[key];
    if (items is! List) return const [];
    return items
        .whereType<Map>()
        .map((e) => e.cast<String, Object?>())
        .toList(growable: false);
  }

  /// Merges one collection across the fallback chain.
  ///
  /// * Item order comes from the *base-most* catalog that defines the
  ///   collection (Vietnamese is the structural source of truth), so a partial
  ///   translation never silently truncates a module.
  /// * Within an item, each field falls back independently, so a half-finished
  ///   translation degrades field-by-field instead of dropping the whole entry.
  List<Map<String, Object?>> _mergedItems(String moduleId, String key) {
    final chain = _chain;
    final byCatalog = [
      for (final catalog in chain) catalog._rawItems(moduleId, key),
    ];
    if (byCatalog.every((list) => list.isEmpty)) return const [];

    // Establish canonical id order from the most complete list in the chain
    // (all locale files are generated from the same structure, so this is
    // normally identical everywhere). Ids that only appear in other locales are
    // appended afterwards in chain-priority order so nothing is ever dropped.
    var orderSource = 0;
    for (var i = 1; i < byCatalog.length; i++) {
      if (byCatalog[i].length > byCatalog[orderSource].length) orderSource = i;
    }
    final order = <String>[];
    void collectIds(List<Map<String, Object?>> list) {
      for (final item in list) {
        final id = item['id'];
        if (id is String && id.trim().isNotEmpty && !order.contains(id.trim())) {
          order.add(id.trim());
        }
      }
    }

    collectIds(byCatalog[orderSource]);
    for (var i = 0; i < byCatalog.length; i++) {
      if (i != orderSource) collectIds(byCatalog[i]);
    }

    // Index each catalog's items by id for O(1) field lookups.
    final indexed = [
      for (final list in byCatalog)
        {
          for (final item in list)
            if (item['id'] is String) (item['id'] as String).trim(): item,
        },
    ];

    final merged = <Map<String, Object?>>[];
    for (final id in order) {
      final result = <String, Object?>{'id': id};
      // Union of all field names present anywhere in the chain.
      final fields = <String>{};
      for (final index in indexed) {
        final item = index[id];
        if (item != null) fields.addAll(item.keys);
      }
      for (final field in fields) {
        if (field == 'id') continue;
        for (final index in indexed) {
          final value = index[id]?[field];
          if (_isMeaningful(value)) {
            result[field] = value;
            break;
          }
        }
      }
      merged.add(result);
    }
    return merged;
  }

  static bool _isMeaningful(Object? value) {
    if (value == null) return false;
    if (value is String) return value.trim().isNotEmpty;
    if (value is Iterable) return value.isNotEmpty;
    if (value is Map) return value.isNotEmpty;
    return true;
  }

  /// Authored lesson content for [moduleId], merged across the locale chain.
  ///
  /// Returns [ModuleLessonContent.empty] when nothing is authored yet; callers
  /// must treat that as "fall back to the generated experience", never as an
  /// error.
  ModuleLessonContent moduleLesson(String moduleId) {
    final sections = _mergedItems(moduleId, 'lessonSections')
        .map(LessonSection.tryParse)
        .whereType<LessonSection>()
        .toList(growable: false);
    final cards = _mergedItems(moduleId, 'reviewCards')
        .map(LessonReviewCard.tryParse)
        .whereType<LessonReviewCard>()
        .toList(growable: false);
    final seeds = _mergedItems(moduleId, 'quizSeeds')
        .map(LessonQuizSeed.tryParse)
        .whereType<LessonQuizSeed>()
        .toList(growable: false);

    if (sections.isEmpty && cards.isEmpty && seeds.isEmpty) {
      return ModuleLessonContent.empty;
    }
    return ModuleLessonContent(
      moduleId: moduleId,
      sections: sections,
      reviewCards: cards,
      quizSeeds: seeds,
    );
  }

  /// Module title/description, resolved through the lesson fallback chain.
  ///
  /// Falls back to [vietnameseFallback] (the Dart-side `kStudyModules` value)
  /// so behaviour is unchanged when nothing is translated.
  String moduleText(String moduleId, String field, String vietnameseFallback) {
    for (final catalog in _chain) {
      final modules = catalog.data['studyModules'];
      if (modules is! Map) continue;
      final module = modules[moduleId];
      if (module is! Map) continue;
      final value = module[field];
      if (value is String && value.trim().isNotEmpty) return value.trim();
    }
    return vietnameseFallback;
  }
}

/// Loads a single `assets/content/content_<locale>.json` file.
///
/// Missing or malformed files resolve to `null` rather than throwing: a locale
/// that has not been authored yet must degrade to its fallback, not crash.
Future<Map<String, dynamic>?> _loadContentFile(String locale) async {
  try {
    final raw = await rootBundle.loadString(
      'assets/content/content_$locale.json',
    );
    final decoded = jsonDecode(raw);
    return decoded is Map<String, dynamic> ? decoded : null;
  } catch (_) {
    return null;
  }
}

final contentCatalogProvider =
    FutureProvider.family<ContentCatalog, String>((ref, locale) async {
  final chain = resolveContentLocaleChain(locale);

  // Load every locale in the chain once, in parallel.
  final loaded = await Future.wait(chain.map(_loadContentFile));

  final catalogs = <ContentCatalog>[];
  for (var i = 0; i < chain.length; i++) {
    final data = loaded[i];
    if (data == null) continue;
    catalogs.add(ContentCatalog(locale: chain[i], data: data));
  }

  if (catalogs.isEmpty) {
    // Nothing authored at all — keep the historical safe default.
    return locale == 'vi'
        ? ContentCatalog.vietnamese
        : const ContentCatalog(locale: 'en', data: {});
  }

  // The head keeps the *requested* locale so `text()` behaves exactly as before
  // (notably the `vi` short-circuit onto assets/data).
  final head = catalogs.first.locale == locale
      ? catalogs.first
      : ContentCatalog(locale: locale, data: const {});
  final tail = catalogs.first.locale == locale
      ? catalogs.sublist(1)
      : catalogs;

  return ContentCatalog(
    locale: head.locale,
    data: head.data,
    fallbacks: tail,
  );
});

class ContentCatalogScope extends InheritedWidget {
  final ContentCatalog catalog;

  const ContentCatalogScope({
    super.key,
    required this.catalog,
    required super.child,
  });

  static ContentCatalog of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<ContentCatalogScope>()
            ?.catalog ??
        ContentCatalog.vietnamese;
  }

  @override
  bool updateShouldNotify(ContentCatalogScope oldWidget) {
    return oldWidget.catalog.locale != catalog.locale ||
        !identical(oldWidget.catalog.data, catalog.data);
  }
}

extension ContentCatalogContext on BuildContext {
  ContentCatalog get contentCatalog => ContentCatalogScope.of(this);
  bool get usesEnglishContent => contentCatalog.locale == 'en';
}
