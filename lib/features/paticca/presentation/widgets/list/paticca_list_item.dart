// lib/features/paticca/presentation/widgets/list/paticca_list_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vdp_app/data/models/paticca_model.dart';
import '../../../../../core/localization/localized_content.dart';
import '../../../../audio/providers/audio_player_provider.dart';
import '../../providers/paticca_audio_session.dart';

/// V1.9.2 §2/§3 — tô nền hàng đang được đọc (song song với tab Học), khi
/// phiên nghe hiện tại đến từ đúng phần "Liên kết" của tab Nhân Duyên.
class PaticcaListItem extends ConsumerWidget {
  final PaticcaModel item;
  final VoidCallback onTap;

  const PaticcaListItem({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audio = ref.watch(audioPlayerProvider);
    final isActive = audio.sourceKind == AudioSourceKind.paticcaList &&
        audio.currentSectionId == PaticcaAudioSession.trackId(false, item.id);
    final color = Theme.of(context).colorScheme.primary;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: isActive ? color.withOpacity(0.12) : null,
      shape: isActive
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(color: color, width: 1.4),
            )
          : null,
      child: ListTile(
        leading: CircleAvatar(child: Text(item.order.toString())),
        title: Text(item.localizedName(context)),
        subtitle: Text(item.namePali),
        trailing: isActive && audio.isPlaying
            ? Icon(Icons.graphic_eq_rounded, color: color)
            : null,
        onTap: onTap,
      ),
    );
  }
}
