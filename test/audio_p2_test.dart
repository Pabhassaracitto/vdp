import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:vdp_app/features/audio/models/audio_track.dart';
import 'package:vdp_app/features/audio/players/sherpa_tts_track_player.dart';
import 'package:vdp_app/features/audio/players/track_player.dart';
import 'package:vdp_app/features/audio/services/listening_position_store.dart';
import 'package:vdp_app/features/audio/services/sleep_timer.dart';

/// Bộ đệm sự kiện tối giản — chỉ đủ để kiểm tra việc nối sự kiện, không mô
/// phỏng phát thật (đã có FakeTrackPlayer đầy đủ hơn trong audio_player_test).
class _StubFallbackPlayer implements TrackPlayer {
  final StreamController<TrackPlayerEvent> _controller =
      StreamController<TrackPlayerEvent>.broadcast();

  @override
  Stream<TrackPlayerEvent> get events => _controller.stream;

  @override
  Future<void> load({
    required List<AudioCue> cues,
    required String contentLocaleTag,
  }) async {}

  @override
  Future<void> play() async {}

  @override
  Future<void> pause() async {}

  @override
  Future<void> stop() async {}

  @override
  Future<void> setSpeed(double speed) async {}

  @override
  Future<void> seekCue(int cueIndex) async {}

  @override
  Future<void> dispose() async {
    await _controller.close();
  }

  void emitCompleted() =>
      _controller.add(const TrackPlayerEvent(TrackPlayerEventType.completed));
}

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

  // Regression (V1.9.2 bug 1a — "đọc đoạn đầu rồi im lặng, không
  // lặp/chuyển mục"): SherpaTtsTrackPlayer phải nối sự kiện của player dự
  // phòng (TtsTrackPlayer khi không có model Sherpa) vào `events` của chính
  // nó — nếu không, AudioPlayerNotifier (lắng nghe `events` của
  // SherpaTtsTrackPlayer) sẽ không bao giờ nhận được completed/cueStarted từ
  // engine thật, nên không tự lặp/chuyển mục dù audio vẫn đang đọc.
  test('forwards fallback TrackPlayer events through its own stream', () async {
    final fallback = _StubFallbackPlayer();
    final player = SherpaTtsTrackPlayer(fallback: fallback);
    addTearDown(player.dispose);

    final received = <TrackPlayerEventType>[];
    final sub = player.events.listen((e) => received.add(e.type));
    addTearDown(sub.cancel);

    fallback.emitCompleted();
    // Sự kiện đi qua 2 chặng forward (fallback.events → _events → test
    // listener) — mỗi chặng là 1 microtask của broadcast StreamController.
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);

    expect(received, contains(TrackPlayerEventType.completed));
  });

  // Lưu ý: không test nhánh "fallback tạo lười qua load()" bằng
  // SherpaTtsTrackPlayer() mặc định ở đây — nhánh đó dựng TtsTrackPlayer thật
  // (chạm `SharedTtsEngine`/`flutter_tts`), vốn cần plugin native nên để
  // integration test trên thiết bị thật, không phải unit test thuần Dart.

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
