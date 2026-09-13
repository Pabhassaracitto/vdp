// lib/features/vithi/widgets/vithi_detail_panel.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/localization/localized_content.dart';
import '../../../core/theme/vdp_theme.dart';
import '../../../data/models/citta_model.dart';
import '../../../data/models/vithi_model.dart';
import '../../../data/repositories/vdp_repository.dart';
import '../utils/vithi_color_mapper.dart';
import '../utils/vithi_label_mapper.dart';
import '../utils/vithi_moment.dart';
import '../utils/vithi_ui_text.dart';
import 'vithi_citta_chip.dart';

/// Detail card for the currently selected expanded moment.
class VithiDetailPanel extends ConsumerWidget {
  const VithiDetailPanel({
    super.key,
    required this.vithi,
    required this.moment,
    required this.totalMoments,
  });

  final VithiModel vithi;
  final VithiMoment moment;
  final int totalMoments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = moment.step;
    final doctrinalNote = step.doctrinalNote;
    final roleColor = VithiColorMapper.colorForRole(step.role);
    final theme = Theme.of(context);
    final cittaById = <String, CittaModel>{
      for (final citta in ref.watch(vdpRepositoryProvider).cittas) citta.id: citta,
    };

    return Semantics(
      container: true,
      liveRegion: true,
      label: '${VithiUiText.currentMoment(context)}. ${vithi.localizedStepName(context, step)}.',
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.02, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        ),
        child: Container(
          key: ValueKey(moment.key),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.isHighContrast ? HCColors.surfaceVariant : VdpColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: roleColor.withOpacity(context.isHighContrast ? 0.8 : 0.4),
              width: 1.2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: roleColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      VithiLabelMapper.symbolForRole(step.role),
                      semanticsLabel: '',
                      style: const TextStyle(fontSize: 22),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          VithiUiText.currentMoment(context),
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: roleColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          vithi.localizedStepName(context, step),
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                step.namePali,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: roleColor,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: [
                  _DetailBadge(
                    label: VithiUiText.momentProgress(
                      context,
                      moment.position,
                      totalMoments,
                    ),
                    color: roleColor,
                  ),
                  if (moment.isRepeated)
                    _DetailBadge(
                      label: VithiUiText.repeatLabel(
                        context,
                        moment.occurrence,
                        moment.occurrenceTotal,
                      ),
                      color: roleColor,
                    ),
                  if (step.isOptional)
                    _DetailBadge(
                      label: VithiUiText.optional(context),
                      color: roleColor,
                    ),
                  if (moment.isContinuingStream)
                    _DetailBadge(label: '∞', color: roleColor),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                vithi.localizedStepDescription(context, step),
                style: theme.textTheme.bodyMedium,
              ),
              if (doctrinalNote != null && doctrinalNote.isNotEmpty) ...[
                const SizedBox(height: 12),
                _DoctrinalNote(text: doctrinalNote, color: roleColor),
              ],
              const SizedBox(height: 12),
              _PossibleCittas(
                ids: step.allowedCittaIds,
                cittaById: cittaById,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailBadge extends StatelessWidget {
  const _DetailBadge({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(context.isHighContrast ? 0.2 : 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: context.isHighContrast ? HCColors.textPrimary : color,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _DoctrinalNote extends StatelessWidget {
  const _DoctrinalNote({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(context.isHighContrast ? 0.18 : 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(context.isHighContrast ? 0.7 : 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline_rounded, size: 16, color: color, semanticLabel: ''),
              const SizedBox(width: 6),
              Text(
                VithiUiText.doctrinalNote(context),
                style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _PossibleCittas extends StatelessWidget {
  const _PossibleCittas({required this.ids, required this.cittaById});

  final List<String> ids;
  final Map<String, CittaModel> cittaById;

  @override
  Widget build(BuildContext context) {
    if (ids.isEmpty) {
      return Text(
        VithiUiText.noCittaMapping(context),
        style: Theme.of(context).textTheme.bodySmall,
      );
    }

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.only(bottom: 2),
        leading: Icon(
          Icons.psychology_alt_outlined,
          color: context.isHighContrast ? HCColors.secondary : VdpColors.rupavacara,
          semanticLabel: '',
        ),
        title: Text(
          VithiUiText.possibleCittas(context, ids.length),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          ids.length == 1 ? ids.first : '${ids.take(3).join(', ')}…',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Wrap(
              spacing: 7,
              runSpacing: 7,
              children: [
                for (final id in ids)
                  VithiCittaChip(
                    cittaId: id,
                    label: cittaById[id]?.localizedName(context) ?? id,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
