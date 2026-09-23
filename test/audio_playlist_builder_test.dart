// test/audio_playlist_builder_test.dart
//
// PlaylistBuilder + LessonAudioRef (plan §4.3, §13): cue mapping để highlight,
// giọng Pāli trong cue từ khóa, ước tính thời lượng, audioRef passthrough.

import 'package:flutter_test/flutter_test.dart';
import 'package:vdp_app/data/models/lesson_content.dart';
import 'package:vdp_app/features/audio/data/playlist_builder.dart';
import 'package:vdp_app/features/audio/models/audio_track.dart';

LessonSection _section(String id, {int paragraphs = 2}) => LessonSection(
      id: id,
      title: 'Tiêu đề $id',
      summary: 'Tóm tắt $id',
      body: List.generate(paragraphs, (i) => 'Đoạn thứ $i của mục $id.'),
      keyTerms: [
        LessonKeyTerm(
          id: 'TERM_$id',
          term: 'Từ $id',
          pali: 'Pali$id',
          meaning: 'nghĩa của $id',
        ),
      ],
      sourceRefs: const [],
    );

void main() {
  group('PlaylistBuilder.build', () {
    test('1 track mỗi section, cue map đúng khối UI của tab Học', () {
      final tracks = PlaylistBuilder.build(
        moduleId: 'M1_BASICS',
        sections: [_section('M1_S01'), _section('M1_S02', paragraphs: 3)],
      );

      expect(tracks, hasLength(2));
      expect(tracks[0].id, 'M1_S01');
      expect(tracks[0].moduleId, 'M1_BASICS');
      // summary → body:0 → body:1 → terms
      expect(
        tracks[0].cues.map((c) => c.highlightRef),
        ['summary', 'body:0', 'body:1', 'terms'],
      );
      expect(
        tracks[1].cues.map((c) => c.highlightRef),
        ['summary', 'body:0', 'body:1', 'body:2', 'terms'],
      );
    });

    test('cue từ khóa phát Pāli bằng span riêng (giọng Pāli)', () {
      final tracks = PlaylistBuilder.build(
        moduleId: 'M1_BASICS',
        sections: [_section('M1_S01')],
      );
      final termsCue = tracks.single.cues.last;

      expect(termsCue.highlightRef, 'terms');
      expect(termsCue.spans.where((s) => s.isPali), hasLength(1));
      expect(termsCue.spans.firstWhere((s) => s.isPali).text, contains('PaliM1_S01'));
      // Phần giải nghĩa đọc bằng giọng nội dung.
      expect(termsCue.spans.where((s) => !s.isPali), isNotEmpty);
    });

    test('section không có nội dung bị bỏ qua (không track câm)', () {
      const empty = LessonSection(
        id: 'EMPTY',
        title: '',
        summary: '',
        body: [],
        keyTerms: [],
        sourceRefs: [],
      );
      final tracks = PlaylistBuilder.build(
        moduleId: 'M1_BASICS',
        sections: [_section('M1_S01'), empty],
      );
      expect(tracks, hasLength(1));
    });

    test('ước tính thời lượng tỉ lệ nghịch với tốc độ (≈ hiển thị)', () {
      final tracks = PlaylistBuilder.build(
        moduleId: 'M1_BASICS',
        sections: [_section('M1_S01', paragraphs: 4)],
      );
      final cue = tracks.single.cues[1];
      final slow = cue.estimateAt(0.5).inSeconds;
      final normal = cue.estimateAt(1.0).inSeconds;
      final fast = cue.estimateAt(2.0).inSeconds;
      // Công thức: words * 60 / (150 * speed) — cho sai số làm tròn ±2s.
      expect(normal * 2, closeTo(slow, 3));
      expect(fast * 2, closeTo(normal, 3));
    });

    test('audioRef → durationHint thật (hiển thị chính xác thay vì ≈)', () {
      final withAudio = LessonSection(
        id: 'M1_S01',
        title: 'Có file',
        summary: '',
        body: const ['Đoạn một.'],
        keyTerms: const [],
        sourceRefs: const [],
        audioRef: const LessonAudioRef(file: 'assets/audio/vi/M1_S01.mp3', durationSec: 245),
      );
      final tracks = PlaylistBuilder.build(
        moduleId: 'M1_BASICS',
        sections: [withAudio],
      );
      expect(tracks.single.audioAsset, 'assets/audio/vi/M1_S01.mp3');
      expect(tracks.single.durationHint, const Duration(seconds: 245));
      expect(
        tracks.single.estimatedDuration(1.0),
        const Duration(seconds: 245),
      );
    });
  });

  group('LessonSection.tryParse với audioRef (schema để ngỏ)', () {
    test('audioRef hợp lệ được parse', () {
      final section = LessonSection.tryParse({
        'id': 'M1_S01',
        'title': 'T',
        'summary': 'S',
        'body': ['B'],
        'audioRef': {'file': 'assets/audio/vi/M1_S01.mp3', 'durationSec': 60},
      });
      expect(section, isNotNull);
      expect(section!.audioRef, isNotNull);
      expect(section.audioRef!.file, 'assets/audio/vi/M1_S01.mp3');
      expect(section.audioRef!.durationSec, 60);
    });

    test('không có audioRef (dữ liệu cũ) → null, không crash', () {
      final section = LessonSection.tryParse({
        'id': 'M1_S01',
        'title': 'T',
        'body': ['B'],
      });
      expect(section, isNotNull);
      expect(section!.audioRef, isNull);
    });

    test('audioRef hỏng → bỏ qua field, section vẫn parse', () {
      final section = LessonSection.tryParse({
        'id': 'M1_S01',
        'title': 'T',
        'body': ['B'],
        'audioRef': {'file': ''},
      });
      expect(section, isNotNull);
      expect(section!.audioRef, isNull);
    });
  });

  group('AudioCue.wordCount', () {
    test('đếm từ qua các span', () {
      const cue = AudioCue(
        highlightRef: 'terms',
        spans: [
          CueSpan('Ba từ ở đây', isPali: true),
          CueSpan('Hai từ'),
        ],
      );
      expect(cue.wordCount, 5);
      expect(cue.plainText, 'Ba từ ở đây Hai từ');
    });
  });
}
