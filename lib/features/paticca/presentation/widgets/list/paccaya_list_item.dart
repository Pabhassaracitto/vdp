// lib/features/paticca/presentation/widgets/list/paccaya_list_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/localization/localized_content.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../audio/providers/audio_player_provider.dart';
import '../../providers/paticca_audio_session.dart';
import 'package:vdp_app/data/models/paccaya_model.dart';

/// V1.9.2 §2/§3 — tô nền hàng đang được đọc, khi phiên nghe hiện tại đến từ
/// đúng phần "Duyên hệ" của tab Nhân Duyên.
class PaccayaListItem extends ConsumerWidget {
  final PaccayaModel item;
  final VoidCallback onTap;

  const PaccayaListItem({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final groupLabel = item.group.localizedName(context.l10n);
    final audio = ref.watch(audioPlayerProvider);
    final isActive = audio.sourceKind == AudioSourceKind.paticcaPaccaya &&
        audio.currentSectionId == PaticcaAudioSession.trackId(true, item.id);
    final color = theme.colorScheme.primary;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: isActive ? color.withOpacity(0.12) : null,
      shape: isActive
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(color: color, width: 1.4),
            )
          : null,
      child: ListTile(
        leading: CircleAvatar(
          radius: 18,
          child: Text(
            item.order.toString(),
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(item.localizedName(context),
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
                    item.localizedDefinition(context),
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
            if (isActive && audio.isPlaying)
              Icon(Icons.graphic_eq_rounded, color: color, size: 18)
            else
              Text(
                item.localizedShortName(context),
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
