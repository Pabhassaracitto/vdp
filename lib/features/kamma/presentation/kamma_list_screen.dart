// lib/features/kamma/presentation/kamma_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/kamma_providers.dart';
import 'widgets/kamma_card.dart';

class KammaListScreen extends ConsumerWidget {
  const KammaListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final group = ref.watch(selectedKammaGroupProvider);
    final kammasAsync = ref.watch(kammasByGroupProvider(group));
    
    return Scaffold(
      appBar: AppBar(title: const Text('Nghiệp (Kamma)')),
      body: kammasAsync.when(
        data: (kammas) => ListView.builder(
          itemCount: kammas.length,
          itemBuilder: (context, i) => KammaCard(kamma: kammas[i], onTap: () {}),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Lỗi: $e')),
      ),
    );
  }
}
