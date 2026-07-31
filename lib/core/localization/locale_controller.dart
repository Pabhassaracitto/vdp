import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _uiLocalePreferenceKey = 'abhidhamma_ui_locale';
const _contentLocalePreferenceKey = 'abhidhamma_content_locale';

/// UI language and study-content language are deliberately independent.
class LocaleSettings {
  final Locale? uiLocale;
  final String contentLocale;
  final bool loaded;

  const LocaleSettings({
    required this.uiLocale,
    required this.contentLocale,
    this.loaded = false,
  });

  LocaleSettings copyWith({
    Locale? uiLocale,
    bool clearUiLocale = false,
    String? contentLocale,
    bool? loaded,
  }) {
    return LocaleSettings(
      uiLocale: clearUiLocale ? null : (uiLocale ?? this.uiLocale),
      contentLocale: contentLocale ?? this.contentLocale,
      loaded: loaded ?? this.loaded,
    );
  }
}

class LocaleSettingsController extends StateNotifier<LocaleSettings> {
  LocaleSettingsController()
      : super(LocaleSettings(
          uiLocale: null,
          contentLocale:
              ui.PlatformDispatcher.instance.locale.languageCode == 'vi'
                  ? 'vi'
                  : 'en',
        )) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUiTag = prefs.getString(_uiLocalePreferenceKey);
    final savedContent = prefs.getString(_contentLocalePreferenceKey);

    state = LocaleSettings(
      uiLocale: AppLanguage.fromTag(savedUiTag)?.locale,
      contentLocale: savedContent == 'vi' || savedContent == 'en'
          ? savedContent!
          : state.contentLocale,
      loaded: true,
    );
  }

  Future<void> setUiLocale(Locale? locale) async {
    state = locale == null
        ? state.copyWith(clearUiLocale: true)
        : state.copyWith(uiLocale: locale);

    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(_uiLocalePreferenceKey);
    } else {
      await prefs.setString(
        _uiLocalePreferenceKey,
        AppLanguage.localeTag(locale),
      );
    }
  }

  Future<void> setContentLocale(String languageCode) async {
    if (languageCode != 'vi' && languageCode != 'en') return;
    state = state.copyWith(contentLocale: languageCode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_contentLocalePreferenceKey, languageCode);
  }
}

final localeSettingsProvider =
    StateNotifierProvider<LocaleSettingsController, LocaleSettings>(
  (ref) => LocaleSettingsController(),
);

class AppLanguage {
  final Locale locale;
  final String nativeName;
  final String englishName;
  final List<String> aliases;

  const AppLanguage({
    required this.locale,
    required this.nativeName,
    required this.englishName,
    this.aliases = const [],
  });

  String get tag => localeTag(locale);
  String get safeDisplayName => nativeName == englishName
      ? '$nativeName (${tag.toUpperCase()})'
      : '$nativeName · $englishName (${tag.toUpperCase()})';

  bool matches(String rawQuery) {
    final query = rawQuery.trim().toLowerCase();
    if (query.isEmpty) return true;
    return <String>[nativeName, englishName, tag, ...aliases]
        .any((value) => value.toLowerCase().contains(query));
  }

  static String localeTag(Locale locale) {
    final country = locale.countryCode;
    return country == null || country.isEmpty
        ? locale.languageCode
        : '${locale.languageCode}_$country';
  }

  static AppLanguage? fromTag(String? tag) {
    if (tag == null || tag.isEmpty) return null;
    final normalized = tag.replaceAll('-', '_').toLowerCase();
    for (final language in supportedAppLanguages) {
      if (language.tag.toLowerCase() == normalized) return language;
    }
    return null;
  }
}

/// Stable, non-localized names make it possible to recover after accidentally
/// choosing a language the user cannot read.
const supportedAppLanguages = <AppLanguage>[
  AppLanguage(
    locale: Locale('vi'),
    nativeName: 'Tiếng Việt',
    englishName: 'Vietnamese',
    aliases: ['viet', 'việt'],
  ),
  AppLanguage(
    locale: Locale('en'),
    nativeName: 'English',
    englishName: 'English',
  ),
  AppLanguage(
    locale: Locale('zh'),
    nativeName: '简体中文',
    englishName: 'Simplified Chinese',
    aliases: ['Chinese', '中文', 'zh-CN'],
  ),
  AppLanguage(
    locale: Locale('zh', 'TW'),
    nativeName: '繁體中文',
    englishName: 'Traditional Chinese',
    aliases: ['Chinese', '中文', 'zh-Hant', 'zh-TW'],
  ),
  AppLanguage(
    locale: Locale('hi'),
    nativeName: 'हिन्दी',
    englishName: 'Hindi',
  ),
  AppLanguage(
    locale: Locale('my'),
    nativeName: 'မြန်မာ',
    englishName: 'Myanmar',
    aliases: ['Burmese'],
  ),
  AppLanguage(
    locale: Locale('si'),
    nativeName: 'සිංහල',
    englishName: 'Sinhala',
  ),
  AppLanguage(
    locale: Locale('ar'),
    nativeName: 'العربية',
    englishName: 'Arabic',
  ),
  AppLanguage(
    locale: Locale('bn'),
    nativeName: 'বাংলা',
    englishName: 'Bengali',
    aliases: ['Bangla'],
  ),
  AppLanguage(
    locale: Locale('bo'),
    nativeName: 'བོད་ཡིག',
    englishName: 'Tibetan',
  ),
  AppLanguage(
    locale: Locale('de'),
    nativeName: 'Deutsch',
    englishName: 'German',
  ),
  AppLanguage(
    locale: Locale('es'),
    nativeName: 'Español',
    englishName: 'Spanish',
  ),
  AppLanguage(
    locale: Locale('fr'),
    nativeName: 'Français',
    englishName: 'French',
  ),
  AppLanguage(
    locale: Locale('id'),
    nativeName: 'Bahasa Indonesia',
    englishName: 'Indonesian',
  ),
  AppLanguage(
    locale: Locale('it'),
    nativeName: 'Italiano',
    englishName: 'Italian',
  ),
  AppLanguage(
    locale: Locale('ja'),
    nativeName: '日本語',
    englishName: 'Japanese',
  ),
  AppLanguage(
    locale: Locale('km'),
    nativeName: 'ភាសាខ្មែរ',
    englishName: 'Khmer',
  ),
  AppLanguage(
    locale: Locale('ko'),
    nativeName: '한국어',
    englishName: 'Korean',
  ),
  AppLanguage(
    locale: Locale('lo'),
    nativeName: 'ລາວ',
    englishName: 'Lao',
  ),
  AppLanguage(
    locale: Locale('mn'),
    nativeName: 'Монгол',
    englishName: 'Mongolian',
  ),
  AppLanguage(
    locale: Locale('mr'),
    nativeName: 'मराठी',
    englishName: 'Marathi',
  ),
  AppLanguage(
    locale: Locale('pt'),
    nativeName: 'Português',
    englishName: 'Portuguese',
  ),
  AppLanguage(
    locale: Locale('ru'),
    nativeName: 'Русский',
    englishName: 'Russian',
  ),
  AppLanguage(
    locale: Locale('ta'),
    nativeName: 'தமிழ்',
    englishName: 'Tamil',
  ),
  AppLanguage(
    locale: Locale('te'),
    nativeName: 'తెలుగు',
    englishName: 'Telugu',
  ),
  AppLanguage(
    locale: Locale('th'),
    nativeName: 'ไทย',
    englishName: 'Thai',
  ),
];

/// Resolves Traditional Chinese explicitly before Flutter's generic language
/// match can route a zh-Hant device to Simplified Chinese.
Locale resolveSupportedLocale(
  List<Locale>? preferredLocales,
  Iterable<Locale> supportedLocales,
) {
  final preferred = preferredLocales ?? const <Locale>[];
  for (final locale in preferred) {
    if (locale.languageCode == 'zh') {
      final script = locale.scriptCode?.toLowerCase();
      final country = locale.countryCode?.toUpperCase();
      if (script == 'hant' || country == 'TW' || country == 'HK' || country == 'MO') {
        return const Locale('zh', 'TW');
      }
      return const Locale('zh');
    }

    for (final supported in supportedLocales) {
      if (supported.languageCode == locale.languageCode) return supported;
    }
  }
  return const Locale('en');
}
