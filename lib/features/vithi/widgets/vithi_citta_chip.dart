// lib/features/vithi/widgets/vithi_citta_chip.dart

import 'package:flutter/material.dart';

class VithiCittaChip extends StatelessWidget {
  final String cittaId;

  const VithiCittaChip({super.key, required this.cittaId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1A237E).withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF3F51B5), width: 0.5),
      ),
      child: Text(cittaId, style: const TextStyle(color: Colors.white, fontSize: 11)),
    );
  }
}
