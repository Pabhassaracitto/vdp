import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vdp_app/core/localization/locale_controller.dart';
import 'package:vdp_app/l10n/l10n.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('all 26 approved UI locales are generated', () {
    expect(AppLocalizations.supportedLocales, hasLength(26));
    expect(supportedAppLanguages, hasLength(26));
    expect(
      AppLocalizations.supportedLocales,
      contains(const Locale('zh', 'TW')),
    );
    expect(AppLocalizations.supportedLocales, contains(const Locale('my')));
    expect(AppLocalizations.supportedLocales, contains(const Locale('si')));
  });

  test('Traditional Chinese device variants resolve to zh_TW', () {
    final supported = AppLocalizations.supportedLocales;
    expect(
      resolveSupportedLocale(
        const [Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')],
        supported,
      ),
      const Locale('zh', 'TW'),
    );
    expect(
      resolveSupportedLocale(const [Locale('zh', 'HK')], supported),
      const Locale('zh', 'TW'),
    );
    expect(
      resolveSupportedLocale(const [Locale('zh', 'CN')], supported),
      const Locale('zh'),
    );
  });

  test('unsupported device locale falls back to English', () {
    expect(
      resolveSupportedLocale(
        const [Locale('nl')],
        AppLocalizations.supportedLocales,
      ),
      const Locale('en'),
    );
  });

  test('language aliases provide a safe recovery path', () {
    final vietnamese = AppLanguage.fromTag('vi');
    final traditionalChinese = AppLanguage.fromTag('zh-TW');
    expect(vietnamese?.matches('Vietnamese'), isTrue);
    expect(vietnamese?.matches('Tiếng Việt'), isTrue);
    expect(traditionalChinese?.matches('zh-Hant'), isTrue);
    expect(AppLanguage.fromTag('not-supported'), isNull);
  });

  testWidgets('Arabic locale enables RTL and renders native settings label',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ar'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Builder(
          builder: (context) => Scaffold(
            body: Text(context.l10n.navSettings),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('الإعدادات'), findsOneWidget);
    final directionality = tester.widget<Directionality>(
      find.byType(Directionality).first,
    );
    expect(directionality.textDirection, TextDirection.rtl);
  });

  testWidgets('Vietnamese and English resources can be switched',
      (tester) async {
    Future<void> pumpLocale(Locale locale) {
      return tester.pumpWidget(
        MaterialApp(
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Builder(
            builder: (context) => Scaffold(
              body: Text(context.l10n.navStudy),
            ),
          ),
        ),
      );
    }

    await pumpLocale(const Locale('vi'));
    await tester.pumpAndSettle();
    expect(find.text('Học Tập'), findsOneWidget);

    await pumpLocale(const Locale('en'));
    await tester.pumpAndSettle();
    expect(find.text('Study'), findsOneWidget);
  });
}
