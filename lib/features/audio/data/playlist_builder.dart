// lib/features/audio/data/playlist_builder.dart
//
// ModuleLessonContent → List<AudioTrack> (plan §4.3).
//
// Mapping cue ↔ khối UI (để highlight mắt-nhìn-tai-nghe):
//   'summary'  → tiêu đề + tóm tắt của section (khối đầu ExpansionTile)
//   'body:<i>' → paragraph body[i]
//   'terms'    → khối keyTerms (Pāli đọc bằng giọng riêng)
// Không sinh track cho section rỗng (hasContent == false) — không có gì để nghe.

import '../../../data/models/lesson_content.dart';
import '../models/audio_track.dart';

class PlaylistBuilder {
  const PlaylistBuilder._();

  /// Thứ tự section trong playlist = thứ tự authored trong content JSON
  /// (chính là thứ tự người học đọc trên tab Học).
  static List<AudioTrack> build({
    required String moduleId,
    required List<LessonSection> sections,
  }) {
    final tracks = <AudioTrack>[];
    for (final section in sections) {
      if (!section.hasContent) continue;
      tracks.add(_buildTrack(moduleId, section));
    }
    return List.unmodifiable(tracks);
  }

  static AudioTrack _buildTrack(String moduleId, LessonSection section) {
    final cues = <AudioCue>[];

    // ── Cue 'summary': tiêu đề + tóm tắt ─────────────────────────────────
    final introSpans = <CueSpan>[
      CueSpan(_endSentence(section.title)),
      if (section.summary.trim().isNotEmpty) CueSpan(section.summary.trim()),
    ];
    cues.add(AudioCue(highlightRef: 'summary', spans: introSpans));

    // ── Cue 'body:<i>': từng đoạn nội dung ───────────────────────────────
    for (var i = 0; i < section.body.length; i++) {
      final paragraph = section.body[i].trim();
      if (paragraph.isEmpty) continue;
      cues.add(AudioCue(highlightRef: 'body:$i', spans: [CueSpan(paragraph)]));
    }

    // ── Cue 'terms': từ khóa — Pāli bằng giọng Pāli ──────────────────────
    final termSpans = <CueSpan>[];
    for (final term in section.keyTerms) {
      final pali = term.pali.trim();
      final name = term.term.trim();
      final meaning = term.meaning.trim();
      if (pali.isNotEmpty) {
        termSpans.add(CueSpan(_endSentence(pali), isPali: true));
      }
      final gloss = StringBuffer();
      if (name.isNotEmpty && name != pali) gloss.write(_endSentence(name));
      if (meaning.isNotEmpty) gloss.write(_endSentence(meaning));
      if (gloss.isNotEmpty) termSpans.add(CueSpan(gloss.toString().trim()));
    }
    if (termSpans.isNotEmpty) {
      cues.add(AudioCue(highlightRef: 'terms', spans: termSpans));
    }

    return AudioTrack(
      id: section.id,
      moduleId: moduleId,
      title: section.title,
      cues: List.unmodifiable(cues),
      audioAsset: section.audioRef?.file,
      durationHint: section.audioRef?.durationSec == null
          ? null
          : Duration(seconds: section.audioRef!.durationSec!),
    );
  }

  /// Thêm dấu câu kết thúc để engine TTS ngắt nghỉ tự nhiên giữa các span.
  static String _endSentence(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return trimmed;
    const endings = '.!?…';
    return endings.contains(trimmed[trimmed.length - 1])
        ? trimmed
        : '$trimmed.';
  }
}
