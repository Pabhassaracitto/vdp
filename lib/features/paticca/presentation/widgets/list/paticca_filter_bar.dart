// lib/features/paticca/presentation/widgets/list/paticca_filter_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/paticca_providers.dart';
import 'package:vdp_app/data/models/paticca_model.dart';
import '../../../../../l10n/l10n.dart';

class PaticcaFilterBar extends ConsumerWidget {
  const PaticcaFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _buildChip(ref, null, context.l10n.allFilters),
          _buildChip(ref, PaticcaVatta.kilesa, context.l10n.defilements),
          _buildChip(ref, PaticcaVatta.kamma, context.l10n.kamma),
          _buildChip(ref, PaticcaVatta.vipaka, context.l10n.result),
        ],
      ),
    );
  }

  Widget _buildChip(WidgetRef ref, PaticcaVatta? vatta, String label) {
    final state = ref.watch(paticcaFlowchartStateProvider);
    final selected = state.filterVatta == vatta;
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8),
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
