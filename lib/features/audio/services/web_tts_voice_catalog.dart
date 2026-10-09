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
///
/// Even after the first stabilized snapshot the catalog keeps polling in the
/// background for up to [tailWindow] ("tail" enumeration): Edge/Chrome may
/// publish online voices seconds after the first non-empty list. When the
/// merged list grows, listeners (the Settings picker) are notified so the new
/// voices appear without a manual refresh. Pass [tailWindow] as
/// [Duration.zero] to disable the tail (used by deterministic tests).
class WebTtsVoiceCatalog {
  WebTtsVoiceCatalog({
    required WebTtsVoiceReader readVoices,
    Future<void> Function(Duration duration)? delay,
    DateTime Function()? now,
    this.minimumWindow = const Duration(milliseconds: 1400),
    this.maximumWindow = const Duration(milliseconds: 2200),
    this.settleWindow = const Duration(milliseconds: 400),
    this.pollInterval = const Duration(milliseconds: 200),
    this.tailWindow = const Duration(milliseconds: 8000),
    this.tailPollInterval = const Duration(milliseconds: 400),
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
  final Duration tailWindow;
  final Duration tailPollInterval;

  List<WebTtsVoice> _voices = const [];
  bool _hasLoaded = false;
  Future<List<WebTtsVoice>>? _inFlight;
  Future<void>? _tailFuture;
  final List<void Function(List<WebTtsVoice> voices)> _listeners = [];

  /// Last stabilized list (empty until the first load completes).
  List<WebTtsVoice> get voices => _voices;

  bool get hasLoaded => _hasLoaded;

  /// Completes when the background tail enumeration stops, or `null` when no
  /// tail is running. Test/support hook; production code uses [addListener].
  Future<void>? get tailFuture => _tailFuture;

  /// Notified whenever the stabilized list grows (late `voiceschanged`
  /// network voices, or a successful forced refresh).
  void addListener(void Function(List<WebTtsVoice> voices) listener) {
    if (!_listeners.contains(listener)) _listeners.add(listener);
  }

  void removeListener(void Function(List<WebTtsVoice> voices) listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    final voices = _voices;
    for (final listener in List.of(_listeners)) {
      try {
        listener(voices);
      } catch (_) {
        // One broken listener must not stop the enumeration.
      }
    }
  }

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
    // Seed with what is already known so a refresh only ever adds voices; a
    // failed re-enumeration must not wipe a previously good list.
    var merged = _voices;
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

    if (merged.isNotEmpty || !_hasLoaded) _voices = merged;
    _hasLoaded = true;
    _scheduleTail();
    return _voices;
  }

  void _scheduleTail() {
    if (_tailFuture != null || tailWindow <= Duration.zero) return;
    final future = _runTail();
    _tailFuture = future;
    future.whenComplete(() {
      if (identical(_tailFuture, future)) _tailFuture = null;
    });
  }

  /// Keeps polling after the first stabilized snapshot and pushes late
  /// arrivals (online "Natural" voices, second `voiceschanged` waves) into the
  /// cached list so the picker never freezes at a partial list (IN4-74).
  Future<void> _runTail() async {
    final startedAt = _now();
    while (_now().difference(startedAt) < tailWindow) {
      await _delay(tailPollInterval);
      List<WebTtsVoice> snapshot;
      try {
        snapshot = parseWebTtsVoices(await _readVoices());
      } catch (_) {
        continue;
      }
      final merged = mergeWebTtsVoices(_voices, snapshot);
      if (merged.length != _voices.length) {
        _voices = merged;
        _hasLoaded = true;
        _notifyListeners();
      }
    }
  }
}
