// lib/features/vithi/widgets/vithi_citta_chip.dart

import 'package:flutter/material.dart';

import '../../../core/theme/vdp_theme.dart';

/// Compact citta label used in the expanded "possible cittas" section.
class VithiCittaChip extends StatelessWidget {
  const VithiCittaChip({
    super.key,
    required this.cittaId,
    required this.label,
  });

  final String cittaId;
  final String label;

  @override
  Widget build(BuildContext context) {
    final color = context.isHighContrast ? HCColors.secondary : VdpColors.rupavacara;
    return Semantics(
      label: '$label ($cittaId)',
      child: Tooltip(
        message: '$label · $cittaId',
        child: Container(
          constraints: const BoxConstraints(maxWidth: 220),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            color: color.withOpacity(context.isHighContrast ? 0.18 : 0.1),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: color.withOpacity(context.isHighContrast ? 0.7 : 0.35)),
          ),
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: context.isHighContrast ? HCColors.textPrimary : color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
