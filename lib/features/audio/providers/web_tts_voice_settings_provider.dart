import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/pali_tts_helper.dart';
import '../../../core/utils/shared_tts_engine.dart';
import '../data/web_tts_voice.dart';
import '../services/web_tts_voice_catalog.dart';
import '../services/web_tts_voice_preferences.dart';

/// Error codes surfaced by [WebTtsVoiceSettingsState.error].
abstract final class WebTtsVoiceErrors {
  static const listUnavailable = 'voice-list-unavailable';
  static const previewFailed = 'voice-preview-failed';
  static const noVoiceForLanguage = 'voice-missing-for-language';
}

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
    WebTtsVoiceCatalog? catalog,
  })  : _engine = engine ?? SharedTtsEngine.instance,
        _preferences = preferences ?? WebTtsVoicePreferences.instance,
        _catalog = catalog ?? WebTtsVoiceCatalog.instance,
        super(const WebTtsVoiceSettingsState()) {
    unawaited(refresh());
  }

  final SharedTtsEngine _engine;
  final WebTtsVoicePreferences _preferences;
  final WebTtsVoiceCatalog _catalog;
  bool _hasRefreshed = false;

  /// The first load reuses the shared catalog (possibly already stabilized by
  /// lesson playback); later calls come from "Refresh voices" and re-enumerate.
  Future<void> refresh() async {
    final force = _hasRefreshed;
    _hasRefreshed = true;
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final voices = await _catalog.load(force: force);
      final selections = await _preferences.loadAll();
      if (!mounted) return;
      state = state.copyWith(
        voices: voices,
        selectedByLocale: selections,
        isLoading: false,
        clearError: true,
      );
    } catch (_) {
      if (!mounted) return;
      state = state.copyWith(
        isLoading: false,
        error: WebTtsVoiceErrors.listUnavailable,
      );
    }
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

  /// Speaks a short sample with exactly the voice lesson playback would use
  /// (saved choice, else the automatic match from the same shared list).
  ///
  /// Returns `true` as soon as the browser reports that speech STARTED —
  /// some Web Speech implementations never fire `onend` for online voices,
  /// which previously made a preview the user could hear report a failure.
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
      if (voice == null && state.voices.isNotEmpty) {
        // The browser listed voices, but none for this language: speaking
        // would use another language's voice (or nothing). Say so clearly.
        state = state.copyWith(error: WebTtsVoiceErrors.noVoiceForLanguage);
        return false;
      }

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
        // Voice list unavailable: let the browser pick its locale default.
        await _engine.raw.setLanguage(contentLocaleTag.replaceAll('_', '-'));
      }
      await _engine.raw.setSpeechRate(0.5);

      final started = await _engine.speakAndConfirmStart(
        webTtsPreviewText(contentLocaleTag),
        completionTimeout: const Duration(seconds: 18),
      );
      if (!started && mounted) {
        state = state.copyWith(error: WebTtsVoiceErrors.previewFailed);
      }
      return started;
    } catch (_) {
      if (mounted) {
        state = state.copyWith(error: WebTtsVoiceErrors.previewFailed);
      }
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
