// lib/features/paticca/presentation/widgets/list/paticca_filter_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/paticca_providers.dart';
import 'package:vdp_app/data/models/paticca_model.dart';
import '../../../../../core/theme/vdp_theme.dart';

class PaticcaFilterBar extends ConsumerWidget {
  const PaticcaFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _buildChip(ref, null, 'Tất cả'),
          _buildChip(ref, PaticcaVatta.kilesa, 'Phiền Não'),
          _buildChip(ref, PaticcaVatta.kamma, 'Nghiệp'),
          _buildChip(ref, PaticcaVatta.vipaka, 'Quả'),
        ],
      ),
    );
  }

  Widget _buildChip(WidgetRef ref, PaticcaVatta? vatta, String label) {
    final state = ref.watch(paticcaFlowchartStateProvider);
    final selected = state.filterVatta == vatta;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => ref
            .read(paticcaFlowchartStateProvider.notifier)
            .setVattaFilter(vatta),
      ),
    );
  }
}
