import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vdp_app/features/audio/data/web_tts_voice.dart';
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
