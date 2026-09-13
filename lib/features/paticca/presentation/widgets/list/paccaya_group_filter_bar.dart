// lib/features/paticca/presentation/widgets/list/paccaya_group_filter_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../l10n/l10n.dart';
import 'package:vdp_app/data/models/paccaya_model.dart';
import '../../providers/paticca_providers.dart';

/// Bộ lọc nhóm + ô tìm kiếm cho 24 Duyên Hệ.
class PaccayaFilterBar extends ConsumerStatefulWidget {
  const PaccayaFilterBar({super.key});

  @override
  ConsumerState<PaccayaFilterBar> createState() => _PaccayaFilterBarState();
}

class _PaccayaFilterBarState extends ConsumerState<PaccayaFilterBar> {
  final TextEditingController _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final active = ref.watch(paccayaGroupFilterProvider);
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              _chip(null, context.l10n.allFilters, active == null),
              for (final group in PaccayaGroup.values)
                _chip(group, group.localizedName(context.l10n), active == group),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: TextField(
            controller: _search,
            decoration: InputDecoration(
              isDense: true,
              hintText: context.l10n.paccayaSearchHint,
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: _search.text.isEmpty
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.close, size: 18),
                      tooltip: context.l10n.clearSearch,
                      onPressed: () {
                        _search.clear();
                        ref.read(paccayaSearchProvider.notifier).state = '';
                        setState(() {});
                      },
                    ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) {
              ref.read(paccayaSearchProvider.notifier).state = value;
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget _chip(PaccayaGroup? group, String label, bool selected) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) =>
            ref.read(paccayaGroupFilterProvider.notifier).state = group,
      ),
    );
  }
}
