// lib/features/audio/data/tts_voice_chain.dart
//
// Ánh xạ locale nội dung → giọng TTS (plan §7).
//
// Nguyên tắc: CHUỖI GIỌNG ĐI THEO CHUỖI VĂN BẢN. Lesson content được resolve qua
// `resolveContentLocaleChain` (và loại trừ 'vi' khi người học không chọn tiếng Việt —
// xem ContentCatalog.moduleLesson), nên giọng đọc cũng dò đúng chuỗi đó: văn bản
// rơi xuống tiếng Anh thì giọng cũng là tiếng Anh — không bao giờ đọc tiếng Myanmar
// bằng giọng tiếng Anh hay ngược lại.

import '../../../core/localization/content_catalog.dart';

/// Tag nội dung dùng `_` (zh_TW, zh_Hant_TW) — TTS dùng BCP-47 (`-`).
String ttsTagForContentTag(String contentTag) => contentTag.replaceAll('_', '-');

/// Chuỗi giọng TTS để dò theo thứ tự ưu tiên cho [contentLocaleTag].
///
/// Luôn kết thúc bằng các biến thể tiếng Anh (fallback cuối, giống tinh thần
/// `PaliTtsHelper`). Trả về danh sách đã khử trùng lặp.
List<String> ttsVoiceChain(String contentLocaleTag) {
  final chain = resolveContentLocaleChain(contentLocaleTag);
  // Lesson content không pha trộn tiếng Việt khi người học chọn ngôn ngữ khác
  // (Accuracy-First) — giọng đọc tuân theo đúng quy tắc đó.
  final lessonChain = contentLocaleTag == 'vi'
      ? chain
      : chain.where((tag) => tag != 'vi');

  final result = <String>[];
  for (final tag in lessonChain) {
    final mapped = ttsTagForContentTag(tag);
    if (!result.contains(mapped)) result.add(mapped);
  }
  for (final fallback in const ['en-US', 'en-GB', 'en']) {
    if (!result.contains(fallback)) result.add(fallback);
  }
  return List.unmodifiable(result);
}

/// Thứ tự ưu tiên giọng để phát thuật ngữ Pāli — trùng `PaliTtsHelper`
/// (hi-IN → en-US → en-GB) để mọi nơi trong app phát âm Pāli như nhau.
const List<String> kPaliVoiceChain = ['hi-IN', 'en-US', 'en-GB'];

/// Giọng dự phòng khi chuỗi chính không có sẵn trên thiết bị.
const List<String> kUniversalVoiceFallbacks = ['en-US', 'en-GB', 'en'];

/// Dò ngôn ngữ [preferred] đầu tiên mà thiết bị hỗ trợ.
///
/// So sánh không phân biệt hoa thường, chấp nhận cả prefix (`en` khớp `en-US`)
/// — cùng logic với `PaliTtsHelper._isLanguageSupported`.
String? pickTtsLanguage({
  required List<String> preferred,
  required List<String> supported,
}) {
  for (final lang in preferred) {
    final langLower = lang.toLowerCase();
    final langPrefix = langLower.split('-').first;
    for (final s in supported) {
      final sLower = s.toLowerCase();
      if (sLower == langLower || sLower.startsWith(langPrefix)) return lang;
    }
  }
  return null;
}

/// Parse kết quả `getLanguages` của flutter_tts (List hoặc String tùy nền tảng).
List<String> parseTtsLanguageList(dynamic raw) {
  if (raw == null) return const [];
  if (raw is List) return raw.map((e) => e.toString()).toList();
  if (raw is String) {
    return raw.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
  }
  return const [];
}
