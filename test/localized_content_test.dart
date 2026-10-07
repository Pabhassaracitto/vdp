import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vdp_app/core/localization/content_catalog.dart';
import 'package:vdp_app/core/localization/content_languages.dart';

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

  test('priority fallback uses English but never the Vietnamese source', () {
    const catalog = ContentCatalog(
      locale: 'hi',
      data: {},
      fallbacks: [
        ContentCatalog(
          locale: 'en',
          data: {
            'paticcas': {
              'PD_01': {'name': 'English name'},
            },
          },
        ),
        ContentCatalog(
          locale: 'vi',
          data: {
            'paticcas': {
              'PD_01': {'name': 'Vietnamese source'},
            },
          },
        ),
      ],
    );

    expect(
      catalog.text('paticcas', 'PD_01', 'name', 'Vietnamese argument'),
      'English name',
    );
    expect(
      catalog.text('paticcas', 'PD_01', 'missing', 'Vietnamese argument'),
      isEmpty,
    );
  });

  test(
    'priority lesson lookup never uses Vietnamese when English is absent',
    () {
      const catalog = ContentCatalog(
        locale: 'hi',
        data: {},
        fallbacks: [
          ContentCatalog(locale: 'en', data: {}),
          ContentCatalog(
            locale: 'vi',
            data: {
              'studyModules': {
                'M1_BASICS': {
                  'lessonSections': [
                    {'id': 'M1_VI_ONLY', 'title': 'Vietnamese-only title'},
                  ],
                },
              },
            },
          ),
        ],
      );

      expect(catalog.moduleLesson('M1_BASICS').isEmpty, isTrue);
    },
  );

  test('priority locales retain English for untranslated fields', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final english =
        await container.read(contentCatalogProvider('en').future);
    final hindi = await container.read(contentCatalogProvider('hi').future);
    expect(
      hindi.text('paticcas', 'PD_01', 'name', 'Vietnamese fallback'),
      'अविद्या',
    );
    expect(
      hindi.text('paticcas', 'PD_01', 'description', 'Vietnamese fallback'),
      contains('चार आर्य सत्यों'),
    );
    expect(
      hindi.text('paticcas', 'PD_01', 'characteristic', 'Vietnamese fallback'),
      english.text('paticcas', 'PD_01', 'characteristic', ''),
      reason: 'an untranslated four-aspect field uses English, not Vietnamese',
    );
    expect(
      hindi.optionalText(
        'paticcas',
        'PD_01',
        'doctrinalNote',
        'Vietnamese fallback',
      ),
      english.optionalText('paticcas', 'PD_01', 'doctrinalNote', null),
    );
    expect(
      hindi.text('paccayas', 'PC_01', 'paccayaDhamma', 'Vietnamese fallback'),
      english.text('paccayas', 'PC_01', 'paccayaDhamma', ''),
    );
    expect(
      hindi.textList('cittas', 'CI_001', 'examples', const ['Vietnamese']),
      english.textList('cittas', 'CI_001', 'examples', const []),
    );
    expect(hindi.moduleLesson('M1_BASICS').isNotEmpty, isTrue,
        reason: 'English lessons remain available until Hindi translation');
    expect(
      hindi.moduleLesson('M1_BASICS').sections.first.title,
      english.moduleLesson('M1_BASICS').sections.first.title,
    );

    final traditional =
        await container.read(contentCatalogProvider('zh_TW').future);
    expect(traditional.moduleLesson('M1_BASICS').isNotEmpty, isTrue);
    expect(
      traditional.moduleLesson('M4_AKUSALA').isNotEmpty,
      isTrue,
      reason: 'zh_TW may use zh first, then English for untranslated prose',
    );
    expect(
      traditional.moduleLesson('M4_AKUSALA').sections.first.title,
      english.moduleLesson('M4_AKUSALA').sections.first.title,
    );
  });

  test('extended Chinese tags use zh before English fallback', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final english =
        await container.read(contentCatalogProvider('en').future);
    final traditional =
        await container.read(contentCatalogProvider('zh-Hant-TW').future);

    expect(
      traditional.text('paticcas', 'PD_01', 'name', 'English fallback'),
      '无明',
      reason: 'the zh regional catalog is still a safe language-family fallback',
    );
    expect(
      traditional.textList('cittas', 'CI_013', 'examples', const []),
      english.textList('cittas', 'CI_013', 'examples', const []),
      reason: 'legacy Chinese placeholders use English fallback',
    );
    expect(
      traditional.moduleLesson('M1_BASICS').isNotEmpty,
      isTrue,
      reason: 'the chain should find the authored zh lesson',
    );
    expect(
      traditional.moduleLesson('M4_AKUSALA').isNotEmpty,
      isTrue,
      reason: 'the extended locale may use English after its zh fallback',
    );
    expect(
      traditional.moduleLesson('M4_AKUSALA').sections.first.title,
      english.moduleLesson('M4_AKUSALA').sections.first.title,
    );
  });

  test(
    'every draft priority locale uses English for current translation gaps',
    () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final english =
          await container.read(contentCatalogProvider('en').future);

      for (final language in selectableContentLanguages) {
        if (language.tag == 'en' || language.tag == 'vi') continue;
        final catalog =
            await container.read(contentCatalogProvider(language.tag).future);
        expect(
          catalog.text('paticcas', 'PD_01', 'characteristic', 'Vietnamese'),
          english.text('paticcas', 'PD_01', 'characteristic', ''),
          reason: '${language.tag} should use English for missing fields',
        );
        expect(
          catalog.optionalText(
            'paticcas',
            'PD_01',
            'doctrinalNote',
            'Vietnamese',
          ),
          english.optionalText('paticcas', 'PD_01', 'doctrinalNote', null),
          reason: '${language.tag} should retain untranslated English prose',
        );
        expect(
          catalog.text('paccayas', 'PC_01', 'paccayaDhamma', 'Vietnamese'),
          english.text('paccayas', 'PC_01', 'paccayaDhamma', ''),
          reason:
              '${language.tag} should retain untranslated English definitions',
        );
        expect(
          catalog.text('rupas', 'RP_001', 'function', 'Vietnamese'),
          english.text('rupas', 'RP_001', 'function', ''),
          reason: '${language.tag} should retain English for this current gap',
        );
      }
    },
  );

  // ── English recovery catalog coverage (Conditions + Mind Process tabs) ────
  //
  // English is the field-level fallback for draft priority catalogs and
  // unregistered languages. These tests pin down that its overlay is complete,
  // so fallback lookups remain readable without leaking the Vietnamese source.

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
      // Every subdivision should have an English label: an absent translation
      // is hidden rather than filled with the Vietnamese source.
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
        // Where the dataset has a doctrinal note, English should have one too;
        // absent prose is hidden rather than leaked from the Vietnamese source.
        if (((step['doctrinalNote'] as String?) ?? '').isNotEmpty) {
          expect((stepEntry['doctrinalNote'] as String?)?.trim().isNotEmpty,
              isTrue,
              reason: 'vithis.$id step $number doctrinalNote must be authored');
        }
      }
    }
  });
}
