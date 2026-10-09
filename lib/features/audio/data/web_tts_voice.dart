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

  /// Conservative gender hint for labelling and automatic Vietnamese ranking.
  ///
  /// Browser voices normally do not report gender (Web Speech exposes only
  /// name, lang, voiceURI, localService and default), so this returns
  /// [WebTtsVoiceGender.unknown] unless explicit metadata is present or the
  /// voice is a known Vietnamese voice ID/name. Generic words are deliberately
  /// NOT used: "nam" is Vietnamese for "male" but also part of "Việt Nam",
  /// which made female voices such as "Tiếng Việt (Việt Nam)" show up as male.
  WebTtsVoiceGender get genderHint {
    final normalizedGender = gender?.trim().toLowerCase() ?? '';
    if (normalizedGender == 'f' ||
        normalizedGender == 'female' ||
        normalizedGender == 'feminine') {
      return WebTtsVoiceGender.female;
    }
    if (normalizedGender == 'm' ||
        normalizedGender == 'male' ||
        normalizedGender == 'masculine') {
      return WebTtsVoiceGender.male;
    }
    return knownWebTtsVoiceGender(name);
  }

  /// True only when the voice is known (or reported) to be male. Unknown
  /// voices are never labelled male.
  bool get isLikelyMale => genderHint == WebTtsVoiceGender.male;

  bool get isLikelyFemale => genderHint == WebTtsVoiceGender.female;

  /// UI copy key for the gender shown next to every voice: `male`, `female`
  /// or `unknownGender` ("Chưa xác định"). An unidentified voice is always
  /// labelled "Chưa xác định" — never guessed as Nam/Nữ (IN4-74).
  String get genderLabelKey => switch (genderHint) {
        WebTtsVoiceGender.male => 'male',
        WebTtsVoiceGender.female => 'female',
        WebTtsVoiceGender.unknown => 'unknownGender',
      };

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

enum WebTtsVoiceGender { male, female, unknown }

String _compactVoiceName(String name) =>
    name.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), ' ').trim();

/// Gender of well-known Vietnamese voices, matched by name/ID only.
///
/// * Microsoft Edge online voices: `vi-VN-NamMinhNeural` (male),
///   `vi-VN-HoaiMyNeural` (female); Windows desktop voice `Microsoft An`
///   (male).
/// * Apple: `Linh` (female).
/// * Google Cloud IDs, when an OS/browser exposes them:
///   `vi-VN-{Standard,Wavenet,Neural2}-*`; B/D are male, A/C are female.
///
/// Everything else returns [WebTtsVoiceGender.unknown].
WebTtsVoiceGender knownWebTtsVoiceGender(String name) {
  final normalized = _compactVoiceName(name);
  final compact = normalized.replaceAll(' ', '');

  if (compact.contains('namminh')) return WebTtsVoiceGender.male;
  if (compact.contains('hoaimy')) return WebTtsVoiceGender.female;

  final cloud = RegExp(r'\b(?:standard|wavenet|neural2)\s+([a-d])\b')
      .firstMatch(normalized);
  if (cloud != null && normalized.contains('vi vn')) {
    return switch (cloud.group(1)) {
      'b' || 'd' => WebTtsVoiceGender.male,
      _ => WebTtsVoiceGender.female,
    };
  }

  // Windows SAPI/OneCore desktop voice: "Microsoft An - Vietnamese (Vietnam)".
  if (RegExp(r'^microsoft an\b').hasMatch(normalized)) {
    return WebTtsVoiceGender.male;
  }
  // Apple Vietnamese voice ("Linh", sometimes "Linh (Enhanced)").
  if (RegExp(r'^linh\b').hasMatch(normalized)) {
    return WebTtsVoiceGender.female;
  }

  // Explicit English gender words in the voice name ("... Male", "Female").
  final words = normalized.split(' ');
  if (words.contains('female')) return WebTtsVoiceGender.female;
  if (words.contains('male')) {
    return WebTtsVoiceGender.male;
  }
  return WebTtsVoiceGender.unknown;
}

/// True when [voices] contains a Vietnamese voice that is known to be male.
bool hasIdentifiableVietnameseMaleVoice(Iterable<WebTtsVoice> voices) =>
    voices.any((voice) => voice.languageCode == 'vi' && voice.isLikelyMale);

/// Merges successive `getVoices()` snapshots, keeping first-seen order.
/// Browsers (notably Chrome) may first publish only local voices and add
/// network voices after `voiceschanged`; merging avoids dropping either set.
List<WebTtsVoice> mergeWebTtsVoices(
  Iterable<WebTtsVoice> current,
  Iterable<WebTtsVoice> incoming,
) {
  final merged = <WebTtsVoice>[];
  final seen = <String>{};
  for (final voice in [...current, ...incoming]) {
    if (seen.add(voice.id)) merged.add(voice);
  }
  return List.unmodifiable(merged);
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
/// known male Vietnamese voice (unknown before known female). Browser order is
/// the final tie-break (Dart's List.sort is not stable, so the original index
/// is used explicitly).
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
    if (languageCode == 'vi') {
      // Prefer a voice known to be male; never rank a known female voice
      // above an unknown one in automatic Vietnamese mode.
      switch (voice.genderHint) {
        case WebTtsVoiceGender.male:
          result += 500;
        case WebTtsVoiceGender.unknown:
          result += 100;
        case WebTtsVoiceGender.female:
          break;
      }
    }
    if (voice.isDefault) result += 10;
    return result;
  }

  final indexed = candidates.indexed.toList()
    ..sort((a, b) {
      final byScore = score(b.$2).compareTo(score(a.$2));
      return byScore != 0 ? byScore : a.$1.compareTo(b.$1);
    });
  return List.unmodifiable(indexed.map((entry) => entry.$2));
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
