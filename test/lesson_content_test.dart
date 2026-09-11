import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vdp_app/core/localization/content_catalog.dart';
import 'package:vdp_app/core/localization/content_languages.dart';
import 'package:vdp_app/data/models/lesson_content.dart';
import 'package:vdp_app/data/models/study_module.dart';

/// The 14 study modules the app ships. Kept as a literal list (rather than
/// derived from [kStudyModules]) so a typo in either place is caught.
const _moduleIds = <String>[
  'M1_BASICS',
  'M11_BIET_CANH',
  'M2_SI_PHAN',
  'M4_AKUSALA',
  'M12_VO_NHAN',
  'M3_TINH_HAO_BIEN_HANH',
  'M5_SOBHANA',
  'M13_SAC_GIOI',
  'M14_VO_SAC_GIOI',
  'M7_SIEU_THE',
  'M6_NGHIEP',
  'M8_NHAN_DUYEN',
  'M9_SAC_PHAP',
  'M10_LO_TRINH',
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('module id list matches the shipped study module definitions', () {
    expect(
      kStudyModules.map((m) => m['id'] as String).toSet(),
      _moduleIds.toSet(),
    );
  });

  test('locale chain strips subtags then appends the global fallbacks', () {
    expect(
      resolveContentLocaleChain('zh_Hant_TW'),
      ['zh_Hant_TW', 'zh_Hant', 'zh', 'en', 'vi'],
    );
    expect(resolveContentLocaleChain('vi'), ['vi', 'en']);
    expect(resolveContentLocaleChain('en'), ['en', 'vi']);
  });

  // Derived from the registry so a newly shipped content language is covered
  // automatically instead of silently escaping these assertions.
  final shippedLocales = selectableContentLanguages.map((l) => l.tag).toList();

  test('shipped content locales all have an asset bundled', () {
    expect(shippedLocales, contains('vi'));
    for (final locale in shippedLocales) {
      expect(
        File('assets/content/content_$locale.json').existsSync(),
        isTrue,
        reason: '$locale is selectable but has no bundled content asset',
      );
    }
  });

  for (final locale in shippedLocales) {
    test('every module has lesson content in "$locale"', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final catalog =
          await container.read(contentCatalogProvider(locale).future);

      for (final id in _moduleIds) {
        final lesson = catalog.moduleLesson(id);
        expect(lesson.isNotEmpty, isTrue, reason: '$id has no lesson content');

        // Targets agreed for this milestone: 3-8 / 8-20 / 8-20.
        expect(lesson.sections.length, inInclusiveRange(3, 8), reason: id);
        expect(lesson.reviewCards.length, inInclusiveRange(8, 20), reason: id);
        expect(lesson.quizSeeds.length, inInclusiveRange(8, 20), reason: id);
      }
    });
  }

  test('lesson content is auditable and internally consistent', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final catalog = await container.read(contentCatalogProvider('vi').future);

    final seenIds = <String>{};

    for (final id in _moduleIds) {
      final lesson = catalog.moduleLesson(id);

      for (final section in lesson.sections) {
        expect(seenIds.add(section.id), isTrue, reason: 'dup ${section.id}');
        expect(section.title, isNot(kSourceMissing), reason: section.id);
        expect(section.body, isNotEmpty, reason: section.id);
        // Every doctrinal claim must be traceable back to a PDF page.
        expect(section.sourceRefs, isNotEmpty, reason: section.id);
        for (final ref in section.sourceRefs) {
          expect(ref.file, endsWith('.pdf'), reason: section.id);
          expect(ref.page, isNotNull, reason: section.id);
        }
      }

      for (final card in lesson.reviewCards) {
        expect(seenIds.add(card.id), isTrue, reason: 'dup ${card.id}');
        expect(card.front, isNotEmpty);
        expect(card.back, isNotEmpty);
      }

      for (final seed in lesson.quizSeeds) {
        expect(seenIds.add(seed.id), isTrue, reason: 'dup ${seed.id}');
        expect(seed.type, 'mcq', reason: seed.id);
        expect(seed.distractors, isNotEmpty, reason: seed.id);
        // A distractor equal to the answer would make two options correct.
        expect(
          seed.distractors,
          isNot(contains(seed.correctAnswer)),
          reason: seed.id,
        );
        expect(
          seed.distractors.toSet().length,
          seed.distractors.length,
          reason: 'duplicate distractors in ${seed.id}',
        );
      }
    }
  });

  test('an unknown module falls back to empty instead of throwing', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final catalog = await container.read(contentCatalogProvider('vi').future);

    expect(catalog.moduleLesson('NOT_A_MODULE'), ModuleLessonContent.empty);
    expect(
      catalog.moduleText('NOT_A_MODULE', 'title', 'fallback'),
      'fallback',
    );
  });
}
