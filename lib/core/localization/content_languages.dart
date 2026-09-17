// lib/core/localization/content_languages.dart
//
// Registry of *content* languages (the language of the study material), as
// opposed to *UI* languages (the 26 locales listed in `supportedAppLanguages`).
//
// WHY A SEPARATE REGISTRY
// -----------------------
// Interface strings are cheap: an ARB key is a short label and a machine
// translation that a reviewer can sanity-check in seconds. Doctrinal study
// content is not. A mistranslated Abhidhamma term teaches wrong Dhamma, which
// violates the project's Accuracy-First principle. So the two lists are
// allowed to diverge: the UI ships 26 locales today, while content ships only
// the locales that have actually been authored and reviewed.
//
// HOW TO ENABLE A NEW CONTENT LANGUAGE
// ------------------------------------
// 1. Author `assets/content/content_<tag>.json` (see tool/content/README.md).
// 2. Flip that language's [status] here from [ContentTranslationStatus.planned]
//    to `.draft`, and later to `.reviewed`.
// That is the only code change required: the picker, the fallback chain, the
// coverage report and the persistence layer all read this list.

import 'package:flutter/foundation.dart';

/// Editorial state of one content language.
///
/// Mirrors the Content Governance workflow in `doc/blueprint.md`:
/// `Soạn dữ liệu → Peer Review → Senior Approval → Merge`.
enum ContentTranslationStatus {
  /// Authored from the original VDP source material. Highest authority.
  source,

  /// Fully translated **and** approved by a reviewer with doctrinal standing.
  reviewed,

  /// Translated but not yet approved. Selectable, but the UI must warn the
  /// learner that the text is provisional.
  draft,

  /// Declared but not shipped yet. Hidden from the picker; exists here so the
  /// tooling can generate worksheets and report coverage against a fixed
  /// target list.
  planned,
}

/// One selectable study-content language.
@immutable
class ContentLanguage {
  /// Locale tag used for the asset file name: `assets/content/content_<tag>.json`.
  ///
  /// Uses the same `language_COUNTRY` shape as [AppLanguage.localeTag] so a UI
  /// locale can be mapped onto a content locale without translation.
  final String tag;

  /// Endonym. Deliberately *not* localised: a learner who picked a script they
  /// cannot read must still be able to find their way back.
  final String nativeName;

  /// Stable English name, used for search and for developer-facing logs.
  final String englishName;

  final ContentTranslationStatus status;

  /// Extra search tokens for the picker (romanisations, alternate names).
  final List<String> aliases;

  const ContentLanguage({
    required this.tag,
    required this.nativeName,
    required this.englishName,
    required this.status,
    this.aliases = const [],
  });

  /// Whether a learner may choose this language today.
  bool get isSelectable => status != ContentTranslationStatus.planned;

  /// Whether the learner should be warned that the text is provisional.
  bool get needsReviewWarning => status == ContentTranslationStatus.draft;

  /// Short, deliberately untranslated badge shown next to provisional
  /// languages. Kept as an ASCII token so it needs no ARB key in 26 locales
  /// and renders in every bundled font subset.
  String? get statusBadge => switch (status) {
        ContentTranslationStatus.draft => 'DRAFT',
        ContentTranslationStatus.source ||
        ContentTranslationStatus.reviewed ||
        ContentTranslationStatus.planned =>
          null,
      };

  /// Recovery-safe label: endonym plus a Latin-script name and the tag, so it
  /// is identifiable even when the surrounding UI is in an unreadable script.
  String get safeDisplayName => nativeName == englishName
      ? '$nativeName (${tag.toUpperCase()})'
      : '$nativeName · $englishName (${tag.toUpperCase()})';

  bool matches(String rawQuery) {
    final query = rawQuery.trim().toLowerCase();
    if (query.isEmpty) return true;
    return <String>[nativeName, englishName, tag, ...aliases]
        .any((value) => value.toLowerCase().contains(query));
  }
}

/// Every content language the project targets, shipped or not.
///
/// Order is intentional: shipped languages first, then the five priority
/// languages agreed for the localisation milestone (Hindi, Chinese, Sinhala,
/// Myanmar, Japanese) in the order they appear in the plan.
const kContentLanguages = <ContentLanguage>[
  ContentLanguage(
    tag: 'vi',
    nativeName: 'Tiếng Việt',
    englishName: 'Vietnamese',
    status: ContentTranslationStatus.source,
    aliases: ['viet', 'việt'],
  ),
  ContentLanguage(
    tag: 'en',
    nativeName: 'English',
    englishName: 'English',
    status: ContentTranslationStatus.reviewed,
  ),
  // ── Priority wave 1 ───────────────────────────────────────────────────────
  // Flip `status` to `draft` as soon as content_<tag>.json ships, then to
  // `reviewed` after native doctrinal review. See
  // doc/localization_content_plan.md.
  ContentLanguage(
    tag: 'hi',
    nativeName: 'हिन्दी',
    englishName: 'Hindi',
    status: ContentTranslationStatus.draft,
    aliases: ['hindi'],
  ),
  ContentLanguage(
    tag: 'zh',
    nativeName: '简体中文',
    englishName: 'Simplified Chinese',
    status: ContentTranslationStatus.draft,
    aliases: ['chinese', '中文', 'zh-cn', 'hans'],
  ),
  ContentLanguage(
    tag: 'zh_TW',
    nativeName: '繁體中文',
    englishName: 'Traditional Chinese',
    status: ContentTranslationStatus.draft,
    aliases: ['chinese', '中文', 'zh-hant', 'zh-tw', 'hant'],
  ),
  ContentLanguage(
    tag: 'si',
    nativeName: 'සිංහල',
    englishName: 'Sinhala',
    status: ContentTranslationStatus.draft,
    aliases: ['sinhala', 'sinhalese'],
  ),
  ContentLanguage(
    tag: 'my',
    nativeName: 'မြန်မာ',
    englishName: 'Myanmar',
    status: ContentTranslationStatus.draft,
    aliases: ['burmese', 'myanmar'],
  ),
  ContentLanguage(
    tag: 'ja',
    nativeName: '日本語',
    englishName: 'Japanese',
    status: ContentTranslationStatus.draft,
    aliases: ['japanese', 'nihongo'],
  ),
  ContentLanguage(
    tag: 'th',
    nativeName: 'ไทย',
    englishName: 'Thai',
    status: ContentTranslationStatus.draft,
    aliases: ['thai'],
  ),
];

/// Languages a learner can pick right now, in registry order.
List<ContentLanguage> get selectableContentLanguages =>
    kContentLanguages.where((language) => language.isSelectable).toList();

/// Looks a language up by tag, tolerating `-`/`_` and case differences.
///
/// Returns `null` for unknown tags so callers can fall back rather than throw.
ContentLanguage? contentLanguageFor(String? tag) {
  if (tag == null || tag.isEmpty) return null;
  final normalized = tag.replaceAll('-', '_').toLowerCase();
  for (final language in kContentLanguages) {
    if (language.tag.toLowerCase() == normalized) return language;
  }
  return null;
}

/// The content language to use when nothing has been saved yet.
///
/// Maps the *device* locale onto a content language so a Sinhala device gets
/// Sinhala study text the first time the app opens — but only once Sinhala is
/// actually selectable. Everything else lands on English, the international
/// fallback.
///
/// [languageCode] / [countryCode] come from `PlatformDispatcher.instance.locale`.
String defaultContentLocaleFor({
  required String languageCode,
  String? countryCode,
  String? scriptCode,
}) {
  // Traditional Chinese must be resolved before the generic `zh` match, the
  // same way `resolveSupportedLocale` does it for the UI.
  if (languageCode == 'zh') {
    final script = scriptCode?.toLowerCase();
    final country = countryCode?.toUpperCase();
    final wantsTraditional = script == 'hant' ||
        country == 'TW' ||
        country == 'HK' ||
        country == 'MO';
    final candidate = contentLanguageFor(wantsTraditional ? 'zh_TW' : 'zh');
    if (candidate != null && candidate.isSelectable) return candidate.tag;
    // A zh_TW device should still prefer zh over en if only zh shipped.
    final simplified = contentLanguageFor('zh');
    if (simplified != null && simplified.isSelectable) return simplified.tag;
    return 'en';
  }

  final exact = contentLanguageFor(
    countryCode == null || countryCode.isEmpty
        ? languageCode
        : '${languageCode}_$countryCode',
  );
  if (exact != null && exact.isSelectable) return exact.tag;

  final base = contentLanguageFor(languageCode);
  if (base != null && base.isSelectable) return base.tag;

  return 'en';
}
