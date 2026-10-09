import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/web_tts_voice.dart';

/// Local, per-content-language browser voice preferences.
///
/// The web TTS voice list belongs to the browser/operating system, so only the
/// selected voice name and locale are stored. No cloud key or audio is stored.
class WebTtsVoicePreferences {
  WebTtsVoicePreferences({
    Future<SharedPreferences> Function()? getPreferences,
  }) : _getPreferences = getPreferences ?? SharedPreferences.getInstance;

  static final WebTtsVoicePreferences instance = WebTtsVoicePreferences();
  static const String storageKey = 'vdp_audio_web_tts_voices_v1';

  final Future<SharedPreferences> Function() _getPreferences;
  Map<String, WebTtsVoice>? _cache;

  Future<Map<String, WebTtsVoice>> loadAll() async {
    final cached = _cache;
    if (cached != null) return Map.unmodifiable(cached);

    try {
      final preferences = await _getPreferences();
      final stored = preferences.getString(storageKey);
      if (stored == null || stored.isEmpty) {
        _cache = <String, WebTtsVoice>{};
        return const {};
      }

      final decoded = jsonDecode(stored);
      if (decoded is! Map) {
        _cache = <String, WebTtsVoice>{};
        return const {};
      }

      final selections = <String, WebTtsVoice>{};
      for (final entry in decoded.entries) {
        try {
          final voice = WebTtsVoice.fromDynamic(entry.value);
          selections[normalizeTtsLocale(entry.key.toString())] = voice;
        } on FormatException {
          // One damaged preference should not prevent other languages loading.
        }
      }
      _cache = selections;
      return Map.unmodifiable(selections);
    } catch (_) {
      _cache ??= <String, WebTtsVoice>{};
      return Map.unmodifiable(_cache!);
    }
  }

  /// Returns only the exact content-locale preference. Regional languages
  /// such as `zh` and `zh_TW` can therefore keep independent choices and an
  /// explicit automatic setting never inherits another locale's voice.
  Future<WebTtsVoice?> selectedFor(String contentLocaleTag) async {
    final selections = await loadAll();
    return selections[normalizeTtsLocale(contentLocaleTag)];
  }

  Future<void> saveFor(String contentLocaleTag, WebTtsVoice? voice) async {
    final key = normalizeTtsLocale(contentLocaleTag);
    final selections = Map<String, WebTtsVoice>.of(await loadAll());
    if (voice == null) {
      selections.remove(key);
    } else {
      selections[key] = voice;
    }

    // Update memory first so an active web playback can use the new voice on
    // its next sentence even if local storage is temporarily unavailable.
    _cache = selections;
    try {
      final preferences = await _getPreferences();
      await preferences.setString(
        storageKey,
        jsonEncode({
          for (final entry in selections.entries)
            entry.key: {
              'name': entry.value.name,
              'locale': entry.value.locale,
            },
        }),
      );
    } catch (_) {
      // Browser storage is best-effort. Keep the in-memory choice for this run.
    }
  }

  /// Test/support hook for clients that intentionally clear local app data.
  void clearMemoryCache() => _cache = null;
}
