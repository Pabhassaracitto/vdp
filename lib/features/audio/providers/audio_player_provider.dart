// lib/features/audio/providers/audio_player_provider.dart
//
// State machine của phiên nghe (plan §5–§6 + V1.9.2): playlist, vị trí hiện
// tại, tốc độ, lặp, "nghe lại ×N", lưu/restore thói quen, karaoke tô chữ, và
// nguồn phiên (để thanh nghe nổi toàn app biết "đi tới đâu" — V1.9.2 §1).
//
// Thuần logic — test được với FakeTrackPlayer + InMemoryStore
// (test/audio_player_test.dart). UI không bao giờ chạm thẳng vào engine.
//
// V1.9.2: `prepareModule` giờ nhận thẳng `List<AudioTrack>` thay vì
// `List<LessonSection>` — để tab Học có thể ghép thêm các mục Tâm/Tâm Sở/
// Nghiệp/Nhân duyên/Sắc pháp/Lộ trình tâm vào CÙNG một playlist (yêu cầu
// "phần đọc ở tab Học chưa đầy đủ"), và để tab Nhân Duyên (Paticca) dùng
// chung engine/provider này cho danh sách 12 chi & 24 duyên hệ của nó.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audio_service/audio_service.dart';

import '../services/audio_handler.dart';

import '../../../core/utils/pali_tts_helper.dart';
import '../models/audio_track.dart';
import '../players/track_player.dart';
import '../players/sherpa_tts_track_player.dart';
import '../services/audio_session_service.dart';
import '../services/listening_position_store.dart';
import '../services/sleep_timer.dart';

enum RepeatMode { off, one, all }

enum PlayerStatus { idle, playing, paused }

enum AudioErrorKind { none, engineUnavailable, voiceUnavailable }

/// Phiên nghe đến từ đâu — dùng để thanh nghe nổi toàn app (V1.9.2 §1) biết
/// phải điều hướng người dùng về đúng màn hình khi bấm "đến nơi đang phát".
enum AudioSourceKind {
  /// Tab Học — `moduleId` = `StudyModule.id`.
  study,

  /// Tab Nhân Duyên — phần "Liên kết" (12 chi Paṭiccasamuppāda).
  paticcaList,

  /// Tab Nhân Duyên — phần "Duyên hệ" (24 Paccaya).
  paticcaPaccaya,

  /// Tab Bảng Tương Ưng — playlist 121 Tâm (VDP 0.10.2).
  matrixCitta,

  /// Tab Bảng Tương Ưng — playlist 52 Tâm Sở (VDP 0.10.2).
  matrixCetasika,
}

AudioHandler? _audioHandler;

@immutable
class AudioPlayerState {
  /// Module đang có phiên nghe (null = chưa chuẩn bị).
  final String? moduleId;
  final String moduleTitle;
  final String contentLocaleTag;
  final List<AudioTrack> playlist;
  final int currentIndex;
  final int currentCueIndex;
  final PlayerStatus status;
  final double speed;
  final RepeatMode repeatMode;
  final AudioSourceKind sourceKind;

  /// Số lần nghe lại còn lại của "Nghe lại ×N" (null = đang dùng repeatMode).
  final int? repeatTimesLeft;

  /// Các track đã nghe hết trong phiên (tick ✓ trong playlist).
  final Set<String> finishedTrackIds;

  /// Vị trí đã lưu của module (nút "Tiếp tục nghe").
  final ListeningPosition? savedPosition;

  final AudioErrorKind error;
  final DateTime? sleepTimerEndsAt;

  /// Karaoke tô chữ (V1.9.2 §2) — chỉ số từ (0-based) trong
  /// `currentTrack.cues[currentCueIndex].plainText`. null = không có dữ liệu
  /// (cue nhiều span, hoặc thiết bị không hỗ trợ sự kiện tiến độ của TTS).
  final int? currentWordIndex;

  /// Thanh nghe nổi toàn app (V1.9.2 §1) đang bị người dùng ẩn tạm thời —
  /// khác với đóng hẳn phiên ([closeSession]): phiên vẫn chạy, chỉ là không
  /// hiển thị UI. Tự hiện lại khi người dùng chủ động bấm phát một mục khác.
  final bool bubbleHidden;

  const AudioPlayerState({
    this.moduleId,
    this.moduleTitle = '',
    this.contentLocaleTag = 'vi',
    this.playlist = const [],
    this.currentIndex = -1,
    this.currentCueIndex = 0,
    this.status = PlayerStatus.idle,
    this.speed = 1.0,
    this.repeatMode = RepeatMode.off,
    this.sourceKind = AudioSourceKind.study,
    this.repeatTimesLeft,
    this.finishedTrackIds = const {},
    this.savedPosition,
    this.error = AudioErrorKind.none,
    this.sleepTimerEndsAt,
    this.currentWordIndex,
    this.bubbleHidden = false,
  });

  bool get hasSession => moduleId != null && playlist.isNotEmpty;
  AudioTrack? get currentTrack =>
      (currentIndex < 0 || currentIndex >= playlist.length)
          ? null
          : playlist[currentIndex];

  AudioCue? get currentCue {
    final track = currentTrack;
    if (track == null) return null;
    return (currentCueIndex < 0 || currentCueIndex >= track.cues.length)
        ? null
        : track.cues[currentCueIndex];
  }

  String? get currentSectionId => currentTrack?.id;

  /// Khóa highlight cho UI: `'sectionId|highlightRef'` (null nếu không highlight).
  String? get currentCueKey {
    final sectionId = currentSectionId;
    final ref = currentCue?.highlightRef;
    if (sectionId == null || ref == null) return null;
    return '$sectionId|$ref';
  }

  bool get isPlaying => status == PlayerStatus.playing;

  /// Có vị trí nghe dở khác đầu bài hay không.
  bool get canResume {
    final pos = savedPosition;
    if (pos == null || playlist.isEmpty) return false;
    if (pos.trackId == playlist.first.id && pos.cueIndex == 0) return false;
    return playlist.any((t) => t.id == pos.trackId);
  }

  int get currentTrackNumber =>
      currentIndex < 0 ? 0 : currentIndex + 1;

  /// Sentinel để phân biệt "không truyền" với "gán null có chủ đích".
  static const Object _unset = Object();

  AudioPlayerState copyWith({
    String? moduleId,
    String? moduleTitle,
    String? contentLocaleTag,
    List<AudioTrack>? playlist,
    int? currentIndex,
    int? currentCueIndex,
    PlayerStatus? status,
    double? speed,
    RepeatMode? repeatMode,
    AudioSourceKind? sourceKind,
    Object? repeatTimesLeft = _unset,
    Set<String>? finishedTrackIds,
    ListeningPosition? savedPosition,
    AudioErrorKind? error,
    Object? sleepTimerEndsAt = _unset,
    Object? currentWordIndex = _unset,
    bool? bubbleHidden,
  }) {
    return AudioPlayerState(
      moduleId: moduleId ?? this.moduleId,
      moduleTitle: moduleTitle ?? this.moduleTitle,
      contentLocaleTag: contentLocaleTag ?? this.contentLocaleTag,
      playlist: playlist ?? this.playlist,
      currentIndex: currentIndex ?? this.currentIndex,
      currentCueIndex: currentCueIndex ?? this.currentCueIndex,
      status: status ?? this.status,
      speed: speed ?? this.speed,
      repeatMode: repeatMode ?? this.repeatMode,
      sourceKind: sourceKind ?? this.sourceKind,
      repeatTimesLeft: identical(repeatTimesLeft, _unset)
          ? this.repeatTimesLeft
          : repeatTimesLeft as int?,
      finishedTrackIds: finishedTrackIds ?? this.finishedTrackIds,
      savedPosition: savedPosition ?? this.savedPosition,
      error: error ?? this.error,
      sleepTimerEndsAt: identical(sleepTimerEndsAt, _unset)
          ? this.sleepTimerEndsAt
          : sleepTimerEndsAt as DateTime?,
      currentWordIndex: identical(currentWordIndex, _unset)
          ? this.currentWordIndex
          : currentWordIndex as int?,
      bubbleHidden: bubbleHidden ?? this.bubbleHidden,
    );
  }
}

class AudioPlayerNotifier extends StateNotifier<AudioPlayerState> {
  AudioPlayerNotifier({
    TrackPlayer? player,
    ListeningPositionStore? store,
    Duration watchdogInterval = const Duration(seconds: 5),
    Duration stallThreshold = const Duration(seconds: 18),
  })  : _player = player ?? SherpaTtsTrackPlayer(),
        _store = store ?? const SharedPrefsListeningPositionStore(),
        _watchdogInterval = watchdogInterval,
        _stallThreshold = stallThreshold,
        super(const AudioPlayerState()) {
    _eventSub = _player.events.listen(_onPlayerEvent);
    _sleepTimer = SleepTimer(
      setVolume: (volume) async {
        final player = _player;
        if (player is VolumeControllable) {
          await (player as VolumeControllable).setVolume(volume);
        }
      },
      pause: pause,
      onFinished: () {
        if (mounted) state = state.copyWith(sleepTimerEndsAt: null);
      },
    );
    unawaited(_initializePlatformServices());
    // Audio Coordinator (plan §11): phát từ Pāli ở detail sheet → pause phiên nghe.
    PaliTtsHelper.onBeforeSpeak = _pauseForFocus;
  }

  final TrackPlayer _player;
  final ListeningPositionStore _store;
  StreamSubscription<TrackPlayerEvent>? _eventSub;
  late final SleepTimer _sleepTimer;

  // ─── Watchdog tự chữa (V1.9.2 §2) ───────────────────────────────────────
  //
  // "đọc đoạn đầu rồi im lặng luôn" từng có thể xảy ra nếu một sự kiện hoàn
  // tất bị lạc (race hiếm giữa pause/seek và engine thật). Lớp bảo vệ cuối
  // cùng này không thay thế việc đã sửa gốc (SharedTtsEngine +
  // SherpaTtsTrackPlayer nối sự kiện) — nó chỉ đảm bảo một phiên "playing"
  // không bao giờ treo im lặng quá [_stallThreshold] mà không tự phục hồi.
  final Duration _watchdogInterval;
  final Duration _stallThreshold;
  Timer? _watchdog;
  DateTime _lastProgressAt = DateTime.now();
  bool _healing = false;

  void _markProgress() {
    _lastProgressAt = DateTime.now();
  }

  void _startWatchdog() {
    _watchdog ??= Timer.periodic(_watchdogInterval, (_) => _checkStall());
  }

  void _stopWatchdog() {
    _watchdog?.cancel();
    _watchdog = null;
  }

  Future<void> _checkStall() async {
    if (_healing || !mounted) return;
    if (!state.isPlaying) return;
    if (DateTime.now().difference(_lastProgressAt) < _stallThreshold) return;
    _healing = true;
    try {
      final index = state.currentIndex;
      final cue = state.currentCueIndex;
      if (index < 0) return;
      _markProgress();
      await _player.stop();
      await _playAt(index, cueIndex: cue);
    } finally {
      _healing = false;
    }
  }

  SleepTimer get sleepTimer => _sleepTimer;

  Future<void> setSleepTimer(Duration? duration) async {
    if (duration == null) {
      _sleepTimer.cancel();
      state = state.copyWith(sleepTimerEndsAt: null);
    } else {
      _sleepTimer.start(duration);
      state = state.copyWith(sleepTimerEndsAt: DateTime.now().add(duration));
    }
  }

  Future<void> _initializePlatformServices() async {
    // Native plugins are unavailable in pure Dart tests. Treat that as a
    // platform capability, not a playback failure; the TrackPlayer remains
    // fully testable and the app initializes these services on a real device.
    try {
      await VdpAudioSession.instance.configure(
        pause: pause,
        isPlaying: () => state.isPlaying,
      );
      _audioHandler ??= await AudioService.init(
        builder: () => VdpAudioHandler(
          onPlay: togglePlayPause,
          onPause: pause,
          onNext: next,
          onPrevious: previous,
          onSeek: (_) async {},
        ),
        config: const AudioServiceConfig(
          androidNotificationChannelId: 'com.vdp.audio',
          androidNotificationChannelName: 'VDP listening',
          androidNotificationOngoing: true,
        ),
      );
    } catch (_) {
      // CI/unit tests and unsupported platforms have no native plugin.
    }
  }

  // Tham số prepare để các lệnh play tự đảm bảo playlist đã sẵn sàng.
  List<String> _lastTrackIds = const [];
  Future<void>? _prepareOp;

  void _pauseForFocus() {
    if (state.isPlaying) {
      unawaited(pause());
    }
  }

  // ─── Chuẩn bị (gọi 1 lần khi mở tab Học / tab Nhân Duyên) ────────────────

  /// Nạp playlist + thói quen đã lưu. Idempotent — rebuild UI gọi lại vô hại.
  ///
  /// [tracks] đã được build sẵn ở nơi gọi (vd. `PlaylistBuilder` cho tab Học,
  /// `EntityPlaylistBuilder` cho tab Nhân Duyên) — provider không còn biết gì
  /// về `LessonSection` (V1.9.2), để có thể ghép nhiều nguồn vào 1 playlist.
  Future<void> prepareModule({
    required String moduleId,
    required String moduleTitle,
    required String contentLocaleTag,
    required List<AudioTrack> tracks,
    AudioSourceKind sourceKind = AudioSourceKind.study,
  }) {
    final newIds = tracks.map((t) => t.id).toList();
    final sameModule = state.moduleId == moduleId &&
        state.contentLocaleTag == contentLocaleTag &&
        listEquals(_lastTrackIds, newIds);
    if (sameModule && _prepareOp != null) return _prepareOp!;

    _prepareOp = _doPrepare(
      moduleId: moduleId,
      moduleTitle: moduleTitle,
      contentLocaleTag: contentLocaleTag,
      tracks: tracks,
      sourceKind: sourceKind,
    );
    return _prepareOp!;
  }

  Future<void> _doPrepare({
    required String moduleId,
    required String moduleTitle,
    required String contentLocaleTag,
    required List<AudioTrack> tracks,
    required AudioSourceKind sourceKind,
  }) async {
    // Đổi module giữa chừng → đóng phiên cũ (không "player ma").
    if (state.hasSession &&
        (state.moduleId != moduleId ||
            state.contentLocaleTag != contentLocaleTag)) {
      await _player.stop();
    }
    _lastTrackIds = tracks.map((t) => t.id).toList();

    final speed = await _store.loadSpeed() ?? 1.0;
    final repeatName = await _store.loadRepeatMode();
    final repeatMode = switch (repeatName) {
      'one' => RepeatMode.one,
      'all' => RepeatMode.all,
      _ => RepeatMode.off,
    };
    final saved = await _store.loadPosition(moduleId);

    state = AudioPlayerState(
      moduleId: moduleId,
      moduleTitle: moduleTitle,
      contentLocaleTag: contentLocaleTag,
      playlist: tracks,
      status: PlayerStatus.idle,
      speed: speed,
      repeatMode: repeatMode,
      sourceKind: sourceKind,
      savedPosition: saved,
    );
    await _player.setSpeed(speed);
  }

  // ─── Điều khiển phát ─────────────────────────────────────────────────────

  /// Nút "Nghe toàn bộ" / "Tiếp tục nghe".
  Future<void> playAll({bool resume = true}) async {
    await _ensurePrepared();
    if (state.playlist.isEmpty) return;
    var trackIndex = 0;
    var cueIndex = 0;
    if (resume && state.savedPosition != null) {
      final pos = state.savedPosition!;
      final idx = state.playlist.indexWhere((t) => t.id == pos.trackId);
      if (idx >= 0) {
        trackIndex = idx;
        cueIndex = pos.cueIndex;
      }
    }
    state = state.copyWith(finishedTrackIds: <String>{});
    await _playAt(trackIndex, cueIndex: cueIndex);
  }

  /// Phát từ một mục cụ thể (hàng playlist / ▶ trên section card).
  Future<void> playFrom(String trackId, {int cueIndex = 0}) async {
    await _ensurePrepared();
    final idx = state.playlist.indexWhere((t) => t.id == trackId);
    if (idx < 0) return;
    // Cùng track đang có phiên → toggle play/pause (thói quen bấm nút card).
    if (idx == state.currentIndex && state.status != PlayerStatus.idle) {
      await togglePlayPause();
      return;
    }
    state = state.copyWith(finishedTrackIds: <String>{});
    await _playAt(idx, cueIndex: cueIndex);
  }

  Future<void> togglePlayPause() async {
    if (!state.hasSession) return;
    if (state.isPlaying) {
      await pause();
    } else if (state.currentIndex >= 0) {
      await _sleepTimer.restoreVolume();
      _markProgress();
      _startWatchdog();
      await _player.play();
      state = state.copyWith(
        status: PlayerStatus.playing,
        error: AudioErrorKind.none,
        bubbleHidden: false,
      );
    } else {
      await playAll();
    }
  }

  /// Ẩn thanh nghe nổi (V1.9.2 §1) — phiên vẫn chạy bình thường.
  void hideBubble() {
    if (!state.bubbleHidden) state = state.copyWith(bubbleHidden: true);
  }

  /// Hiện lại thanh nghe nổi đã ẩn.
  void showBubble() {
    if (state.bubbleHidden) state = state.copyWith(bubbleHidden: false);
  }

  Future<void> pause() async {
    if (!state.isPlaying) return;
    _stopWatchdog();
    await _player.pause();
    state = state.copyWith(status: PlayerStatus.paused, currentWordIndex: null);
    await _savePosition();
  }

  /// Dừng hẳn phiên nghe hiện tại (dùng bởi nút "Đóng" trên thanh nghe nổi —
  /// V1.9.2 §1). Khác [pause]: xoá luôn playlist/track hiện hành, thanh nghe
  /// biến mất hoàn toàn thay vì chỉ tạm ngưng.
  Future<void> closeSession() async {
    _stopWatchdog();
    await _savePosition();
    await _player.stop();
    state = const AudioPlayerState();
    _lastTrackIds = const [];
    _prepareOp = null;
  }

  /// Mục trước — hoặc tua lại đầu mục nếu đang ở giữa mục (quy ước media).
  Future<void> previous() async {
    if (!state.hasSession) return;
    if (state.currentCueIndex > 0) {
      await _playAt(state.currentIndex);
      return;
    }
    final prev = state.currentIndex - 1;
    await _playAt(prev < 0 ? 0 : prev);
  }

  Future<void> next() async {
    if (!state.hasSession) return;
    final wasFinished = state.finishedTrackIds;
    final updated = Set<String>.from(wasFinished);
    final currentId = state.currentSectionId;
    if (currentId != null) updated.add(currentId);
    state = state.copyWith(finishedTrackIds: updated);
    await _advance(wrap: state.repeatMode == RepeatMode.all);
  }

  // ─── Lặp & tốc độ (bắt buộc theo yêu cầu) ────────────────────────────────

  /// Xoay vòng Tắt → Mục này → Cả danh sách → Tắt (plan §6.2).
  Future<void> cycleRepeatMode() async {
    final nextMode = switch (state.repeatMode) {
      RepeatMode.off => RepeatMode.one,
      RepeatMode.one => RepeatMode.all,
      RepeatMode.all => RepeatMode.off,
    };
    await setRepeatMode(nextMode);
  }

  /// Chọn thẳng một chế độ lặp (từ hàng chip trong playlist sheet).
  Future<void> setRepeatMode(RepeatMode mode) async {
    state = state.copyWith(repeatMode: mode, repeatTimesLeft: null);
    await _store.saveRepeatMode(mode.name);
  }

  /// "Nghe lại ×N" (plan §6.3): phát lại track hiện tại đủ N lượt rồi đi tiếp.
  /// Xoay vòng: tắt → ×2 → ×3 → ×5 → tắt. Bấm là chạy ngay từ đầu mục.
  Future<void> cycleListenAgain() async {
    if (!state.hasSession || state.currentIndex < 0) return;
    // state.repeatTimesLeft = số lượt PHÁT LẠI còn lại sau lượt hiện tại
    // (1 → ×2, 2 → ×3, 4 → ×5 — khớp nhãn trên nút: left + 1).
    final nextTimes = switch (state.repeatTimesLeft) {
      null => 2,
      1 => 3,
      2 => 5,
      4 => null,
      _ => 2,
    };
    if (nextTimes == null) {
      state = state.copyWith(repeatTimesLeft: null);
      return;
    }
    // nextTimes = tổng số lượt nghe; lượt sắp phát là lượt 1 → còn (n-1) sau.
    state = state.copyWith(repeatTimesLeft: nextTimes - 1);
    await _playAt(state.currentIndex);
  }

  Future<void> setSpeed(double speed) async {
    state = state.copyWith(speed: speed);
    await _player.setSpeed(speed);
    await _store.saveSpeed(speed);
  }

  // ─── Vòng đời ─────────────────────────────────────────────────────────────

  /// Thoát module: pause + lưu vị trí (P1 — mini player sống trong module).
  Future<void> onModuleClosed() async {
    if (state.isPlaying) await pause();
    await _savePosition();
  }

  @override
  void dispose() {
    if (PaliTtsHelper.onBeforeSpeak == _pauseForFocus) {
      PaliTtsHelper.onBeforeSpeak = null;
    }
    _stopWatchdog();
    _eventSub?.cancel();
    _sleepTimer.dispose();
    unawaited(VdpAudioSession.instance.dispose());
    unawaited(_player.dispose());
    super.dispose();
  }

  // ─── Nội bộ ───────────────────────────────────────────────────────────────

  Future<void> _ensurePrepared() async {
    final op = _prepareOp;
    if (op != null) await op;
  }

  Future<void> _playAt(int trackIndex, {int cueIndex = 0}) async {
    if (trackIndex < 0 || trackIndex >= state.playlist.length) return;
    final track = state.playlist[trackIndex];
    final cueCount = track.cues.length;
    final maxCue = cueCount == 0 ? 0 : cueCount - 1;
    final startCue = cueIndex.clamp(0, maxCue).toInt();

    state = state.copyWith(
      currentIndex: trackIndex,
      currentCueIndex: startCue,
      status: PlayerStatus.playing,
      error: AudioErrorKind.none,
      currentWordIndex: null,
      bubbleHidden: false,
    );
    await _player.load(
      cues: track.cues,
      contentLocaleTag: state.contentLocaleTag,
    );
    await _player.setSpeed(state.speed);
    await _sleepTimer.restoreVolume();
    if (startCue > 0) await _player.seekCue(startCue);
    _markProgress();
    _startWatchdog();
    await _player.play();
  }

  Future<void> _advance({required bool wrap}) async {
    final nextIndex = state.currentIndex + 1;
    if (nextIndex < state.playlist.length) {
      await _playAt(nextIndex);
      return;
    }
    if (wrap) {
      await _playAt(0);
      return;
    }
    // Hết danh sách, không lặp → dừng ở cuối (giữ vị trí để nghe lại sau).
    _stopWatchdog();
    state = state.copyWith(status: PlayerStatus.paused);
    await _savePosition();
  }

  void _onPlayerEvent(TrackPlayerEvent event) {
    if (!mounted) return;
    switch (event.type) {
      case TrackPlayerEventType.cueStarted:
        _markProgress();
        if (event.cueIndex >= 0) {
          state = state.copyWith(
            currentCueIndex: event.cueIndex,
            currentWordIndex: null,
          );
          unawaited(_savePosition());
        }
      case TrackPlayerEventType.wordProgress:
        _markProgress();
        if (event.cueIndex == state.currentCueIndex) {
          state = state.copyWith(currentWordIndex: event.wordIndex);
        }
      case TrackPlayerEventType.completed:
        _markProgress();
        _onTrackCompleted();
      case TrackPlayerEventType.engineUnavailable:
        _stopWatchdog();
        state = state.copyWith(
          status: PlayerStatus.idle,
          error: AudioErrorKind.engineUnavailable,
        );
      case TrackPlayerEventType.voiceUnavailable:
        _stopWatchdog();
        state = state.copyWith(
          status: PlayerStatus.idle,
          error: AudioErrorKind.voiceUnavailable,
        );
    }
  }

  void _onTrackCompleted() {
    final trackId = state.currentSectionId;
    if (trackId != null) {
      final updated = Set<String>.from(state.finishedTrackIds)..add(trackId);
      state = state.copyWith(finishedTrackIds: updated);
    }

    // "Nghe lại ×N" ưu tiên repeatMode cho tới khi hết số lượt.
    final left = state.repeatTimesLeft;
    if (left != null && left > 0) {
      state = state.copyWith(repeatTimesLeft: left - 1);
      unawaited(_playAt(state.currentIndex));
      return;
    }
    if (left != null) state = state.copyWith(repeatTimesLeft: null);

    switch (state.repeatMode) {
      case RepeatMode.one:
        unawaited(_playAt(state.currentIndex));
      case RepeatMode.all:
        unawaited(_advance(wrap: true));
      case RepeatMode.off:
        final isLast = state.currentIndex >= state.playlist.length - 1;
        if (isLast) {
          _stopWatchdog();
          state = state.copyWith(status: PlayerStatus.paused);
          unawaited(_savePosition());
        } else {
          unawaited(_advance(wrap: false));
        }
    }
  }

  Future<void> _savePosition() async {
    final moduleId = state.moduleId;
    final trackId = state.currentSectionId;
    if (moduleId == null || trackId == null) return;
    final position = ListeningPosition(
      trackId: trackId,
      cueIndex: state.currentCueIndex,
      updatedAt: DateTime.now(),
    );
    state = state.copyWith(savedPosition: position);
    await _store.savePosition(moduleId, position);
  }
}

final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerNotifier, AudioPlayerState>((ref) {
  return AudioPlayerNotifier();
});
