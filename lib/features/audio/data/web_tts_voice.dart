import 'package:flutter/foundation.dart';

/// A voice exposed by the browser's Web Speech API via `flutter_tts`.
///
/// Browser voice metadata is intentionally treated as best-effort: the Web
/// Speech API does not standardize voice gender, and some browsers expose only
/// a name and BCP-47 locale.
@immutable
class WebTtsVoice {
  const WebTtsVoice({
    required this.name,
    required this.locale,
    this.gender,
    this.identifier,
    this.isDefault = false,
  });

  final String name;
  final String locale;
  final String? gender;
  final String? identifier;
  final bool isDefault;

  /// Stable enough for a dropdown value and local preference lookup.
  String get id => '${normalizeTtsLocale(locale)}\u0000$name';

  String get languageCode => ttsLanguageCode(locale);

  /// Heuristic only. Browser voices normally do not report gender.
  bool get isLikelyMale {
    final normalizedGender = gender?.trim().toLowerCase() ?? '';
    if (normalizedGender == 'f' || normalizedGender.contains('female')) {
      return false;
    }
    if (normalizedGender == 'm' || normalizedGender.contains('male')) {
      return true;
    }

    final normalizedName = name.toLowerCase().replaceAll(
          RegExp(r'[^a-z0-9]+'),
          ' ',
        );
    final compactName = normalizedName.replaceAll(' ', '');
    if (compactName.contains('namminh')) return true;

    // Cloud voice names can also appear in the browser's list when an OS or
    // browser has installed them. Keep these known male Vietnamese examples
    // near the front without claiming that every browser exposes them.
    if (RegExp(r'\b(neural2 d|wavenet b|wavenet d)\b')
        .hasMatch(normalizedName)) {
      return true;
    }

    final words = normalizedName.split(' ');
    return words.contains('male') ||
        words.contains('masculine') ||
        words.contains('nam');
  }

  /// Shape expected by `FlutterTts.setVoice` on the web implementation.
  Map<String, String> toFlutterTtsVoice() => {
        'name': name,
        'locale': locale,
      };

  bool supportsLanguage(String languageTag) =>
      languageCode == ttsLanguageCode(languageTag);

  @override
  bool operator ==(Object other) =>
      other is WebTtsVoice && other.name == name && other.locale == locale;

  @override
  int get hashCode => Object.hash(name, locale);

  factory WebTtsVoice.fromDynamic(Object? raw) {
    if (raw is! Map) {
      throw const FormatException('TTS voice must be a map');
    }

    Object? field(String key) {
      for (final entry in raw.entries) {
        if (entry.key.toString().toLowerCase() == key) return entry.value;
      }
      return null;
    }

    final name = field('name')?.toString().trim() ?? '';
    final locale = (field('locale') ?? field('lang') ?? field('language'))
            ?.toString()
            .trim() ??
        '';
    if (name.isEmpty || locale.isEmpty) {
      throw const FormatException('TTS voice is missing name or locale');
    }

    final gender = field('gender')?.toString().trim();
    final identifier = (field('identifier') ?? field('voiceuri'))
        ?.toString()
        .trim();
    final defaultValue = field('default');

    return WebTtsVoice(
      name: name,
      locale: locale,
      gender: gender == null || gender.isEmpty ? null : gender,
      identifier:
          identifier == null || identifier.isEmpty ? null : identifier,
      isDefault: defaultValue == true ||
          defaultValue?.toString().toLowerCase() == 'true',
    );
  }
}

/// Converts either an app content tag (`zh_TW`) or a BCP-47 tag (`vi-VN`) to a
/// comparison/storage form (`zh-tw`, `vi-vn`).
String normalizeTtsLocale(String localeTag) =>
    localeTag.trim().replaceAll('_', '-').toLowerCase();

String ttsLanguageCode(String localeTag) =>
    normalizeTtsLocale(localeTag).split('-').first;

/// Parses the dynamic result returned by `FlutterTts.getVoices`.
List<WebTtsVoice> parseWebTtsVoices(Object? raw) {
  if (raw is! Iterable) return const [];
  final voices = <WebTtsVoice>[];
  final seen = <String>{};
  for (final item in raw) {
    try {
      final voice = WebTtsVoice.fromDynamic(item);
      if (seen.add(voice.id)) voices.add(voice);
    } on FormatException {
      // Ignore incomplete rows from an OS/browser plugin instead of hiding all
      // other voices in the picker.
    }
  }
  return List.unmodifiable(voices);
}

/// Lists voices for one content locale, preferring an exact region and then a
/// likely male Vietnamese voice. Browser order is the final tie-break.
List<WebTtsVoice> sortWebTtsVoicesForLocale(
  Iterable<WebTtsVoice> voices,
  String contentLocaleTag,
) {
  final languageCode = ttsLanguageCode(contentLocaleTag);
  final normalizedTarget = normalizeTtsLocale(contentLocaleTag);
  final candidates = voices
      .where((voice) => voice.languageCode == languageCode)
      .toList(growable: false);

  int score(WebTtsVoice voice) {
    var result = 0;
    final voiceLocale = normalizeTtsLocale(voice.locale);
    if (voiceLocale == normalizedTarget) result += 1000;
    if (languageCode == 'vi' && voice.isLikelyMale) result += 500;
    if (voice.isDefault) result += 10;
    return result;
  }

  return List.unmodifiable(candidates.toList()
    ..sort((a, b) => score(b).compareTo(score(a))));
}

/// Resolves an explicit saved voice when it is still available. If no saved
/// voice can be used, returns the best automatic match (Vietnamese male first).
WebTtsVoice? resolveWebTtsVoice({
  required Iterable<WebTtsVoice> voices,
  required String contentLocaleTag,
  WebTtsVoice? preferred,
}) {
  final sorted = sortWebTtsVoicesForLocale(voices, contentLocaleTag);
  if (preferred != null && preferred.supportsLanguage(contentLocaleTag)) {
    for (final voice in sorted) {
      if (voice.id == preferred.id) return voice;
    }
  }
  return sorted.isEmpty ? null : sorted.first;
}

/// Narrows a voice list for the settings language picker. A region-specific
/// content locale (for example `zh_TW`) uses matching regional voices when
/// installed, otherwise it falls back to all voices for that language.
List<WebTtsVoice> webTtsVoicesForLocale(
  Iterable<WebTtsVoice> voices,
  String contentLocaleTag,
) {
  final sorted = sortWebTtsVoicesForLocale(voices, contentLocaleTag);
  final target = normalizeTtsLocale(contentLocaleTag);
  if (!target.contains('-')) return sorted;
  final exactRegion = sorted
      .where((voice) => normalizeTtsLocale(voice.locale) == target)
      .toList(growable: false);
  return exactRegion.isEmpty ? sorted : List.unmodifiable(exactRegion);
}

String webTtsPreviewText(String localeTag) =>
    switch (ttsLanguageCode(localeTag)) {
      'vi' => 'Xin chào. Đây là giọng đọc mẫu của VDP.',
      'ja' => 'こんにちは。VDPの音声を確認しています。',
      'zh' => '你好，这是 VDP 的语音示例。',
      'ko' => '안녕하세요. VDP 음성 미리 듣기입니다.',
      'my' => 'မင်္ဂလာပါ။ VDP အသံကို စမ်းသပ်နေပါသည်။',
      _ => 'Hello. This is a preview of the selected VDP voice.',
    };
