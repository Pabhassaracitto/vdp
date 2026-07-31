import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentCatalog {
  final String locale;
  final Map<String, dynamic> data;

  const ContentCatalog({required this.locale, required this.data});

  static const vietnamese = ContentCatalog(locale: 'vi', data: {});

  String text(
    String section,
    String id,
    String field,
    String vietnameseFallback,
  ) {
    if (locale == 'vi') return vietnameseFallback;
    final sectionData = data[section];
    if (sectionData is! Map<String, dynamic>) return vietnameseFallback;
    final item = sectionData[id];
    if (item is! Map<String, dynamic>) return vietnameseFallback;
    final value = item[field];
    return value is String && value.trim().isNotEmpty
        ? value
        : vietnameseFallback;
  }

  List<String> textList(
    String section,
    String id,
    String field,
    List<String> vietnameseFallback,
  ) {
    if (locale == 'vi') return vietnameseFallback;
    final sectionData = data[section];
    if (sectionData is! Map<String, dynamic>) return vietnameseFallback;
    final item = sectionData[id];
    if (item is! Map<String, dynamic>) return vietnameseFallback;
    final value = item[field];
    if (value is! List) return vietnameseFallback;
    final strings = value.whereType<String>().toList(growable: false);
    return strings.isEmpty ? vietnameseFallback : strings;
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
    final sectionData = data[section];
    if (sectionData is! Map<String, dynamic>) return vietnameseFallback;
    final item = sectionData[id];
    if (item is! Map<String, dynamic>) return vietnameseFallback;
    final collection = item[nestedCollection];
    if (collection is! Map<String, dynamic>) return vietnameseFallback;
    final nested = collection[nestedId];
    if (nested is! Map<String, dynamic>) return vietnameseFallback;
    final value = nested[field];
    return value is String && value.trim().isNotEmpty
        ? value
        : vietnameseFallback;
  }
}

final contentCatalogProvider =
    FutureProvider.family<ContentCatalog, String>((ref, locale) async {
  if (locale == 'vi') return ContentCatalog.vietnamese;
  try {
    final raw = await rootBundle.loadString(
      'assets/content/content_$locale.json',
    );
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    return ContentCatalog(locale: locale, data: decoded);
  } catch (_) {
    // English is the only international content language in this release.
    // Returning an empty English catalog is safer than changing app logic.
    return const ContentCatalog(locale: 'en', data: {});
  }
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
