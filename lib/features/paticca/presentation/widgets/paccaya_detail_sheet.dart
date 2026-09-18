// lib/features/paticca/presentation/widgets/paccaya_detail_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vdp_app/core/localization/content_catalog.dart';

import '../../../../core/localization/localized_content.dart';
import '../../../../data/models/paccaya_model.dart';
import '../../../../l10n/l10n.dart';
import '../providers/paticca_providers.dart';

/// Chi tiết một duyên hệ trong 24 duyên.
class PaccayaDetailSheet extends ConsumerWidget {
  final PaccayaModel item;

  const PaccayaDetailSheet({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final paticcas = ref.watch(paticcaListProvider).valueOrNull ?? const [];
    final linkedPaticcas = paticcas
        .where((p) => item.operatesInPaticca.contains(p.id))
        .toList();
    final localizedExamples = item.localizedExamples(context) ?? const [];
    final doctrinalNote = item.localizedDoctrinalNote(context);

    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        decoration: BoxDecoration(
          color: theme.bottomSheetTheme.backgroundColor ??
              theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    child: Text('${item.order}'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.localizedName(context),
                          style: theme.textTheme.titleLarge,
                        ),
                        Text(item.namePali, style: theme.textTheme.bodyMedium),
                        // Tên tiếng Anh chỉ còn là thông tin bổ sung cho người
                        // đọc tiếng Việt; với ngôn ngữ nội dung khác nó trùng
                        // với tiêu đề đã bản địa hoá.
                        if (context.showsVietnameseSourceText &&
                            item.nameEnglish.isNotEmpty)
                          Text(
                            item.nameEnglish,
                            style: theme.textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Chip(
                label: Text(item.group.localizedName(context.l10n)),
                visualDensity: VisualDensity.compact,
              ),
              const Divider(height: 24),
              _section(
                context,
                context.l10n.paccayaDefinition,
               item.localizedDefinition(context),
              ),
              _section(
                context,
                context.l10n.paccayaConditioningStates,
                item.localizedPaccayaDhamma(context),
              ),
              _section(
                context,
                context.l10n.paccayaConditionedStates,
                item.localizedPaccayuppanna(context),
              ),
              if (item.paliFormula != null && item.paliFormula!.isNotEmpty)
                _section(
                  context,
                  'Paccayaniddesa (Pāḷi)',
                  item.paliFormula!,
                  italic: true,
                ),
              if (item.subdivisions.isNotEmpty) ...[
                _heading(context, context.l10n.paccayaSubdivisions),
                for (final sub in item.subdivisions)
                  _subdivisionBlock(context, sub),
              ],
              if (localizedExamples.isNotEmpty) ...[
                _heading(context, context.l10n.examples),
                for (final example in localizedExamples)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text('• $example',
                        style: theme.textTheme.bodySmall),
                  ),
              ],
              if (linkedPaticcas.isNotEmpty) ...[
                _heading(context, context.l10n.paccayaInPaticca),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final paticca in linkedPaticcas)
                      Chip(
                        label: Text(
                          '${paticca.order}. ${paticca.localizedName(context)}',
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                  ],
                ),
              ],
              if (doctrinalNote != null && doctrinalNote.isNotEmpty)
                _section(context, context.l10n.doctrine, doctrinalNote),
              if (item.sourceRefs.isNotEmpty) ...[
                _heading(context, context.l10n.paccayaSources),
                for (final source in item.sourceRefs)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '• ${source.describe()}  [${source.confidence}]',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Một chi phần nhỏ của duyên — tiêu đề bản địa hoá + tên Pāḷi, kèm ghi chú
  /// nếu có (đọc qua catalog, không lộ tiếng Việt cho ngôn ngữ khác).
  Widget _subdivisionBlock(BuildContext context, PaccayaSubdivision sub) {
    final theme = Theme.of(context);
    final note = item.localizedSubdivisionNote(context, sub);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${item.localizedSubdivisionName(context, sub)} — ${sub.namePali}',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          if (note != null && note.isNotEmpty)
            Text(note, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget _heading(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget _section(
    BuildContext context,
    String title,
    String body, {
    bool italic = false,
  }) {
    if (body.trim().isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 2),
          Text(
            body,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontStyle: italic ? FontStyle.italic : null,
                ),
          ),
        ],
      ),
    );
  }
}
