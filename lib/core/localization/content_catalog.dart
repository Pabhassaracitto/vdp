import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/lesson_content.dart';
import 'content_languages.dart';

/// Asset-loading fallback order used when a content locale is missing a file.
///
/// Content lookup applies the selected language's fallback policy after these
/// catalogs are loaded: priority languages can inherit a regional variant
/// (for example `zh_TW -> zh`) and may use English for missing fields while
/// the catalog is in draft. Non-Vietnamese locales never fall back to the
/// Vietnamese source.
const List<String> kContentFallbackLocales = ['en', 'vi'];

/// Resolves the chain of content locales to try for [locale].
///
/// Example resource chain: `zh_Hant_TW` →
/// `[zh_Hant_TW, zh_Hant, zh, en, vi]`. This is the list of files to load,
/// not a promise that every catalog will be rendered; [_localizedChain]
/// applies the selected language's policy afterward.
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

  /// Lower-priority catalogs loaded for fallback lookup when [data] is missing
  /// a value. Rendering filters this list through [_localizedChain], so
  /// English is included only when the selected language permits it, and
  /// Vietnamese is never used for non-Vietnamese readers.
  final List<ContentCatalog> fallbacks;

  const ContentCatalog({
    required this.locale,
    required this.data,
    this.fallbacks = const [],
  });

  static const vietnamese = ContentCatalog(locale: 'vi', data: {});

  // ── Entity text ────────────────────────────────────────────────────────────
  // NOTE: for `vi` the canonical entity strings live in assets/data/*.json and
  // are passed in as [vietnameseFallback], so the catalog is bypassed. Other
  // locales use the safe chain selected below: English may fill draft gaps,
  // but Vietnamese is never borrowed.

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
    for (final catalog in _localizedChain) {
      final value = catalog._entityField(section, id, field);
      if (value is String && value.trim().isNotEmpty) return value;
    }
    // The safe chain already tried English when permitted; never use the
    // Vietnamese source for a learner who selected another content language.
    return '';
  }

  List<String> textList(
    String section,
    String id,
    String field,
    List<String> vietnameseFallback,
  ) {
    if (locale == 'vi') return vietnameseFallback;
    for (final catalog in _localizedChain) {
      final value = catalog._entityField(section, id, field);
      if (value is List) {
        final strings = value.whereType<String>().toList(growable: false);
        if (strings.isNotEmpty) return strings;
      }
    }
    return const [];
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
    for (final catalog in _localizedChain) {
      final collection = catalog._entityField(section, id, nestedCollection);
      if (collection is! Map) continue;
      final nested = collection[nestedId];
      if (nested is! Map) continue;
      final value = nested[field];
      if (value is String && value.trim().isNotEmpty) return value;
    }
    return '';
  }

  // ── Optional prose (Accuracy-First) ────────────────────────────────────────

  /// Like [text], but for prose fields that may simply be absent.
  ///
  /// For a Vietnamese reader the dataset value is the source of truth, so it
  /// is returned directly. Other readers only get text from the safe locale
  /// chain (the selected language, a regional variant, and English only when
  /// [ContentLanguage.allowsEnglishFallback] permits it). When nothing is
  /// authored there this returns `null`; callers hide the block rather than
  /// leaking the Vietnamese source.
  String? optionalText(
    String section,
    String id,
    String field,
    String? vietnameseFallback,
  ) {
    if (locale == 'vi') return vietnameseFallback;
    for (final catalog in _localizedChain) {
      final value = catalog._entityField(section, id, field);
      if (value is String && value.trim().isNotEmpty) return value;
    }
    return null;
  }

  /// Like [optionalText] for string-list fields (examples, …).
  List<String>? optionalTextList(
    String section,
    String id,
    String field,
    List<String>? vietnameseFallback,
  ) {
    if (locale == 'vi') return vietnameseFallback;
    for (final catalog in _localizedChain) {
      final value = catalog._entityField(section, id, field);
      if (value is List) {
        final strings = value.whereType<String>().toList(growable: false);
        if (strings.isNotEmpty) return strings;
      }
    }
    return null;
  }

  /// Like [nestedText] but returning `null` when no safe locale has authored
  /// the value.
  String? optionalNestedText(
    String section,
    String id,
    String nestedCollection,
    String nestedId,
    String field,
    String? vietnameseFallback,
  ) {
    if (locale == 'vi') return vietnameseFallback;
    for (final catalog in _localizedChain) {
      final collection = catalog._entityField(section, id, nestedCollection);
      if (collection is! Map) continue;
      final nested = collection[nestedId];
      if (nested is! Map) continue;
      final value = nested[field];
      if (value is String && value.trim().isNotEmpty) return value;
    }
    return null;
  }

  // ── Lesson content (Học / Ôn tập / Kiểm tra) ───────────────────────────────

  /// Catalogs loaded for this locale, highest priority first.
  List<ContentCatalog> get _chain => [this, ...fallbacks];

  /// Catalogs safe to render for the selected content language.
  ///
  /// A priority locale first tries its own catalog and regional variants such
  /// as Simplified Chinese for `zh_TW`. Draft catalogs may use English for
  /// missing fields. Vietnamese is excluded for every other locale.
  List<ContentCatalog> get _localizedChain {
    if (locale == 'vi') {
      return _chain.where((catalog) => catalog.locale == 'vi').toList();
    }

    final normalizedLocale = locale.replaceAll('-', '_');
    final language = contentLanguageFor(normalizedLocale) ??
        contentLanguageFor(normalizedLocale.split('_').first);
    final allowsEnglish = language?.allowsEnglishFallback ?? true;
    return _chain.where((catalog) {
      if (catalog.locale == 'vi') return false;
      if (!allowsEnglish && catalog.locale == 'en') return false;
      return true;
    }).toList(growable: false);
  }

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

  /// Merges one collection across the fallback chain [chain].
  ///
  /// * Item order comes from the most complete catalog in the safe chain, so a
  ///   partial translation never silently truncates a collection.
  /// * Within an item, each field falls back independently only across catalogs
  ///   that are safe for the selected language.
  ///
  /// [chain] is explicit so lessons can use the same language policy as entity
  /// text while excluding Vietnamese and conditionally including English.
  List<Map<String, Object?>> _mergedItemsWithChain(
    String moduleId,
    String key,
    List<ContentCatalog> chain,
  ) {
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

  /// Authored lesson content for [moduleId], merged across the safe locale
  /// chain.
  ///
  /// Lesson sections, review cards and quiz seeds are narrative text. Draft
  /// locales may use English for untranslated fields until a reviewed
  /// translation is available; Vietnamese source text is never substituted.
  ///
  /// Returns [ModuleLessonContent.empty] when nothing is authored in the safe
  /// chain; callers treat that as "fall back to the generated experience", not
  /// as an error.
  ModuleLessonContent moduleLesson(String moduleId) {
    final lessonChain = _localizedChain;

    final sections = _mergedItemsWithChain(moduleId, 'lessonSections', lessonChain)
        .map(LessonSection.tryParse)
        .whereType<LessonSection>()
        .toList(growable: false);
    final cards = _mergedItemsWithChain(moduleId, 'reviewCards', lessonChain)
        .map(LessonReviewCard.tryParse)
        .whereType<LessonReviewCard>()
        .toList(growable: false);
    final seeds = _mergedItemsWithChain(moduleId, 'quizSeeds', lessonChain)
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

  /// Module title/description, resolved through the safe locale chain.
  ///
  /// A non-Vietnamese reader never receives a Vietnamese source fallback. The
  /// description is empty only when no safe-chain value exists; the model may
  /// use its Pāḷi title as a language-neutral label.
  String moduleText(String moduleId, String field, String vietnameseFallback) {
    final effectiveChain = _localizedChain;
    for (final catalog in effectiveChain) {
      final modules = catalog.data['studyModules'];
      if (modules is! Map) continue;
      final module = modules[moduleId];
      if (module is! Map) continue;
      final value = module[field];
      if (value is String && value.trim().isNotEmpty) return value.trim();
    }
    return locale == 'vi' ? vietnameseFallback : '';
  }
}

/// Loads a single `assets/content/content_<locale>.json` file.
///
/// Missing or malformed files resolve to `null` rather than throwing. The
/// provider keeps the requested locale so the selected language's safe fallback
/// policy decides whether to use another catalog or omit the missing text.
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

  // If every requested-chain asset failed, try loading the Vietnamese source
  // so source-language users can still recover. The requested locale remains
  // on the head catalog; priority-language lookup filters this vi fallback out.
  if (catalogs.isEmpty) {
    final viFallback = await _loadContentFile('vi');
    if (viFallback != null) {
      // Trả về catalog với locale yêu cầu nhưng fallback là vi có dữ liệu đầy đủ
      return ContentCatalog(
        locale: locale,
        data: const {},
        fallbacks: [ContentCatalog(locale: 'vi', data: viFallback)],
      );
    }
    // Still empty: preserve the requested locale so its fallback policy remains
    // in force (in particular, non-Vietnamese locales must not become vi).
    return locale == 'vi'
        ? ContentCatalog.vietnamese
        : ContentCatalog(locale: locale, data: const {});
  }

  // Keep the *requested* locale on the head so every lookup applies the
  // selected language's policy (notably the `vi` short-circuit onto assets/data).
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

  /// Whether raw Vietnamese strings from `assets/data/*.json` are appropriate
  /// to display directly.
  ///
  /// A few model fields (conflict explanations, association notes) exist only
  /// in Vietnamese in the dataset and have no per-locale override yet. Showing
  /// them is right for a Vietnamese reader and wrong for everyone else, who
  /// gets a localized ARB string instead.
  ///
  /// This replaces the old `usesEnglishContent` flag, which asked
  /// `locale == 'en'` and therefore routed *every* non-Vietnamese locale
  /// (hi, zh, si, my, ja, …) into the Vietnamese branch.
  bool get showsVietnameseSourceText => contentCatalog.locale == 'vi';
}
