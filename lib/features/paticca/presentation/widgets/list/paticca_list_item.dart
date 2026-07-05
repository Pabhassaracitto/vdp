// lib/features/paticca/presentation/widgets/list/paticca_list_item.dart
import 'package:flutter/material.dart';
import 'package:vdp_app/data/models/paticca_model.dart';

class PaticcaListItem extends StatelessWidget {
  final PaticcaModel item;
  final VoidCallback onTap;

  const PaticcaListItem({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(child: Text(item.order.toString())),
        title: Text(item.nameVietnamese),
        subtitle: Text(item.namePali),
        onTap: onTap,
      ),
    );
  }
}
