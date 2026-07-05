// lib/features/kamma/presentation/widgets/kamma_card.dart
import 'package:flutter/material.dart';
import '../../../../data/models/kamma_model.dart';
import '../../../../../core/theme/vdp_theme.dart';

class KammaCard extends StatelessWidget {
  final KammaModel kamma;
  final VoidCallback onTap;

  const KammaCard({super.key, required this.kamma, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(kamma.nameVietnamese, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(kamma.namePali),
        onTap: onTap,
      ),
    );
  }
}
