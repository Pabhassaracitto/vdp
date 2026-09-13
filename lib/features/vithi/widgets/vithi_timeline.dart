// lib/features/vithi/widgets/vithi_timeline.dart

import 'package:flutter/material.dart';

import '../../../core/localization/localized_content.dart';
import '../../../core/theme/vdp_theme.dart';
import '../../../data/models/vithi_model.dart';
import '../utils/vithi_color_mapper.dart';
import '../utils/vithi_label_mapper.dart';
import '../utils/vithi_moment.dart';
import '../utils/vithi_ui_text.dart';
import 'vithi_step_node.dart';

/// Horizontally scrollable, auto-following visualization of a citta-vīthi.
class VithiTimeline extends StatefulWidget {
  const VithiTimeline({
    super.key,
    required this.vithi,
    required this.moments,
    required this.activeIndex,
    required this.onStepTap,
  });

  final VithiModel vithi;
  final List<VithiMoment> moments;
  final int activeIndex;
  final ValueChanged<int> onStepTap;

  @override
  State<VithiTimeline> createState() => _VithiTimelineState();
}

class _VithiTimelineState extends State<VithiTimeline> {
  static const _nodeExtent = 140.0;
  final ScrollController _controller = ScrollController();

  @override
  void didUpdateWidget(covariant VithiTimeline oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeIndex != widget.activeIndex ||
        oldWidget.vithi.id != widget.vithi.id) {
      _scrollToActiveMoment();
    }
  }

  void _scrollToActiveMoment() {
    if (!_controller.hasClients || widget.activeIndex < 0) return;
    final viewport = _controller.position.viewportDimension;
    final target = (widget.activeIndex * _nodeExtent -
            ((viewport - 118) / 2))
        .clamp(0.0, _controller.position.maxScrollExtent)
        .toDouble();
    _controller.animateTo(
      target,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postVithiFlow = VithiMomentSequence.postVithiContinuation(widget.vithi);
    final accent = context.isHighContrast ? HCColors.primary : VdpColors.primary;

    return Semantics(
      container: true,
      label: VithiUiText.timelineSemantics(
        context,
        widget.moments.length,
        widget.vithi.localizedName(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.route_rounded, size: 19, color: accent, semanticLabel: ''),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  VithiUiText.timelineTitle(context),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: accent,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              _SequenceCount(count: widget.moments.length),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            VithiUiText.timelineInstruction(context),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 130,
            child: ListView.separated(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              itemCount: widget.moments.length + (postVithiFlow == null ? 0 : 1),
              separatorBuilder: (_, __) => const _TimelineConnector(),
              itemBuilder: (context, index) {
                if (index == widget.moments.length) {
                  return _PostVithiContinuation(
                    vithi: widget.vithi,
                    step: postVithiFlow!,
                  );
                }
                final moment = widget.moments[index];
                return VithiStepNode(
                  vithi: widget.vithi,
                  moment: moment,
                  totalMoments: widget.moments.length,
                  isActive: index == widget.activeIndex,
                  onTap: () => widget.onStepTap(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SequenceCount extends StatelessWidget {
  const _SequenceCount({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final color = context.isHighContrast ? HCColors.primary : VdpColors.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: color.withOpacity(context.isHighContrast ? 0.8 : 0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$count',
        style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 12),
      ),
    );
  }
}

class _TimelineConnector extends StatelessWidget {
  const _TimelineConnector();

  @override
  Widget build(BuildContext context) {
    final color = context.isHighContrast ? HCColors.borderStrong : VdpColors.primaryLight;
    return SizedBox(
      width: 22,
      child: Center(
        child: Icon(Icons.arrow_forward_rounded, color: color, size: 17, semanticLabel: ''),
      ),
    );
  }
}

class _PostVithiContinuation extends StatelessWidget {
  const _PostVithiContinuation({required this.vithi, required this.step});

  final VithiModel vithi;
  final VithiStep step;

  @override
  Widget build(BuildContext context) {
    final color = VithiColorMapper.colorForRole(step.role);
    final theme = Theme.of(context);
    return Semantics(
      label: '${VithiUiText.continuation(context)}: ${vithi.localizedStepName(context, step)}.',
      child: Container(
        width: 118,
        height: 124,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(context.isHighContrast ? 0.16 : 0.08),
          border: Border.all(color: color.withOpacity(0.55)),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.all_inclusive_rounded, color: color, size: 23, semanticLabel: ''),
                const Spacer(),
                Text(
                  '∞',
                  style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const Spacer(),
            Text(
              VithiLabelMapper.shortNameForRole(step.role).replaceAll('\n', ' '),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge?.copyWith(
                fontSize: 11,
                height: 1.15,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              VithiUiText.continuation(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
