import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vdp_app/core/localization/content_catalog.dart';
import 'package:vdp_app/core/localization/content_languages.dart';

/// The five priority content languages agreed in
/// `doc/localization_content_plan.md` (Chinese counts as two registry entries
/// because Simplified and Traditional ship separately).
const _priorityTags = <String>['hi', 'zh', 'zh_TW', 'si', 'my', 'ja'];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('content language registry', () {
    test('every priority language is registered', () {
      for (final tag in _priorityTags) {
        expect(
          contentLanguageFor(tag),
          isNotNull,
          reason: '$tag is missing from kContentLanguages',
        );
      }
    });

    test('tags are unique and asset-name safe', () {
      final tags = kContentLanguages.map((language) => language.tag).toList();
      expect(tags.toSet().length, tags.length, reason: 'duplicate tag');
      for (final tag in tags) {
        // Must map cleanly onto assets/content/content_<tag>.json.
        expect(tag, matches(RegExp(r'^[a-z]{2}(_[A-Za-z]{2,4})?$')), reason: tag);
      }
    });

    test('lookup tolerates dashes and casing', () {
      expect(contentLanguageFor('zh-TW')?.tag, 'zh_TW');
      expect(contentLanguageFor('ZH_tw')?.tag, 'zh_TW');
      expect(contentLanguageFor('HI')?.tag, 'hi');
      expect(contentLanguageFor('klingon'), isNull);
      expect(contentLanguageFor(null), isNull);
      expect(contentLanguageFor(''), isNull);
    });

    test('vi is the source and en is reviewed', () {
      expect(contentLanguageFor('vi')!.status, ContentTranslationStatus.source);
      expect(
        contentLanguageFor('en')!.status,
        ContentTranslationStatus.reviewed,
      );
    });

    test('only shipped languages are selectable', () {
      // A `planned` language has no content_<tag>.json yet, so offering it
      // would strand the learner on an empty catalog.
      for (final language in kContentLanguages) {
        if (language.status == ContentTranslationStatus.planned) {
          expect(language.isSelectable, isFalse, reason: language.tag);
        } else {
          expect(language.isSelectable, isTrue, reason: language.tag);
        }
      }
      expect(selectableContentLanguages.map((l) => l.tag), contains('en'));
      expect(selectableContentLanguages.map((l) => l.tag), contains('vi'));
    });

    test('draft languages warn the learner, reviewed ones do not', () {
      for (final language in kContentLanguages) {
        final isDraft = language.status == ContentTranslationStatus.draft;
        expect(language.needsReviewWarning, isDraft, reason: language.tag);
        expect(language.statusBadge, isDraft ? 'DRAFT' : isNull,
            reason: language.tag);
      }
    });

    test('display names stay identifiable in an unreadable script', () {
      for (final language in kContentLanguages) {
        // Always carries a Latin-script tag so a learner who picked the wrong
        // script can still recognise and undo it.
        expect(language.safeDisplayName, contains(language.tag.toUpperCase()));
        expect(language.nativeName.trim(), isNotEmpty);
        expect(language.englishName.trim(), isNotEmpty);
      }
    });

    test('search matches endonym, English name, tag and aliases', () {
      final hindi = contentLanguageFor('hi')!;
      expect(hindi.matches('हिन'), isTrue);
      expect(hindi.matches('hindi'), isTrue);
      expect(hindi.matches('HI'), isTrue);
      expect(hindi.matches(''), isTrue);
      expect(hindi.matches('japanese'), isFalse);

      expect(contentLanguageFor('my')!.matches('burmese'), isTrue);
      expect(contentLanguageFor('zh_TW')!.matches('hant'), isTrue);
    });
  });

  group('defaultContentLocaleFor', () {
    test('falls back to English for an unshipped language', () {
      // French is not a registered content language, so a French device must
      // still get a usable catalog rather than an empty one.
      expect(defaultContentLocaleFor(languageCode: 'fr'), 'en');
      expect(defaultContentLocaleFor(languageCode: 'xx'), 'en');
      // Hindi shipped as a selectable draft, so a Hindi device now gets Hindi
      // (previously asserted 'en' while Hindi was still `planned`).
      expect(defaultContentLocaleFor(languageCode: 'hi'), 'hi');
    });

    test('a Vietnamese device gets Vietnamese content', () {
      expect(defaultContentLocaleFor(languageCode: 'vi'), 'vi');
      expect(
        defaultContentLocaleFor(languageCode: 'vi', countryCode: 'VN'),
        'vi',
      );
    });

    test('Chinese script/region resolution never throws', () {
      // Both currently resolve to `en` because zh is planned; the point is
      // that the zh_Hant branch is exercised and stays total.
      for (final probe in [
        () => defaultContentLocaleFor(languageCode: 'zh', countryCode: 'TW'),
        () => defaultContentLocaleFor(languageCode: 'zh', scriptCode: 'Hant'),
        () => defaultContentLocaleFor(languageCode: 'zh', countryCode: 'CN'),
        () => defaultContentLocaleFor(languageCode: 'zh'),
      ]) {
        final result = probe();
        expect(contentLanguageFor(result)?.isSelectable, isTrue);
      }
    });

    test('never returns a tag that is not selectable', () {
      for (final tag in [..._priorityTags, 'vi', 'en', 'fr', 'ko']) {
        final parts = tag.split('_');
        final result = defaultContentLocaleFor(
          languageCode: parts.first,
          countryCode: parts.length > 1 ? parts[1] : null,
        );
        final resolved = contentLanguageFor(result);
        expect(resolved, isNotNull, reason: '$tag -> $result');
        expect(resolved!.isSelectable, isTrue, reason: '$tag -> $result');
      }
    });
  });

  group('fallback chain for the priority languages', () {
    test('each priority tag degrades to en then vi', () {
      expect(resolveContentLocaleChain('hi'), ['hi', 'en', 'vi']);
      expect(resolveContentLocaleChain('si'), ['si', 'en', 'vi']);
      expect(resolveContentLocaleChain('my'), ['my', 'en', 'vi']);
      expect(resolveContentLocaleChain('ja'), ['ja', 'en', 'vi']);
      expect(resolveContentLocaleChain('zh'), ['zh', 'en', 'vi']);
      // Traditional Chinese borrows Simplified before English: a zh_TW reader
      // understands zh far better than en.
      expect(resolveContentLocaleChain('zh_TW'), ['zh_TW', 'zh', 'en', 'vi']);
    });

    test('an unauthored locale still serves reviewed content', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // No content_my.json ships yet, so the catalog must transparently fall
      // through to English rather than come back empty.
      final catalog = await container.read(contentCatalogProvider('my').future);
      expect(catalog.locale, 'my');
      expect(
        catalog.text('cetasikas', 'CS_PHASSA', 'name', 'Xúc'),
        'Contact',
        reason: 'should fall through to the English overlay',
      );
      expect(
        catalog.moduleLesson('M1_BASICS').isNotEmpty,
        isTrue,
        reason: 'lesson content should fall through to the Vietnamese source',
      );
    });
  });
}
