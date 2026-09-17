// lib/features/vithi/widgets/vithi_step_node.dart

import 'package:flutter/material.dart';
import 'package:vdp_app/data/models/vithi_model.dart';

import '../../../core/localization/localized_content.dart';
import '../../../core/theme/vdp_theme.dart';
import '../utils/vithi_color_mapper.dart';
import '../utils/vithi_label_mapper.dart';
import '../utils/vithi_moment.dart';
import '../utils/vithi_ui_text.dart';

/// One selectable mental moment in the horizontally scrollable sequence.
class VithiStepNode extends StatelessWidget {
  const VithiStepNode({
    super.key,
    required this.vithi,
    required this.moment,
    required this.totalMoments,
    required this.isActive,
    required this.onTap,
  });

  final VithiModel vithi;
  final VithiMoment moment;
  final int totalMoments;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final roleColor = VithiColorMapper.colorForRole(moment.step.role);
    final selectionColor = context.isHighContrast ? HCColors.primary : VdpColors.primary;
    final label = _displayLabel();
    final semanticLabel = VithiUiText.momentSemantics(
      context,
      position: moment.position,
      total: totalMoments,
      name: vithi.localizedStepName(context, moment.step),
      isSelected: isActive,
      isOptional: moment.step.isOptional,
      occurrenceLabel: moment.occurrenceLabel,
    );

    return Semantics(
      button: true,
      selected: isActive,
      label: semanticLabel,
      child: Tooltip(
        message: '${vithi.localizedStepName(context, moment.step)}${moment.isRepeated ? ' · ${VithiUiText.repeatLabel(context, moment.occurrence, moment.occurrenceTotal)}' : ''}',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(14),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              width: 118,
              height: 124,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isActive
                    ? roleColor.withOpacity(context.isHighContrast ? 0.28 : 0.16)
                    : roleColor.withOpacity(context.isHighContrast ? 0.14 : 0.08),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isActive ? selectionColor : roleColor.withOpacity(0.55),
                  width: isActive ? 2.5 : 1.2,
                ),
                boxShadow: isActive && !context.isHighContrast
                    ? [
                        BoxShadow(
                          color: roleColor.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: roleColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${moment.position}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        VithiLabelMapper.symbolForRole(moment.step.role),
                        semanticsLabel: '',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _NodeFooter(moment: moment, roleColor: roleColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _displayLabel() {
    final base = VithiLabelMapper.shortNameForRole(moment.step.role)
        .replaceAll('\n', ' ');
    if (moment.isRepeated) return '$base ${moment.occurrence}/${moment.occurrenceTotal}';
    return base;
  }
}

class _NodeFooter extends StatelessWidget {
  const _NodeFooter({required this.moment, required this.roleColor});

  final VithiMoment moment;
  final Color roleColor;

  @override
  Widget build(BuildContext context) {
    final label = moment.step.isOptional
        ? VithiUiText.optional(context)
        : moment.isContinuingStream
            ? '∞'
            : moment.isRepeated
                ? moment.occurrenceLabel
                : '';
    if (label.isEmpty) return const SizedBox(height: 15);

    return Container(
      constraints: const BoxConstraints(minHeight: 15),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        color: roleColor.withOpacity(context.isHighContrast ? 0.25 : 0.14),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: context.isHighContrast ? HCColors.textPrimary : roleColor,
          fontSize: 9,
          height: 1.2,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
