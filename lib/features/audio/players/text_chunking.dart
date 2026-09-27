// lib/features/audio/players/text_chunking.dart
//
// Tách văn bản thành câu — đơn vị nhỏ nhất mỗi lần gọi TTS (plan §11: tránh
// flutter_tts nuốt chữ / dừng sớm trên đoạn dài; pause/resume được ở mức câu).
// Hàm thuần — test được không cần thiết bị.

const String _sentenceEndings = '.!?…';

/// Ký tự đóng ngoặc/kép đi kèm dấu kết câu, nuốt vào câu hiện tại.
const String _trailingClosers = '”"»\')]’';

/// Tách [text] thành các câu. Luôn trả về ít nhất 1 phần tử.
List<String> splitSentences(String text) {
  final trimmed = text.trim();
  if (trimmed.isEmpty) return const [];

  final result = <String>[];
  final buffer = StringBuffer();
  for (var i = 0; i < trimmed.length; i++) {
    final ch = trimmed[i];
    buffer.write(ch);
    if (!_sentenceEndings.contains(ch)) continue;

    // Nuốt các ký tự đóng ngay sau dấu kết câu: `nói.)"` → một câu.
    while (i + 1 < trimmed.length && _trailingClosers.contains(trimmed[i + 1])) {
      buffer.write(trimmed[++i]);
    }
    // Chỉ tách ở ranh giới khoảng trắng (chống "vd.", "v.v.", số thập phân).
    final atEnd = i + 1 >= trimmed.length;
    final atSpace = !atEnd && trimmed[i + 1] == ' ';
    if (atEnd || atSpace) {
      final sentence = buffer.toString().trim();
      if (sentence.isNotEmpty) result.add(sentence);
      buffer.clear();
    }
  }

  final rest = buffer.toString().trim();
  if (rest.isNotEmpty) result.add(rest);
  return result.isEmpty ? [trimmed] : result;
}

/// Ước tính timeout hợp lý cho một câu khi chờ engine TTS trả lời xong.
/// Thoáng hơn thực tế nhiều lần — chỉ để tự chữa khi engine treo thật sự.
Duration speakTimeoutFor(String sentence, double speed) {
  final words = sentence.trim().isEmpty
      ? 1
      : sentence.trim().split(RegExp(r'\s+')).length;
  final effectiveSpeed = speed <= 0 ? 1.0 : speed;
  final seconds = (words * 0.6 / effectiveSpeed) + 10;
  return Duration(milliseconds: (seconds * 1000).round());
}
