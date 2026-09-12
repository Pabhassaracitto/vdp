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
  });
}
