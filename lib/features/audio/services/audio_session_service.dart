import 'dart:async';

import 'package:audio_session/audio_session.dart';

/// Configures the one speech session used by the audio provider.  Keeping this
/// outside widgets makes interruption/noisy behaviour testable and prevents a
/// second Pali player from stealing focus.
class VdpAudioSession {
  VdpAudioSession._();
  static final instance = VdpAudioSession._();

  AudioSession? _session;
  StreamSubscription<AudioInterruptionEvent>? _interruption;
  StreamSubscription<void>? _noisy;

  Future<void> configure({
    required Future<void> Function() pause,
    required bool Function() isPlaying,
  }) async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    await _interruption?.cancel();
    await _noisy?.cancel();
    _interruption = session.interruptionEventStream.listen((event) async {
      if (event.begin) {
        if (isPlaying()) await pause();
      }
    });
    _noisy = session.becomingNoisyEventStream.listen((_) async {
      if (isPlaying()) await pause();
    });
    _session = session;
  }

  Future<bool> activate() async => await _session?.setActive(true) ?? true;

  Future<void> deactivate() async {
    await _session?.setActive(false);
  }

  Future<void> dispose() async {
    await _interruption?.cancel();
    await _noisy?.cancel();
    _interruption = null;
    _noisy = null;
  }
}
