// lib/features/paticca/presentation/widgets/paticca_detail_sheet.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vdp_app/core/localization/content_catalog.dart';

import '../../../../core/localization/localized_content.dart';
import '../../../../data/models/paticca_model.dart';
import '../../../../l10n/l10n.dart';
import '../providers/paticca_providers.dart';
import 'paccaya_detail_sheet.dart';

/// Chi tiết một chi trong 12 chi Thập Nhị Nhân Duyên (phần A của tab Nhân Duyên).
class PaticcaDetailSheet extends ConsumerWidget {
  final PaticcaModel item;

  const PaticcaDetailSheet({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final relatedPaccayas =
        ref.watch(paccayasForPaticcaProvider(item.id)).valueOrNull ?? const [];
    // Văn bản tuỳ chọn đọc qua catalog: tiếng Việt từ dataset, ngôn ngữ khác
    // từ overlay tiếng Anh; chưa dịch thì ẩn mục thay vì rò tiếng Việt.
    final localizedExamples = item.localizedExamples(context) ?? const [];
    final doctrinalNote = item.localizedDoctrinalNote(context);

    return SafeArea(
      child: Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
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
                  CircleAvatar(radius: 20, child: Text('${item.order}')),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${item.namePali} (${item.localizedName(context)})',
                            style: theme.textTheme.titleLarge),
                        const SizedBox(height: 4),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: [
                            _chip(context, _kiepLabel(l10n, item.kiep)),
                            _chip(context, _vattaLabel(l10n, item.vatta)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              if (item.localizedDescription(context).isNotEmpty)
                _section(context, l10n.doctrine,
                    item.localizedDescription(context)),
              _fourAspects(context, l10n),
              if (item.links.isNotEmpty) ...[
                _heading(context, l10n.conditionDetails),
                for (final link in item.links)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      context.l10n.conditionLinkDescription(
                        link.effectId,
                        // `link.explanation` is Vietnamese-only dataset prose;
                        // the localized description is translated per locale.
                        context.showsVietnameseSourceText
                            ? link.explanation
                            : item.localizedDescription(context),
                      ),
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
              ] else
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(l10n.lastConditionDescription,
                      style: theme.textTheme.bodySmall),
                ),
              if (localizedExamples.isNotEmpty) ...[
                _heading(context, l10n.examples),
                for (final example in localizedExamples)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child:
                        Text('• $example', style: theme.textTheme.bodySmall),
                  ),
              ],
              if (relatedPaccayas.isNotEmpty) ...[
                _heading(context, l10n.conditionsTabPaccaya),
                Text(
                  l10n.paccayaCount(relatedPaccayas.length),
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final paccaya in relatedPaccayas)
                      ActionChip(
                        label: Text(
                          '${paccaya.order}. ${paccaya.localizedName(context)}',
                        ),
                        visualDensity: VisualDensity.compact,
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => PaccayaDetailSheet(item: paccaya),
                        ),
                      ),
                  ],
                ),
              ],
              if (doctrinalNote != null && doctrinalNote.isNotEmpty)
                _section(context, l10n.notes, doctrinalNote),
            ],
          ),
        ),
      ),
    );
  }

  /// Tứ Nghĩa (lakkhaṇa / rasa / paccupaṭṭhāna / padaṭṭhāna) — cùng chuẩn với
  /// CetasikaDetailSheet để người học gặp lại một cấu trúc quen thuộc.
  ///
  /// Đọc qua content catalog: với tiếng Việt lấy từ dataset, với ngôn ngữ khác
  /// lấy overlay (en) và tự ẩn hàng khi chưa có bản dịch — không bao giờ hiển
  /// thị văn bản nguồn tiếng Việt cho người đọc ngôn ngữ khác.
  Widget _fourAspects(BuildContext context, AppLocalizations l10n) {
    final rows = <(String, String?)>[
      (l10n.characteristic, item.localizedCharacteristic(context)),
      (l10n.functionLabel, item.localizedFunction(context)),
      (l10n.manifestation, item.localizedManifestation(context)),
      (l10n.proximateCause, item.localizedProximateCause(context)),
    ].where((row) => (row.$2 ?? '').isNotEmpty).toList();
    if (rows.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final row in rows)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(row.$1,
                      style: Theme.of(context).textTheme.labelMedium),
                  Text(row.$2!, style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _chip(BuildContext context, String label) {
    return Chip(
      label: Text(label),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  Widget _heading(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 4),
      child: Text(title, style: Theme.of(context).textTheme.titleSmall),
    );
  }

  Widget _section(BuildContext context, String title, String body) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 2),
          Text(body, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  static String _kiepLabel(AppLocalizations l10n, PaticcaKiep kiep) {
    return switch (kiep) {
      PaticcaKiep.past => l10n.kiepPast,
      PaticcaKiep.present => l10n.kiepPresent,
      PaticcaKiep.future => l10n.kiepFuture,
    };
  }

  static String _vattaLabel(AppLocalizations l10n, PaticcaVatta vatta) {
    return switch (vatta) {
      PaticcaVatta.kilesa => l10n.defilements,
      PaticcaVatta.kamma => l10n.kamma,
      PaticcaVatta.vipaka => l10n.result,
    };
  }
}
