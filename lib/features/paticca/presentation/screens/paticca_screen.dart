// lib/features/paticca/presentation/screens/paticca_screen.dart
import 'package:flutter/material.dart';
import '../widgets/list/paticca_filter_bar.dart';
import '../widgets/list/paticca_list_view.dart';

class PaticcaScreen extends StatelessWidget {
  const PaticcaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nhân Duyên')),
      body: const Column(
        children: [
          PaticcaFilterBar(),
          Expanded(child: PaticcaListView()),
        ],
      ),
    );
  }
}
