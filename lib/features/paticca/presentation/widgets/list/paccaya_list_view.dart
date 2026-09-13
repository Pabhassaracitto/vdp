// lib/features/paticca/presentation/widgets/list/paccaya_list_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../l10n/l10n.dart';
import '../../providers/paticca_providers.dart';
import '../paccaya_detail_sheet.dart';
import '../paccaya_source_notice.dart';
import 'paccaya_list_item.dart';

/// Danh sách 24 Duyên Hệ (Paṭṭhāna naya) — phần B của tab Nhân Duyên.
class PaccayaListView extends ConsumerWidget {
  const PaccayaListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(paccayaFilteredListProvider);
    return listAsync.when(
      data: (list) {
        if (list.isEmpty) {
          return ListView(
            children: [
              const PaccayaSourceNotice(),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Center(child: Text(context.l10n.paccayaEmpty)),
              ),
            ],
          );
        }
        return ListView(
          children: [
            const PaccayaSourceNotice(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                context.l10n.paccayaCount(list.length),
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            for (final item in list)
              PaccayaListItem(
                item: item,
                onTap: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => PaccayaDetailSheet(item: item),
                ),
              ),
            const SizedBox(height: 16),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Text(context.l10n.errorWithMessage(error.toString())),
      ),
    );
  }
}
