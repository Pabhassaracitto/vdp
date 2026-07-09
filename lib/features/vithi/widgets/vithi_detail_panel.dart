// lib/features/vithi/widgets/vithi_detail_panel.dart

import 'package:flutter/material.dart';
import '../../../data/models/vithi_model.dart';
import '../utils/vithi_color_mapper.dart';
import 'vithi_citta_chip.dart';

class VithiDetailPanel extends StatelessWidget {
  final VithiStep step;
  const VithiDetailPanel({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    final roleColor = VithiColorMapper.colorForRole(step.role);
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(step.nameVietnamese,
              style: TextStyle(color: roleColor, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(step.description,
              style: const TextStyle(color: Colors.white, fontSize: 13)),
          if (step.allowedCittaIds.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
                children: step.allowedCittaIds
                    .map((id) => VithiCittaChip(cittaId: id))
                    .toList()),
          ]
        ],
      ),
    );
  }
}
