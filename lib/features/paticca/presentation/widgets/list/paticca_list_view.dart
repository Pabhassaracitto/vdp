// lib/features/paticca/presentation/widgets/list/paticca_list_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/paticca_providers.dart';
import 'paticca_list_item.dart';
import '../../paticca_detail_sheet.dart';

class PaticcaListView extends ConsumerWidget {
  const PaticcaListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(paticcaFilteredListProvider);
    return listAsync.when(
      data: (list) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => PaticcaListItem(
          item: list[index],
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (_) => PaticcaDetailSheet(item: list[index]),
          ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Lỗi: $e')),
    );
  }
}
