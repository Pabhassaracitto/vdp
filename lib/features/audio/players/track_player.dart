// lib/features/audio/players/track_player.dart
//
// Hợp đồng engine phát một AudioTrack (plan §4.2).
//
// P1 dùng TtsTrackPlayer (flutter_tts). P2 sẽ có SherpaTtsTrackPlayer
// (sherpa-onnx — giọng neural) implements đúng interface này: UI, provider
// và playlist không cần đổi (quyết định plan §13.1).

import '../models/audio_track.dart';

enum TrackPlayerEventType {
  /// Bắt đầu một cue — UI dùng để highlight paragraph tương ứng.
  cueStarted,

  /// Karaoke tô chữ (V1.9.2) — chỉ phát cho cue có đúng 1 span (đoạn body),
  /// `wordIndex` là vị trí từ (0-based) trong toàn bộ `cue.plainText`.
  /// Nguồn phụ thuộc thiết bị (flutter_tts `setProgressHandler`) — không phải
  /// mọi nền tảng bắn sự kiện này, UI phải coi đây là tăng cường tùy chọn.
  wordProgress,

  /// Phát hết track một cách tự nhiên (không tính pause/stop).
  completed,

  /// Không có engine TTS trên thiết bị.
  engineUnavailable,

  /// Không có giọng đọc nào trong chuỗi ngôn ngữ của bài.
  voiceUnavailable,
}

class TrackPlayerEvent {
  final TrackPlayerEventType type;
  final int cueIndex;

  /// Chỉ có ý nghĩa với [TrackPlayerEventType.wordProgress].
  final int wordIndex;

  const TrackPlayerEvent(this.type, {this.cueIndex = -1, this.wordIndex = -1});
}

abstract class VolumeControllable {
  Future<void> setVolume(double volume);
}

abstract class TrackPlayer {
  /// Sự kiện cue/hoàn tất/lỗi — broadcast.
  Stream<TrackPlayerEvent> get events;

  /// Nạp một track mới (dừng track cũ nếu có).
  Future<void> load({
    required List<AudioCue> cues,
    required String contentLocaleTag,
  });

  /// Phát từ con trỏ hiện tại (mặc định: đầu track).
  Future<void> play();

  /// Tạm dừng — giữ con trỏ tại câu đang đọc dở (phát lại câu đó khi resume).
  Future<void> pause();

  /// Dừng hẳn và đưa con trỏ về đầu track.
  Future<void> stop();

  /// Đổi tốc độ ngay khi đang phát (áp dụng từ câu kế tiếp).
  Future<void> setSpeed(double speed);

  /// Nhảy tới cue [cueIndex] (0-based).
  Future<void> seekCue(int cueIndex);

  Future<void> dispose();
}
