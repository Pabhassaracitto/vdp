import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/pali_tts_helper.dart';
import '../../../core/utils/shared_tts_engine.dart';
import '../data/web_tts_voice.dart';
import '../services/web_tts_voice_preferences.dart';

@immutable
class WebTtsVoiceSettingsState {
  const WebTtsVoiceSettingsState({
    this.voices = const [],
    this.selectedByLocale = const {},
    this.isLoading = true,
    this.isSaving = false,
    this.isPreviewing = false,
    this.error,
  });

  final List<WebTtsVoice> voices;
  final Map<String, WebTtsVoice> selectedByLocale;
  final bool isLoading;
  final bool isSaving;
  final bool isPreviewing;
  final String? error;

  WebTtsVoice? selectionFor(String localeTag) =>
      selectedByLocale[normalizeTtsLocale(localeTag)];

  WebTtsVoiceSettingsState copyWith({
    List<WebTtsVoice>? voices,
    Map<String, WebTtsVoice>? selectedByLocale,
    bool? isLoading,
    bool? isSaving,
    bool? isPreviewing,
    String? error,
    bool clearError = false,
  }) {
    return WebTtsVoiceSettingsState(
      voices: voices ?? this.voices,
      selectedByLocale: selectedByLocale ?? this.selectedByLocale,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      isPreviewing: isPreviewing ?? this.isPreviewing,
      error: clearError ? null : error ?? this.error,
    );
  }
}

class WebTtsVoiceSettingsNotifier
    extends StateNotifier<WebTtsVoiceSettingsState> {
  WebTtsVoiceSettingsNotifier({
    SharedTtsEngine? engine,
    WebTtsVoicePreferences? preferences,
  })  : _engine = engine ?? SharedTtsEngine.instance,
        _preferences = preferences ?? WebTtsVoicePreferences.instance,
        super(const WebTtsVoiceSettingsState()) {
    unawaited(refresh());
  }

  final SharedTtsEngine _engine;
  final WebTtsVoicePreferences _preferences;

  Future<void> refresh() async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final voices = await _loadBrowserVoices();
      final selections = await _preferences.loadAll();
      state = state.copyWith(
        voices: voices,
        selectedByLocale: selections,
        isLoading: false,
        clearError: true,
      );
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        error: 'voice-list-unavailable',
      );
    }
  }

  /// `speechSynthesis.getVoices()` is asynchronous on some browsers. Poll a few
  /// times so the first visit to Settings does not incorrectly show an empty
  /// voice list while the browser fires its initial `voiceschanged` event.
  Future<List<WebTtsVoice>> _loadBrowserVoices() async {
    for (var attempt = 0; attempt < 4; attempt++) {
      final voices = parseWebTtsVoices(await _engine.raw.getVoices);
      if (voices.isNotEmpty) return voices;
      if (attempt < 3) {
        await Future<void>.delayed(
          Duration(milliseconds: 100 * (attempt + 1)),
        );
      }
    }
    return const [];
  }

  Future<void> selectVoice({
    required String contentLocaleTag,
    required WebTtsVoice? voice,
  }) async {
    if (voice != null && !voice.supportsLanguage(contentLocaleTag)) return;

    final key = normalizeTtsLocale(contentLocaleTag);
    final selections = Map<String, WebTtsVoice>.of(state.selectedByLocale);
    if (voice == null) {
      selections.remove(key);
    } else {
      selections[key] = voice;
    }
    state = state.copyWith(
      selectedByLocale: selections,
      isSaving: true,
      clearError: true,
    );
    await _preferences.saveFor(contentLocaleTag, voice);
    state = state.copyWith(isSaving: false);
  }

  Future<bool> preview(String contentLocaleTag) async {
    if (state.isPreviewing) return false;
    state = state.copyWith(isPreviewing: true, clearError: true);

    try {
      final preferred = state.selectionFor(contentLocaleTag);
      final voice = resolveWebTtsVoice(
        voices: state.voices,
        contentLocaleTag: contentLocaleTag,
        preferred: preferred,
      );

      // Use the app-wide coordinator so a settings preview never overlaps a
      // lesson or Pāli pronunciation already using the shared TTS engine.
      PaliTtsHelper.onBeforeSpeak?.call();
      await _engine.stop();
      if (voice != null) {
        // Web Speech's setVoice selects by name + locale. Set language first
        // because flutter_tts initializes the utterance language separately.
        await _engine.raw.setLanguage(voice.locale);
        await _engine.raw.setVoice(voice.toFlutterTtsVoice());
      } else {
        await _engine.raw.setLanguage(contentLocaleTag.replaceAll('_', '-'));
      }
      await _engine.raw.setSpeechRate(0.5);

      return await _engine.speakAndWait(
        webTtsPreviewText(contentLocaleTag),
        timeout: const Duration(seconds: 18),
      );
    } catch (_) {
      state = state.copyWith(error: 'voice-preview-failed');
      return false;
    } finally {
      if (mounted) state = state.copyWith(isPreviewing: false);
    }
  }
}

final webTtsVoiceSettingsProvider = StateNotifierProvider<
    WebTtsVoiceSettingsNotifier, WebTtsVoiceSettingsState>(
  (ref) => WebTtsVoiceSettingsNotifier(),
);
