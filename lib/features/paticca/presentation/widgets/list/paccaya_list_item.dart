// lib/features/paticca/presentation/widgets/list/paccaya_list_item.dart
import 'package:flutter/material.dart';

import '../../../../../l10n/l10n.dart';
import 'package:vdp_app/data/models/paccaya_model.dart';

class PaccayaListItem extends StatelessWidget {
  final PaccayaModel item;
  final VoidCallback onTap;

  const PaccayaListItem({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final groupLabel = item.group.localizedName(context.l10n);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          radius: 18,
          child: Text(
            item.order.toString(),
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(item.nameVietnamese,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.namePali, style: theme.textTheme.bodySmall),
            const SizedBox(height: 4),
            Row(
              children: [
                Flexible(
                  child: Text(
                    item.definitionVi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              item.nameShort,
              style: theme.textTheme.labelSmall,
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 4),
            Text(
              groupLabel,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        isThreeLine: true,
        onTap: onTap,
      ),
    );
  }
}
