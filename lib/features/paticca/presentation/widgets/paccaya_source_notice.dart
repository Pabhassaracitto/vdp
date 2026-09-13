// lib/features/paticca/presentation/widgets/paccaya_source_notice.dart
import 'package:flutter/material.dart';

import '../../../../l10n/l10n.dart';

/// Ghi chú nguồn cho 24 Duyên Hệ.
///
/// Giữ nguyên một chỗ để người học luôn thấy dữ liệu này dựa trên Paṭṭhāna
/// và Thanh Tịnh Đạo — không phải tài liệu của hệ thống Pa-Auk (chưa tìm được
/// tài liệu Pa-Auk liệt kê 24 duyên). Xem docs/study-content-sources.md.
class PaccayaSourceNotice extends StatelessWidget {
  const PaccayaSourceNotice({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.menu_book,
              size: 18, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.paccayaTitle,
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: 2),
                Text(
                  context.l10n.paccayaIntro,
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 6),
                Text(
                  context.l10n.paccayaSourceNotice,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
