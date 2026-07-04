// lib/features/detail/widgets/pali_name_card.dart

import 'package:flutter/material.dart';

/// Card hiển thị tên Pāḷi + nút phát âm TTS.
/// Dùng chung cho cả Citta và Cetasika.
class PaliNameCard extends StatelessWidget {
  final String namePali;
  final String? ipaTranscription;
  final Color accentColor;
  final bool isSpeaking;
  final VoidCallback onSpeak;

  const PaliNameCard({
    super.key,
    required this.namePali,
    required this.accentColor,
    required this.isSpeaking,
    required this.onSpeak,
    this.ipaTranscription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 10, 8, 10),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: accentColor.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Text block ──────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label "Pāḷi:"
                Text(
                  'Pāḷi:',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade500,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                // Tên Pali
                Text(
                  namePali,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                    height: 1.3,
                  ),
                ),
                // IPA (nếu có)
                if (ipaTranscription != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    '/$ipaTranscription/',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // ── Divider dọc ─────────────────────────────────────────
          Container(
            width: 1,
            height: 36,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: accentColor.withOpacity(0.2),
          ),

          // ── Nút loa ─────────────────────────────────────────────
          Tooltip(
            message: isSpeaking ? 'Dừng phát âm' : 'Nghe phát âm Pāḷi',
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onSpeak,
                borderRadius: BorderRadius.circular(24),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: isSpeaking
                        ? Icon(
                            Icons.stop_circle_rounded,
                            key: const ValueKey('stop'),
                            color: accentColor,
                            size: 28,
                          )
                        : Icon(
                            Icons.volume_up_rounded,
                            key: const ValueKey('play'),
                            color: accentColor,
                            size: 28,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
