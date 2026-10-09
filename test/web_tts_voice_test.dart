import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vdp_app/features/audio/data/web_tts_voice.dart';
import 'package:vdp_app/features/audio/services/web_tts_voice_catalog.dart';
import 'package:vdp_app/features/audio/services/web_tts_voice_preferences.dart';

void main() {
  group('WebTtsVoice', () {
    test('parses browser voice rows and ignores incomplete rows', () {
      final voices = parseWebTtsVoices([
        {'name': 'Microsoft NamMinh Online (Natural)', 'locale': 'vi-VN'},
        {'name': 'Google US English', 'locale': 'en-US'},
        {'name': '', 'locale': 'fr-FR'},
        'not-a-voice',
      ]);

      expect(voices, hasLength(2));
      expect(voices.first.name, contains('NamMinh'));
      expect(voices.first.languageCode, 'vi');
      expect(voices.first.isLikelyMale, isTrue);
      expect(voices.last.toFlutterTtsVoice(), {
        'name': 'Google US English',
        'locale': 'en-US',
      });
    });

    test('Vietnamese automatic selection prefers recognizable male voice', () {
      final voices = parseWebTtsVoices([
        {'name': 'Microsoft HoaiMy Online (Natural)', 'locale': 'vi-VN'},
        {'name': 'Microsoft NamMinh Online (Natural)', 'locale': 'vi-VN'},
        {'name': 'English Voice', 'locale': 'en-US'},
      ]);

      expect(
        resolveWebTtsVoice(voices: voices, contentLocaleTag: 'vi')?.name,
        contains('NamMinh'),
      );
      expect(
        resolveWebTtsVoice(voices: voices, contentLocaleTag: 'en')?.name,
        'English Voice',
      );
    });

    test('explicit selection wins only for a matching language', () {
      final voices = parseWebTtsVoices([
        {'name': 'Female VI', 'locale': 'vi-VN'},
        {'name': 'English UK', 'locale': 'en-GB'},
      ]);

      expect(
        resolveWebTtsVoice(
          voices: voices,
          contentLocaleTag: 'vi',
          preferred: voices.first,
        ),
        voices.first,
      );
      expect(
        resolveWebTtsVoice(
          voices: voices,
          contentLocaleTag: 'vi',
          preferred: voices.last,
        ),
        voices.first,
      );
    });

    test('region-specific content prefers that region when available', () {
      final voices = parseWebTtsVoices([
        {'name': 'Mandarin China', 'locale': 'zh-CN'},
        {'name': 'Mandarin Taiwan', 'locale': 'zh-TW'},
      ]);

      expect(
        webTtsVoicesForLocale(voices, 'zh_TW').map((voice) => voice.name),
        ['Mandarin Taiwan'],
      );
      expect(
        resolveWebTtsVoice(voices: voices, contentLocaleTag: 'zh_TW')?.name,
        'Mandarin Taiwan',
      );
    });

    test('female voice names are not mistaken for male', () {
      final voice = WebTtsVoice(
        name: 'Microsoft Female Voice',
        locale: 'vi-VN',
      );
      expect(voice.isLikelyMale, isFalse);
      expect(voice.isLikelyFemale, isTrue);
    });

    test('"Việt Nam" in a voice name is not treated as male (IN4-74)', () {
      for (final name in [
        'Tiếng Việt (Việt Nam)',
        'Vietnamese (Viet Nam)',
        'Google Tiếng Việt',
        'vi-vn-x-gft-network',
      ]) {
        final voice = WebTtsVoice(name: name, locale: 'vi-VN');
        expect(voice.genderHint, WebTtsVoiceGender.unknown, reason: name);
        expect(voice.isLikelyMale, isFalse, reason: name);
      }
    });

    test('known Vietnamese voices get a gender; others stay unknown', () {
      WebTtsVoiceGender g(String name) =>
          WebTtsVoice(name: name, locale: 'vi-VN').genderHint;

      expect(g('Microsoft NamMinh Online (Natural) - Vietnamese (Vietnam)'),
          WebTtsVoiceGender.male);
      expect(g('Microsoft HoaiMy Online (Natural) - Vietnamese (Vietnam)'),
          WebTtsVoiceGender.female);
      expect(g('Microsoft An - Vietnamese (Vietnam)'), WebTtsVoiceGender.male);
      expect(g('Linh'), WebTtsVoiceGender.female);
      expect(g('vi-VN-Wavenet-B'), WebTtsVoiceGender.male);
      expect(g('vi-VN-Neural2-D'), WebTtsVoiceGender.male);
      expect(g('vi-VN-Wavenet-A'), WebTtsVoiceGender.female);
      expect(g('vi-VN-Standard-C'), WebTtsVoiceGender.female);
      expect(g('Some Vendor Voice'), WebTtsVoiceGender.unknown);
    });

    test('explicit gender metadata wins and "female" never reads as male', () {
      expect(
        const WebTtsVoice(name: 'X', locale: 'vi-VN', gender: 'female')
            .genderHint,
        WebTtsVoiceGender.female,
      );
      expect(
        const WebTtsVoice(name: 'X', locale: 'vi-VN', gender: 'male')
            .genderHint,
        WebTtsVoiceGender.male,
      );
    });

    test('gender label key: unknown voices read "Chưa xác định"', () {
      expect(
        const WebTtsVoice(name: 'Tiếng Việt (Việt Nam)', locale: 'vi-VN')
            .genderLabelKey,
        'unknownGender',
      );
      expect(
        const WebTtsVoice(
          name: 'Microsoft NamMinh Online (Natural)',
          locale: 'vi-VN',
        ).genderLabelKey,
        'male',
      );
      expect(
        const WebTtsVoice(
          name: 'Microsoft HoaiMy Online (Natural)',
          locale: 'vi-VN',
          gender: 'female',
        ).genderLabelKey,
        'female',
      );
    });

    test('automatic Vietnamese ranks unknown above known female', () {
      final voices = parseWebTtsVoices([
        {'name': 'Microsoft HoaiMy Online (Natural)', 'locale': 'vi-VN'},
        {'name': 'Google Tiếng Việt', 'locale': 'vi-VN'},
      ]);
      expect(
        resolveWebTtsVoice(voices: voices, contentLocaleTag: 'vi')?.name,
        'Google Tiếng Việt',
      );
      expect(hasIdentifiableVietnameseMaleVoice(voices), isFalse);
    });

    test('browser order breaks ties deterministically', () {
      final voices = parseWebTtsVoices([
        {'name': 'Voice 1', 'locale': 'en-US'},
        {'name': 'Voice 2', 'locale': 'en-US'},
        {'name': 'Voice 3', 'locale': 'en-US'},
      ]);
      expect(
        sortWebTtsVoicesForLocale(voices, 'en').map((voice) => voice.name),
        ['Voice 1', 'Voice 2', 'Voice 3'],
      );
    });

    test('mergeWebTtsVoices keeps first-seen order without duplicates', () {
      final first = parseWebTtsVoices([
        {'name': 'A', 'locale': 'vi-VN'},
      ]);
      final second = parseWebTtsVoices([
        {'name': 'A', 'locale': 'vi-VN'},
        {'name': 'B', 'locale': 'vi-VN'},
      ]);
      expect(
        mergeWebTtsVoices(first, second).map((voice) => voice.name),
        ['A', 'B'],
      );
    });
  });

  group('WebTtsVoiceCatalog', () {
    late DateTime clock;

    WebTtsVoiceCatalog catalogFor(
      List<Object?> Function(int call) snapshot, {
      Duration tailWindow = Duration.zero,
    }) {
      var calls = 0;
      return WebTtsVoiceCatalog(
        readVoices: () async => snapshot(calls++),
        now: () => clock,
        delay: (duration) async => clock = clock.add(duration),
        tailWindow: tailWindow,
      );
    }

    setUp(() => clock = DateTime(2026, 10, 9));

    test('merges a partial first list with voices published later', () async {
      // Edge-like: one local voice first, online Natural voices ~0.6 s later.
      final catalog = catalogFor((call) => [
            {'name': 'Microsoft An - Vietnamese (Vietnam)', 'locale': 'vi-VN'},
            if (call >= 3) ...[
              {'name': 'Microsoft HoaiMy Online (Natural)', 'locale': 'vi-VN'},
              {'name': 'Microsoft NamMinh Online (Natural)', 'locale': 'vi-VN'},
            ],
          ]);

      final voices = await catalog.load();
      expect(voices, hasLength(3));
      expect(
        clock.difference(DateTime(2026, 10, 9)),
        greaterThanOrEqualTo(const Duration(milliseconds: 1400)),
      );
    });

    test('stops at the maximum window when the list never settles', () async {
      var counter = 0;
      final catalog = catalogFor((_) => [
            {'name': 'Voice ${counter++}', 'locale': 'en-US'},
          ]);
      await catalog.load();
      expect(
        clock.difference(DateTime(2026, 10, 9)),
        lessThanOrEqualTo(const Duration(milliseconds: 2400)),
      );
    });

    test('caches the stabilized list and shares in-flight loads', () async {
      var reads = 0;
      final catalog = catalogFor((_) {
        reads++;
        return [
          {'name': 'English', 'locale': 'en-US'},
        ];
      });
      final results = await Future.wait([catalog.load(), catalog.load()]);
      expect(identical(results[0], results[1]), isTrue);
      final readsAfterFirstLoad = reads;
      await catalog.load();
      expect(reads, readsAfterFirstLoad);
    });

    test('an empty forced refresh keeps the previous good list', () async {
      var empty = false;
      final catalog = catalogFor((_) => empty
          ? const []
          : [
              {'name': 'English', 'locale': 'en-US'},
            ]);
      await catalog.load();
      empty = true;
      final voices = await catalog.load(force: true);
      expect(voices.single.name, 'English');
    });

    test('read errors are treated as empty snapshots', () async {
      final catalog = WebTtsVoiceCatalog(
        readVoices: () async => throw StateError('speechSynthesis missing'),
        now: () => clock,
        delay: (duration) async => clock = clock.add(duration),
      );
      expect(await catalog.load(), isEmpty);
      expect(catalog.hasLoaded, isTrue);
    });

    test('tail polling publishes late voices and notifies listeners', () async {
      var onlinePublished = false;
      final catalog = catalogFor(
        (_) => [
          {'name': 'Microsoft An - Vietnamese (Vietnam)', 'locale': 'vi-VN'},
          if (onlinePublished) ...[
            {'name': 'Microsoft HoaiMy Online (Natural)', 'locale': 'vi-VN'},
            {'name': 'Microsoft NamMinh Online (Natural)', 'locale': 'vi-VN'},
          ],
        ],
        tailWindow: const Duration(milliseconds: 8000),
      );

      final updates = <List<WebTtsVoice>>[];
      catalog.addListener(updates.add);
      final first = await catalog.load();
      expect(first, hasLength(1));

      // Online "Natural" voices appear only after the first snapshot has
      // already settled — the partial non-empty list case from IN4-74.
      onlinePublished = true;
      await catalog.tailFuture;

      expect(catalog.voices, hasLength(3));
      expect(updates, hasLength(1));
      expect(
        updates.last.map((voice) => voice.name),
        contains('Microsoft NamMinh Online (Natural)'),
      );
    });
  });

  group('WebTtsVoicePreferences', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('stores an independent selection for each content locale', () async {
      final preferences = WebTtsVoicePreferences();
      const vietnamese = WebTtsVoice(
        name: 'Microsoft NamMinh Online (Natural)',
        locale: 'vi-VN',
      );
      const traditionalChinese = WebTtsVoice(
        name: 'Mandarin Taiwan',
        locale: 'zh-TW',
      );

      await preferences.saveFor('vi', vietnamese);
      await preferences.saveFor('zh_TW', traditionalChinese);

      expect(await preferences.selectedFor('vi'), vietnamese);
      expect(await preferences.selectedFor('zh_TW'), traditionalChinese);
      expect(await preferences.selectedFor('zh'), isNull);
    });

    test('automatic selection removes only the requested locale', () async {
      final preferences = WebTtsVoicePreferences();
      const vietnamese = WebTtsVoice(name: 'NamMinh', locale: 'vi-VN');
      const english = WebTtsVoice(name: 'English UK', locale: 'en-GB');

      await preferences.saveFor('vi', vietnamese);
      await preferences.saveFor('en', english);
      await preferences.saveFor('vi', null);

      expect(await preferences.selectedFor('vi'), isNull);
      expect(await preferences.selectedFor('en'), english);
    });
  });
}
