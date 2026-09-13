// lib/features/vithi/widgets/vithi_header.dart

import 'package:flutter/material.dart';

import '../../../core/localization/localized_content.dart';
import '../../../core/theme/vdp_theme.dart';
import '../../../data/models/vithi_model.dart';
import '../utils/vithi_ui_text.dart';

/// Overview and selector for the cognitive-process player.
class VithiHeader extends StatelessWidget {
  const VithiHeader({
    super.key,
    required this.currentVithi,
    required this.vithis,
    required this.momentCount,
    required this.onVithiSelected,
  });

  final VithiModel currentVithi;
  final List<VithiModel> vithis;
  final int momentCount;
  final ValueChanged<VithiModel> onVithiSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = context.isHighContrast ? HCColors.primary : VdpColors.secondary;
    final surface = context.isHighContrast ? HCColors.surfaceVariant : VdpColors.surface;

    return Semantics(
      container: true,
      label: '${currentVithi.localizedName(context)}. ${VithiUiText.momentCount(context, momentCount)}.',
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: accent.withOpacity(context.isHighContrast ? 0.7 : 0.35)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: accent.withOpacity(context.isHighContrast ? 0.18 : 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.account_tree_rounded,
                    color: accent,
                    semanticLabel: '',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentVithi.localizedName(context),
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        currentVithi.namePali,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: accent,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              currentVithi.localizedDescription(context),
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _HeaderBadge(
                  icon: Icons.timelapse_rounded,
                  label: VithiUiText.momentCount(context, momentCount),
                  color: accent,
                ),
                _HeaderBadge(
                  icon: Icons.door_front_door_outlined,
                  label: VithiUiText.doorLabel(context, currentVithi),
                  color: accent,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              VithiUiText.processPicker(context),
              style: theme.textTheme.labelLarge?.copyWith(color: accent),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final vithi in vithis) ...[
                    Tooltip(
                      message: vithi.localizedName(context),
                      child: ChoiceChip(
                        label: Text(VithiUiText.processLabel(context, vithi)),
                        selected: vithi.id == currentVithi.id,
                        onSelected: (_) => onVithiSelected(vithi),
                        avatar: Icon(
                          _iconFor(vithi),
                          size: 16,
                          semanticLabel: '',
                        ),
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: vithi.id == currentVithi.id
                              ? (context.isHighContrast ? Colors.black : VdpColors.primary)
                              : theme.colorScheme.onSurface,
                        ),
                        side: BorderSide(
                          color: vithi.id == currentVithi.id
                              ? accent
                              : theme.dividerColor,
                        ),
                        selectedColor: accent.withOpacity(context.isHighContrast ? 0.9 : 0.22),
                        showCheckmark: false,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconFor(VithiModel vithi) => switch (vithi.dvara) {
        VithiDvara.panca => Icons.visibility_rounded,
        VithiDvara.mano => Icons.psychology_rounded,
        VithiDvara.vithimutta => Icons.all_inclusive_rounded,
      };
}

class _HeaderBadge extends StatelessWidget {
  const _HeaderBadge({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(context.isHighContrast ? 0.16 : 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(context.isHighContrast ? 0.7 : 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: color, semanticLabel: ''),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
