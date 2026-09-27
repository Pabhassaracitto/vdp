// test/audio_player_test.dart
//
// State machine của AudioPlayerNotifier với FakeTrackPlayer + InMemoryStore
// (plan §6, §10 A1-2): lặp 3 chế độ, nghe lại ×N, resume, lưu thói quen.

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:vdp_app/data/models/lesson_content.dart';
import 'package:vdp_app/features/audio/models/audio_track.dart';
import 'package:vdp_app/features/audio/players/track_player.dart';
import 'package:vdp_app/features/audio/providers/audio_player_provider.dart';
import 'package:vdp_app/features/audio/services/listening_position_store.dart';

// ─── Fakes ───────────────────────────────────────────────────────────────────

class FakeTrackPlayer implements TrackPlayer {
  final List<String> log = [];
  final StreamController<TrackPlayerEvent> _controller =
      StreamController<TrackPlayerEvent>.broadcast();
  int loadCount = 0;
  int playCount = 0;
  String? loadedLocale;
  double speed = 1.0;

  @override
  Stream<TrackPlayerEvent> get events => _controller.stream;

  @override
  Future<void> load({
    required List<AudioCue> cues,
    required String contentLocaleTag,
  }) async {
    loadCount++;
    loadedLocale = contentLocaleTag;
    log.add('load:${cues.length}:$contentLocaleTag');
  }

  @override
  Future<void> play() async {
    playCount++;
    log.add('play');
  }

  @override
  Future<void> pause() async {
    log.add('pause');
  }

  @override
  Future<void> stop() async {
    log.add('stop');
  }

  @override
  Future<void> setSpeed(double speed) async {
    this.speed = speed;
    log.add('setSpeed:$speed');
  }

  @override
  Future<void> seekCue(int cueIndex) async {
    log.add('seekCue:$cueIndex');
  }

  @override
  Future<void> dispose() async {
    log.add('dispose');
  }

  void emitCue(int cueIndex) => _controller.add(
        TrackPlayerEvent(TrackPlayerEventType.cueStarted, cueIndex: cueIndex),
      );

  void emitCompleted() =>
      _controller.add(const TrackPlayerEvent(TrackPlayerEventType.completed));

  void emitVoiceUnavailable() => _controller.add(
        const TrackPlayerEvent(TrackPlayerEventType.voiceUnavailable),
      );
}

class InMemoryStore implements ListeningPositionStore {
  double? speed;
  String? repeatMode;
  final Map<String, ListeningPosition> positions = {};

  @override
  Future<double?> loadSpeed() async => speed;

  @override
  Future<void> saveSpeed(double speed) async => this.speed = speed;

  @override
  Future<String?> loadRepeatMode() async => repeatMode;

  @override
  Future<void> saveRepeatMode(String mode) async => repeatMode = mode;

  @override
  Future<ListeningPosition?> loadPosition(String moduleId) async =>
      positions[moduleId];

  @override
  Future<void> savePosition(String moduleId, ListeningPosition position) async =>
      positions[moduleId] = position;
}

// ─── Fixtures ────────────────────────────────────────────────────────────────

LessonSection _section(String id) => LessonSection(
      id: id,
      title: 'Tiêu đề $id',
      summary: 'Tóm tắt $id',
      body: const ['Đoạn một.', 'Đoạn hai.'],
      keyTerms: const [],
      sourceRefs: const [],
    );

List<LessonSection> _sections(int count) =>
    List.generate(count, (i) => _section('M1_S0${i + 1}'));

/// Cho các microtask/event kịp chạy (notifier xử lý event bất đồng bộ).
Future<void> _flush() async {
  for (var i = 0; i < 8; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  late FakeTrackPlayer player;
  late InMemoryStore store;
  late AudioPlayerNotifier notifier;

  setUp(() {
    player = FakeTrackPlayer();
    store = InMemoryStore();
    notifier = AudioPlayerNotifier(player: player, store: store);
  });

  tearDown(() {
    notifier.dispose();
  });

  Future<void> prepare({int sections = 3}) {
    return notifier.prepareModule(
      moduleId: 'M1_BASICS',
      moduleTitle: 'Biến hành',
      contentLocaleTag: 'vi',
      sections: _sections(sections),
    );
  }

  group('prepareModule', () {
    test('build playlist từ sections + khôi phục thói quen đã lưu', () async {
      store.speed = 1.25;
      store.repeatMode = 'one';
      store.positions['M1_BASICS'] =
          const ListeningPosition(trackId: 'M1_S02', cueIndex: 1);

      await prepare();

      expect(notifier.state.playlist, hasLength(3));
      expect(notifier.state.moduleId, 'M1_BASICS');
      expect(notifier.state.speed, 1.25);
      expect(notifier.state.repeatMode, RepeatMode.one);
      expect(notifier.state.canResume, isTrue);
      expect(player.speed, 1.25); // đã ép engine theo thói quen
    });

    test('đổi ngôn ngữ dừng giọng cũ và load locale mới', () async {
      await prepare();
      await notifier.playAll(resume: false);
      expect(player.loadedLocale, 'vi');

      await notifier.prepareModule(
        moduleId: 'M1_BASICS',
        moduleTitle: 'Basics',
        contentLocaleTag: 'si',
        sections: _sections(2),
      );
      expect(player.log, contains('stop'));

      await notifier.playAll(resume: false);
      expect(player.loadedLocale, 'si');
    });

    test('idempotent — gọi lại không reset phiên đang nghe', () async {
      await prepare();
      await notifier.playAll(resume: false);
      final cueIndexBefore = notifier.state.currentCueIndex;
      player.emitCue(2);
      await _flush();

      await prepare(); // rebuild UI gọi lại

      expect(notifier.state.isPlaying, isTrue);
      expect(notifier.state.currentCueIndex, 2);
      expect(notifier.state.currentCueIndex, cueIndexBefore + 2);
      expect(player.loadCount, 1); // không load lại
    });
  });

  group('phát / resume', () {
    test('playAll bắt đầu từ đầu khi không có vị trí lưu', () async {
      await prepare();
      await notifier.playAll();

      expect(notifier.state.status, PlayerStatus.playing);
      expect(notifier.state.currentIndex, 0);
      expect(player.log, contains('play'));
    });

    test('playAll resume → đúng track + cue đã lưu (H4)', () async {
      store.positions['M1_BASICS'] =
          const ListeningPosition(trackId: 'M1_S03', cueIndex: 1);
      await prepare();
      await notifier.playAll(resume: true);

      expect(notifier.state.currentIndex, 2);
      expect(notifier.state.currentCueIndex, 1);
      expect(player.log, contains('seekCue:1'));
    });

    test('tự chuyển mục khi phát hết — không lặp (repeat off)', () async {
      await prepare();
      await notifier.playAll(resume: false);

      player.emitCompleted();
      await _flush();
      expect(notifier.state.currentIndex, 1);

      player.emitCompleted();
      await _flush();
      expect(notifier.state.currentIndex, 2);

      // Hết danh sách → dừng ở cuối, đánh dấu xong.
      player.emitCompleted();
      await _flush();
      expect(notifier.state.status, PlayerStatus.paused);
      expect(notifier.state.finishedTrackIds, containsAll(['M1_S01', 'M1_S02', 'M1_S03']));
    });

    test('playFrom cùng mục đang phát → toggle pause', () async {
      await prepare();
      await notifier.playFrom('M1_S01');
      expect(notifier.state.isPlaying, isTrue);

      await notifier.playFrom('M1_S01');
      expect(notifier.state.status, PlayerStatus.paused);

      await notifier.playFrom('M1_S01');
      expect(notifier.state.isPlaying, isTrue); // resume, không load lại
      expect(player.loadCount, 1);
    });
  });

  group('lặp (bắt buộc)', () {
    test('RepeatMode.one → phát lại đúng mục vô hạn', () async {
      await prepare();
      await notifier.setRepeatMode(RepeatMode.one);
      await notifier.playFrom('M1_S02');

      player.emitCompleted();
      await _flush();
      expect(notifier.state.currentIndex, 1); // vẫn M1_S02
      player.emitCompleted();
      await _flush();
      expect(notifier.state.currentIndex, 1);
      expect(player.loadCount, 3); // 1 lần đầu + 2 lần lặp
    });

    test('RepeatMode.all → hết danh sách quay về mục 1', () async {
      await prepare();
      await notifier.setRepeatMode(RepeatMode.all);
      await notifier.playFrom('M1_S03');

      player.emitCompleted();
      await _flush();
      expect(notifier.state.currentIndex, 0); // wrap
    });

    test('cycleRepeatMode xoay Tắt → Mục này → Cả danh sách → Tắt', () async {
      await prepare();
      expect(notifier.state.repeatMode, RepeatMode.off);
      await notifier.cycleRepeatMode();
      expect(notifier.state.repeatMode, RepeatMode.one);
      await notifier.cycleRepeatMode();
      expect(notifier.state.repeatMode, RepeatMode.all);
      await notifier.cycleRepeatMode();
      expect(notifier.state.repeatMode, RepeatMode.off);
      expect(store.repeatMode, 'off'); // thói quen được ghi nhớ (H2)
    });
  });

  group('Nghe lại ×N (học thuộc — plan §6.3)', () {
    test('×2: phát lại đúng 1 lần nữa rồi đi tiếp', () async {
      await prepare();
      await notifier.playFrom('M1_S01');

      await notifier.cycleListenAgain(); // ×2 — chạy ngay từ đầu mục
      expect(notifier.state.repeatTimesLeft, 1);

      player.emitCompleted();
      await _flush();
      expect(notifier.state.currentIndex, 0); // phát lại
      expect(notifier.state.repeatTimesLeft, 0);

      player.emitCompleted();
      await _flush();
      expect(notifier.state.currentIndex, 1); // đủ 2 lượt → đi tiếp
      expect(notifier.state.repeatTimesLeft, isNull);
    });

    test('xoay vòng ×2 → ×3 → ×5 → tắt', () async {
      await prepare();
      await notifier.playFrom('M1_S01');

      await notifier.cycleListenAgain();
      expect(notifier.state.repeatTimesLeft, 1); // ×2 → còn 1 lượt sau
      await notifier.cycleListenAgain();
      expect(notifier.state.repeatTimesLeft, 2); // ×3
      await notifier.cycleListenAgain();
      expect(notifier.state.repeatTimesLeft, 4); // ×5
      await notifier.cycleListenAgain();
      expect(notifier.state.repeatTimesLeft, isNull); // tắt
    });
  });

  group('tốc độ (bắt buộc)', () {
    test('setSpeed áp dụng tức thì + ghi nhớ (H3)', () async {
      await prepare();
      await notifier.setSpeed(1.5);

      expect(notifier.state.speed, 1.5);
      expect(player.speed, 1.5);
      expect(store.speed, 1.5);
    });
  });

  group('điều hướng & vòng đời', () {
    test('previous: giữa mục → về đầu mục; đầu mục → mục trước', () async {
      await prepare();
      await notifier.playFrom('M1_S02');
      player.emitCue(2);
      await _flush();
      final loadsBefore = player.loadCount;

      await notifier.previous(); // đang giữa M1_S02 → về đầu M1_S02
      expect(notifier.state.currentIndex, 1);
      expect(player.loadCount, loadsBefore + 1);

      await notifier.previous(); // đang đầu M1_S02 → M1_S01
      expect(notifier.state.currentIndex, 0);
    });

    test('onModuleClosed: pause + lưu vị trí (H4)', () async {
      await prepare();
      await notifier.playFrom('M1_S02');
      player.emitCue(1);
      await _flush();

      await notifier.onModuleClosed();

      expect(notifier.state.status, PlayerStatus.paused);
      expect(player.log, contains('pause'));
      final saved = store.positions['M1_BASICS'];
      expect(saved, isNotNull);
      expect(saved!.trackId, 'M1_S02');
      expect(saved.cueIndex, 1);
    });

    test('lỗi giọng đọc → state.error để UI báo, không crash (plan §11)', () async {
      await prepare();
      player.emitVoiceUnavailable();
      await _flush();

      expect(notifier.state.error, AudioErrorKind.voiceUnavailable);
      expect(notifier.state.status, PlayerStatus.idle);
    });
  });
}
