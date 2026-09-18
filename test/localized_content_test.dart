import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vdp_app/core/localization/content_catalog.dart';

/// Canonical entity counts, read from the dataset rather than hard-coded.
///
/// Hard-coding them meant a doctrinal correction (kammas went 12 → 16) left
/// this test asserting a count the data no longer had.
Future<int> _datasetCount(String file, String key) async {
  final raw = await File('assets/data/$file.json').readAsString();
  return (jsonDecode(raw) as Map<String, dynamic>)[key].length as int;
}

Future<List<dynamic>> _datasetItems(String file, String key) async {
  final raw = await File('assets/data/$file.json').readAsString();
  return (jsonDecode(raw) as Map<String, dynamic>)[key] as List<dynamic>;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('English content overlay covers canonical doctrine collections', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final catalog = await container.read(contentCatalogProvider('en').future);
    expect(catalog.locale, 'en');
    for (final entry in {
      'cittas': 'cittas',
      'cetasikas': 'cetasikas',
      'rupas': 'rupas',
      'kammas': 'kammas',
      'paticcas': 'paticca',
      'paccayas': 'paccayas',
      'vithis': 'vithis',
    }.entries) {
      expect(
        catalog.data[entry.key],
        hasLength(await _datasetCount(entry.value, entry.key)),
        reason: 'English overlay must cover every ${entry.key} in the dataset',
      );
    }
    expect(catalog.data['studyModules'], hasLength(17));
  });

  test('content selection changes text without changing canonical IDs', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final catalog = await container.read(contentCatalogProvider('en').future);

    expect(
      catalog.text('cittas', 'CI_001', 'name', 'Tâm Tham'),
      contains('consciousness'),
    );
    expect(
      catalog.text('cetasikas', 'CS_PHASSA', 'name', 'Xúc'),
      'Contact',
    );
    expect(
      catalog.text('paticcas', 'PD_01', 'name', 'Vô Minh'),
      'Ignorance',
    );
    expect(
      catalog.text('paccayas', 'PC_01', 'name', 'Nhân Duyên'),
      'Root condition',
    );
  });

  // ── English fallback normalisation (Conditions + Mind Process tabs) ────────
  //
  // English is the international fallback locale: after `en` every other
  // language degrades field-by-field to English before anything else. These
  // tests pin down that the English overlay is COMPLETE for the two tabs, so
  // an English learner never sees dataset Vietnamese.

  test('English paticcas carry the full Tứ Nghĩa + prose fields', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final catalog = await container.read(contentCatalogProvider('en').future);
    final paticcas = catalog.data['paticcas'] as Map<String, dynamic>;

    for (final item in await _datasetItems('paticca', 'paticcas')) {
      final id = item['id'] as String;
      final entry = paticcas[id] as Map<String, dynamic>;
      for (final field in ['name', 'shortName', 'description']) {
        expect((entry[field] as String?)?.trim().isNotEmpty, isTrue,
            reason: 'paticcas.$id.$field must be authored in English');
      }
      for (final field in [
        'characteristic',
        'function',
        'manifestation',
        'proximateCause',
      ]) {
        expect((entry[field] as String?)?.trim().isNotEmpty, isTrue,
            reason: 'paticcas.$id.$field (Tứ Nghĩa) must be authored in English');
      }
      expect(entry['examples'], isA<List<dynamic>>(),
          reason: 'paticcas.$id.examples must exist (may be empty)');
    }
  });

  test('English paccayas carry definitions for all 24 conditions', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final catalog = await container.read(contentCatalogProvider('en').future);
    final paccayas = catalog.data['paccayas'] as Map<String, dynamic>;
    final dataset = await _datasetItems('paccayas', 'paccayas');

    expect(paccayas, hasLength(dataset.length));
    for (final item in dataset) {
      final id = item['id'] as String;
      final entry = paccayas[id] as Map<String, dynamic>;
      for (final field in [
        'name',
        'shortName',
        'definition',
        'paccayaDhamma',
        'paccayuppanna',
      ]) {
        expect((entry[field] as String?)?.trim().isNotEmpty, isTrue,
            reason: 'paccayas.$id.$field must be authored in English');
      }
      // Every dataset subdivision must be translatable, otherwise the runtime
      // nested fallback would show the Vietnamese name.
      final subs = (item['subdivisions'] as List<dynamic>? ?? const [])
          .cast<Map<dynamic, dynamic>>();
      final translated = entry['subdivisions'] as Map<String, dynamic>? ?? {};
      for (final sub in subs) {
        final pali = sub['namePali'] as String;
        final subEntry = translated[pali] as Map<String, dynamic>?;
        expect(subEntry?['name'] as String?, isNotNull,
            reason: 'paccayas.$id subdivision $pali must be authored in English');
      }
    }
  });

  test('English vithis carry process context and every step in English', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final catalog = await container.read(contentCatalogProvider('en').future);
    final vithis = catalog.data['vithis'] as Map<String, dynamic>;

    for (final item in await _datasetItems('vithis', 'vithis')) {
      final id = item['id'] as String;
      final entry = vithis[id] as Map<String, dynamic>;
      for (final field in ['name', 'shortName', 'description']) {
        expect((entry[field] as String?)?.trim().isNotEmpty, isTrue,
            reason: 'vithis.$id.$field must be authored in English');
      }
      // The Mind Process tab shows these directly — they were the Vietnamese
      // leak reported for English mode.
      for (final field in ['arisingCondition', 'significance', 'doctrinalNote']) {
        expect((entry[field] as String?)?.trim().isNotEmpty, isTrue,
            reason: 'vithis.$id.$field must be authored in English');
      }
      final steps = entry['steps'] as Map<String, dynamic>;
      for (final step in item['steps'] as List<dynamic>) {
        final number = step['stepNumber'].toString();
        final stepEntry = steps[number] as Map<String, dynamic>;
        expect((stepEntry['name'] as String?)?.trim().isNotEmpty, isTrue,
            reason: 'vithis.$id step $number name must be authored in English');
        expect((stepEntry['description'] as String?)?.trim().isNotEmpty, isTrue,
            reason: 'vithis.$id step $number description must be authored');
        // Where the dataset has a doctrinal note, English must have one too —
        // otherwise the detail panel falls back to Vietnamese.
        if (((step['doctrinalNote'] as String?) ?? '').isNotEmpty) {
          expect((stepEntry['doctrinalNote'] as String?)?.trim().isNotEmpty,
              isTrue,
              reason: 'vithis.$id step $number doctrinalNote must be authored');
        }
      }
    }
  });
}
