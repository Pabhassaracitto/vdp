// lib/features/vithi/widgets/vithi_header.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/vithi_model.dart';
import '../providers/vithi_providers.dart';

class VithiHeader extends ConsumerWidget {
  final VithiModel currentVithi;
  const VithiHeader({super.key, required this.currentVithi});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      Text(currentVithi.nameVietnamese, style: const TextStyle(color: Colors.white, fontSize: 18)),
      Text(currentVithi.namePali, style: const TextStyle(color: Colors.amber)),
    ]);
  }
}
