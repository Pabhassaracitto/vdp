// lib/features/audio/models/audio_track.dart
//
// Playlist model cho tính năng "Nghe bài học" (doc/audio_plan.md).
//
// DESIGN NOTES
// ------------
// * Thuần Dart, không freezed/json_serializable — đúng cam kết như
//   `lesson_content.dart`: file phải build được không cần build_runner.
// * 1 AudioTrack = 1 LessonSection (độ granular đã chốt trong plan §4.3):
//   đủ nhỏ để nghe một mục lẻ, đủ lớn để playlist không loằng ngoằng.
// * 1 AudioCue ≈ 1 đoạn (summary / body[i] / keyTerms) — cue là đơn vị
//   highlight mắt-nhìn-tai-nghe và là điểm resume khi pause.
// * CueSpan tách giọng: span thường đọc bằng giọng nội dung, span Pāli đọc
//   bằng giọng Pāli (hi-IN → en-US, cùng triết lý với PaliTtsHelper).

import 'dart:math' as math;

/// Từ mỗi phút đọc ở tốc độ 1.0× — dùng để ước tính thời lượng hiển thị "≈ n phút".
const int kWordsPerMinuteAtSpeedOne = 150;

/// Một lát văn bản trong cue, gắn cờ giọng Pāli.
class CueSpan {
  final String text;

  /// true → đọc bằng giọng Pāli (thuật ngữ), false → giọng nội dung.
  final bool isPali;

  const CueSpan(this.text, {this.isPali = false});

  int get wordCount => text.trim().isEmpty ? 0 : text.trim().split(RegExp(r'\s+')).length;
}

/// Một "đoạn" phát được — tương ứng 1 khối trong LessonSection.
class AudioCue {
  /// Trỏ về UI để highlight: `'summary'` | `'body:<i>'` | `'terms'` | null.
  final String? highlightRef;

  final List<CueSpan> spans;

  const AudioCue({this.highlightRef, required this.spans});

  /// Nguyên văn (bỏ cờ giọng) — dùng cho debug/đếm từ.
  String get plainText => spans.map((s) => s.text).join(' ');

  int get wordCount => spans.fold(0, (sum, s) => sum + s.wordCount);

  /// Ước tính thời lượng cue tại [speed] (1.0 = bình thường). TTS không có
  /// đồng hồ thật — luôn hiển thị dạng "≈".
  Duration estimateAt(double speed) {
    final effectiveSpeed = speed <= 0 ? 1.0 : speed;
    final seconds = wordCount * 60 / (kWordsPerMinuteAtSpeedOne * effectiveSpeed);
    return Duration(seconds: math.max(1, seconds.round()));
  }
}

/// Một mục phát được trong playlist — sinh từ một LessonSection.
class AudioTrack {
  /// = LessonSection.id (ví dụ `M1_S02`) — ổn định giữa các locale.
  final String id;
  final String moduleId;
  final String title;
  final List<AudioCue> cues;

  /// Asset file dựng sẵn nếu section có `audioRef`; null → đọc bằng TTS.
  final String? audioAsset;

  /// Thời lượng thật của file (nếu có) — hiển thị chính xác thay vì "≈".
  final Duration? durationHint;

  const AudioTrack({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.cues,
    this.audioAsset,
    this.durationHint,
  });

  bool get hasCues => cues.isNotEmpty;

  /// Thời lượng ước tính cả track tại [speed]; file có metadata thì trả số thật.
  Duration estimatedDuration(double speed) {
    if (durationHint != null) return durationHint!;
    var seconds = 0;
    for (final cue in cues) {
      seconds += cue.estimateAt(speed).inSeconds;
    }
    // Khoảng nghỉ giữa các cue (~350ms) cộng vào để ước tính trung thực hơn.
    seconds += math.max(0, cues.length - 1);
    return Duration(seconds: math.max(1, seconds));
  }
}
