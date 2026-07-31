// lib/features/kamma/presentation/kamma_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../l10n/l10n.dart';
import 'providers/kamma_providers.dart';
import 'widgets/kamma_card.dart';

class KammaListScreen extends ConsumerWidget {
  const KammaListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final group = ref.watch(selectedKammaGroupProvider);
    final kammasAsync = ref.watch(kammasByGroupProvider(group));

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.kammaTitle)),
      body: kammasAsync.when(
        data: (kammas) => ListView.builder(
          itemCount: kammas.length,
          itemBuilder: (context, i) =>
              KammaCard(kamma: kammas[i], onTap: () {}),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text(context.l10n.errorWithMessage(error.toString())),
        ),
      ),
    );
  }
}
