// lib/features/audio/data/entity_playlist_builder.dart
//
// V1.9.2 §3 (1c): "phần đọc ở tab Học chưa đầy đủ" — trước bản này, playlist
// của tab Học chỉ gồm các LessonSection (PlaylistBuilder), bỏ sót toàn bộ các
// thẻ Tâm/Tâm Sở/Nghiệp/Nhân duyên/Sắc pháp/Lộ trình tâm hiển thị bên dưới.
// Builder này sinh thêm 1 AudioTrack cho MỖI mục dữ liệu (entity) để chúng
// cũng nghe được, nối tiếp vào cùng playlist — và được tái dùng nguyên vẹn
// cho tab Nhân Duyên (Paticca/Paccaya), nên cùng một engine/queue/repeat áp
// dụng cho mọi nơi có "nghe" trong app, không chỉ tab Học.
//
// Thuần Dart (không BuildContext) — nơi gọi (có context để tra chuỗi đã dịch
// qua `localizedName`/`localizedDescription`) tự tạo [EntityAudioItem] rồi
// mới gọi builder này, giữ builder dễ test như `PlaylistBuilder`.

import '../models/audio_track.dart';

/// Một mục dữ liệu đã được "dịch sẵn" (tên, Pāli, mô tả) — đủ để sinh 1 track.
class EntityAudioItem {
  /// Khoá ổn định, duy nhất trong playlist (vd. `'citta:C01'`).
  final String id;
  final String title;
  final String? pali;
  final String description;

  const EntityAudioItem({
    required this.id,
    required this.title,
    this.pali,
    required this.description,
  });
}

class EntityPlaylistBuilder {
  const EntityPlaylistBuilder._();

  /// Mỗi [EntityAudioItem] → 1 AudioTrack riêng (đồng nhất với mỗi mục có
  /// thể bấm nghe/tua/đánh dấu-đã-nghe độc lập trong playlist sheet).
  static List<AudioTrack> build({
    required String moduleId,
    required List<EntityAudioItem> items,
  }) {
    final tracks = <AudioTrack>[];
    for (final item in items) {
      final title = item.title.trim();
      if (title.isEmpty) continue;
      final spans = <CueSpan>[CueSpan(_endSentence(title))];
      final pali = item.pali?.trim();
      if (pali != null && pali.isNotEmpty && pali != title) {
        spans.add(CueSpan(_endSentence(pali), isPali: true));
      }
      final description = item.description.trim();
      if (description.isNotEmpty) spans.add(CueSpan(description));
      tracks.add(AudioTrack(
        id: item.id,
        moduleId: moduleId,
        title: title,
        cues: [AudioCue(highlightRef: 'entity:${item.id}', spans: spans)],
      ));
    }
    return List.unmodifiable(tracks);
  }

  static String _endSentence(String text) {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return trimmed;
    const endings = '.!?…';
    return endings.contains(trimmed[trimmed.length - 1])
        ? trimmed
        : '$trimmed.';
  }
}
