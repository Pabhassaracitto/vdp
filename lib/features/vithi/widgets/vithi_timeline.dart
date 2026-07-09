// lib/features/vithi/widgets/vithi_timeline.dart
import 'package:flutter/material.dart';
import '../../../../data/models/vithi_model.dart';
import 'vithi_step_node.dart';

class VithiTimeline extends StatelessWidget {
  final VithiModel vithi;
  final Function(int) onStepTap;
  const VithiTimeline(
      {super.key, required this.vithi, required this.onStepTap});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: vithi.steps.length,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (context, i) => GestureDetector(
        onTap: () => onStepTap(i),
        child: VithiStepNode(step: vithi.steps[i], isActive: false, index: i),
      ),
    );
  }
}
