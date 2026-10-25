// lib/features/kamma/presentation/widgets/kamma_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/localization/localized_content.dart';
import '../../../../core/localization/locale_controller.dart';
import '../../../../data/models/kamma_model.dart';
import '../../../../shared/widgets/suggest_correction_button.dart';

class KammaCard extends ConsumerWidget {
  final KammaModel kamma;
  final VoidCallback onTap;

  const KammaCard({super.key, required this.kamma, required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeTag = ref.watch(localeSettingsProvider).contentLocale;
    final showSuggest = localeTag != 'vi' && localeTag != 'en';
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(kamma.localizedName(context),
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(kamma.namePali),
        trailing: showSuggest
            ? SuggestCorrectionButton.compact(
                localeTag: localeTag,
                paliKey: kamma.id,
                currentText: kamma.localizedName(context),
                englishFallback: kamma.namePali,
                paliName: kamma.namePali,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
