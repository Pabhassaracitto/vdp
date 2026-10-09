import 'dart:async';

import '../../../core/utils/shared_tts_engine.dart';
import '../data/web_tts_voice.dart';

/// Reads one raw `getVoices()` snapshot (the shape returned by `flutter_tts`).
typedef WebTtsVoiceReader = Future<Object?> Function();

/// Shared, stabilized browser voice list for Settings and lesson playback.
///
/// `speechSynthesis.getVoices()` is populated asynchronously. Several browsers
/// return a *partial, non-empty* list first (for example Chrome publishes
/// local OS voices and adds its network voices after `voiceschanged`; Edge
/// adds the online "Natural" voices such as NamMinh/HoaiMy later). Returning
/// the first non-empty snapshot therefore hid voices — the picker showed only
/// one Vietnamese voice and the player could fall back to a different voice
/// than the one selected in Settings.
///
/// This catalog polls for at least [minimumWindow], merging every snapshot,
/// and stops once the list has not grown for [settleWindow] (never later than
/// [maximumWindow]). Concurrent callers share one in-flight load and the same
/// cached result, so Settings preview and lesson playback resolve voices from
/// an identical list.
class WebTtsVoiceCatalog {
  WebTtsVoiceCatalog({
    required WebTtsVoiceReader readVoices,
    Future<void> Function(Duration duration)? delay,
    DateTime Function()? now,
    this.minimumWindow = const Duration(milliseconds: 1400),
    this.maximumWindow = const Duration(milliseconds: 2200),
    this.settleWindow = const Duration(milliseconds: 400),
    this.pollInterval = const Duration(milliseconds: 200),
  })  : _readVoices = readVoices,
        _delay = delay ?? ((duration) => Future<void>.delayed(duration)),
        _now = now ?? DateTime.now;

  static final WebTtsVoiceCatalog instance = WebTtsVoiceCatalog(
    readVoices: () async => SharedTtsEngine.instance.raw.getVoices,
  );

  final WebTtsVoiceReader _readVoices;
  final Future<void> Function(Duration duration) _delay;
  final DateTime Function() _now;

  final Duration minimumWindow;
  final Duration maximumWindow;
  final Duration settleWindow;
  final Duration pollInterval;

  List<WebTtsVoice> _voices = const [];
  bool _hasLoaded = false;
  Future<List<WebTtsVoice>>? _inFlight;

  /// Last stabilized list (empty until the first load completes).
  List<WebTtsVoice> get voices => _voices;

  bool get hasLoaded => _hasLoaded;

  /// Returns the cached stabilized list, loading it first when needed.
  /// [force] re-enumerates (Settings "Refresh voices", or a saved voice that
  /// is missing from the cached list).
  Future<List<WebTtsVoice>> load({bool force = false}) {
    final inFlight = _inFlight;
    if (inFlight != null) return inFlight;
    if (_hasLoaded && _voices.isNotEmpty && !force) {
      return Future<List<WebTtsVoice>>.value(_voices);
    }
    final future = _collect();
    _inFlight = future;
    return future.whenComplete(() {
      if (identical(_inFlight, future)) _inFlight = null;
    });
  }

  Future<List<WebTtsVoice>> _collect() async {
    final startedAt = _now();
    var merged = const <WebTtsVoice>[];
    var lastGrowthAt = Duration.zero;

    while (true) {
      List<WebTtsVoice> snapshot;
      try {
        snapshot = parseWebTtsVoices(await _readVoices());
      } catch (_) {
        snapshot = const [];
      }
      final elapsed = _now().difference(startedAt);
      final before = merged.length;
      merged = mergeWebTtsVoices(merged, snapshot);
      if (merged.length != before) lastGrowthAt = elapsed;

      if (elapsed >= maximumWindow) break;
      if (merged.isNotEmpty &&
          elapsed >= minimumWindow &&
          elapsed - lastGrowthAt >= settleWindow) {
        break;
      }
      await _delay(pollInterval);
    }

    // A failed re-enumeration must not wipe a previously good list.
    if (merged.isNotEmpty || !_hasLoaded) _voices = merged;
    _hasLoaded = true;
    return _voices;
  }
}
