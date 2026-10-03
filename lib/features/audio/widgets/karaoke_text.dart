// lib/features/audio/widgets/karaoke_text.dart
//
// VDP | Audio V1.9.2 §2 — tô sáng kiểu karaoke: tô NỀN cả dòng đang đọc, và
// (tuỳ chọn) tô đậm hơn đúng TỪ đang đọc bên trong dòng đó. Dùng lại ở bất kỳ
// nơi nào hiển thị văn bản đồng bộ với audio (bài giảng tab Học, thẻ Tâm/Tâm
// Sở, hàng trong tab Nhân Duyên…) — một chỗ duy nhất quyết định "tô thế nào
// cho dễ nhìn ở cả 2 theme", thay vì mỗi nơi tự chọn màu.
//
// QUAN TRỌNG: [activeWordIndex] phải được tính bằng CÙNG quy tắc tách từ với
// `TtsTrackPlayer` (`text.trim().split(RegExp(r'\s+'))`, xem
// `_wordIndexAtOffset`/`_wordCountBeforeSpan` trong tts_track_player.dart) —
// nếu không chỉ số sẽ lệch khỏi từ thật đang đọc.
import 'package:flutter/material.dart';

class KaraokeText extends StatelessWidget {
  const KaraokeText({
    super.key,
    required this.text,
    required this.style,
    required this.isActive,
    required this.highlightColor,
    this.activeWordIndex,
    this.lineHighlightEnabled = true,
    this.wordHighlightEnabled = false,
  });

  final String text;
  final TextStyle style;

  /// true nếu đây là dòng/đoạn đang được đọc (so khớp `highlightRef`).
  final bool isActive;

  /// Màu nền tô sáng — nơi gọi tự chọn theo theme sáng/tối (vd. màu module ở
  /// theme sáng, `HCColors.primary` vàng ở chế độ tương phản cao).
  final Color highlightColor;

  /// Chỉ số từ (0-based, theo `text.trim().split(RegExp(r'\s+'))`) đang được
  /// đọc — null nếu không có dữ liệu karaoke theo từ cho đoạn này.
  final int? activeWordIndex;

  /// Cài đặt người dùng (Settings → Nghe & Karaoke) — tắt thì không tô gì cả
  /// dù [isActive] true, giữ hành vi cũ (chỉ đậm chữ do widget cha tự set).
  final bool lineHighlightEnabled;
  final bool wordHighlightEnabled;

  @override
  Widget build(BuildContext context) {
    final showLine = isActive && lineHighlightEnabled;
    final lineStyle = style.copyWith(
      backgroundColor: showLine ? highlightColor.withOpacity(0.18) : null,
      fontWeight: isActive ? FontWeight.w700 : style.fontWeight,
    );

    final wordIndex = activeWordIndex;
    if (!isActive || !wordHighlightEnabled || wordIndex == null || wordIndex < 0) {
      return Text(text, style: lineStyle);
    }

    final words = text.trim().split(RegExp(r'\s+'));
    if (wordIndex >= words.length) return Text(text, style: lineStyle);

    return Text.rich(
      TextSpan(
        style: lineStyle,
        children: [
          for (var i = 0; i < words.length; i++) ...[
            if (i > 0) const TextSpan(text: ' '),
            TextSpan(
              text: words[i],
              style: i == wordIndex
                  ? TextStyle(
                      backgroundColor: highlightColor.withOpacity(0.55),
                      fontWeight: FontWeight.w900,
                    )
                  : null,
            ),
          ],
        ],
      ),
    );
  }
}
