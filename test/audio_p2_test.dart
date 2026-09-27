import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:vdp_app/features/audio/players/sherpa_tts_track_player.dart';
import 'package:vdp_app/features/audio/services/listening_position_store.dart';
import 'package:vdp_app/features/audio/services/sleep_timer.dart';

void main() {
  test('old listening position JSON migrates without metadata', () {
    final value = ListeningPosition.tryParse({'trackId': 'M1_S01', 'cueIndex': 2});
    expect(value?.trackId, 'M1_S01');
    expect(value?.cueIndex, 2);
    expect(value?.positionMs, isNull);
  });

  test('missing Sherpa backend reports safe fallback', () async {
    // Construction is lazy: no native TTS/just_audio plugin is touched in a
    // pure unit test. The real provider loads P1 fallback on a device.
    final player = SherpaTtsTrackPlayer();
    expect(player.usingSherpa, isFalse);
    await player.dispose();
  });

  test('sleep timer cancels and does not pause', () async {
    var paused = false;
    final timer = SleepTimer(
      setVolume: (_) async {},
      pause: () async => paused = true,
    );
    timer.start(const Duration(milliseconds: 20));
    timer.cancel();
    await Future<void>.delayed(const Duration(milliseconds: 40));
    expect(paused, isFalse);
    timer.dispose();
  });
}
