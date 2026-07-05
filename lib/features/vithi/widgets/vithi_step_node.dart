// lib/features/vithi/widgets/vithi_step_node.dart
import 'package:flutter/material.dart';
import '../../../../data/models/vithi_model.dart';
import '../utils/vithi_color_mapper.dart';
import '../utils/vithi_label_mapper.dart';

class VithiStepNode extends StatelessWidget {
  final VithiStep step;
  final bool isActive;
  final int index;

  const VithiStepNode({
    super.key, required this.step,
    required this.isActive, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, height: 60,
      decoration: BoxDecoration(
        color: VithiColorMapper.colorForRole(step.role),
        border: isActive ? Border.all(color: Colors.white, width: 2) : null,
      ),
      child: Center(child: Text(VithiLabelMapper.shortNameForRole(step.role), style: const TextStyle(fontSize: 10, color: Colors.white))),
    );
  }
}
