import 'package:flutter/material.dart';
import '../../../../core/localization/content_catalog.dart';
import '../../../../core/localization/localized_content.dart';
import '../../../../data/models/paticca_model.dart';
import '../../../../l10n/l10n.dart';

class PaticcaDetailSheet extends StatelessWidget {
  final PaticcaModel item;
  const PaticcaDetailSheet({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).bottomSheetTheme.backgroundColor ??
            Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${item.namePali} (${item.localizedName(context)})',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Divider(),
            Text(context.l10n.conditionDetails,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            ...item.links.isEmpty
                ? [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(context.l10n.lastConditionDescription),
                    )
                  ]
                : item.links.map((link) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(context.l10n.conditionLinkDescription(
                        link.effectId,
                        context.usesEnglishContent
                            ? item.localizedDescription(context)
                            : link.explanation,
                      )),
                    )),
          ],
        ),
      ),
    );
  }
}
