// lib/features/detail/cetasika_detail_sheet.dart
// Bottom sheet chi tiết Tâm Sở + hiển thị Conflict Guard

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/localization/content_catalog.dart';
import '../../core/localization/localized_content.dart';
import '../../core/theme/vdp_theme.dart';
import '../../core/utils/pali_tts_helper.dart';
import '../../data/models/cetasika_model.dart';
import '../../l10n/l10n.dart';
import 'widgets/pali_name_card.dart';

class CetasikaDetailSheet extends ConsumerStatefulWidget {
  final CetasikaModel cetasika;

  const CetasikaDetailSheet({super.key, required this.cetasika});

  @override
  ConsumerState<CetasikaDetailSheet> createState() =>
      _CetasikaDetailSheetState();
}

class _CetasikaDetailSheetState extends ConsumerState<CetasikaDetailSheet> {
  bool _isSpeaking = false;

  Future<void> _speakPali() async {
    if (_isSpeaking) {
      await PaliTtsHelper.instance.stop();
      if (mounted) setState(() => _isSpeaking = false);
      return;
    }

    setState(() => _isSpeaking = true);

    final success =
        await PaliTtsHelper.instance.speak(widget.cetasika.namePali);

    if (mounted) {
      setState(() => _isSpeaking = false);
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.ttsUnavailable),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // PaliTtsHelper.instance.stop(); // Không cần stop ở đây nếu muốn phát tiếp khi đóng sheet
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cetasika = widget.cetasika;
    final localizedName = cetasika.localizedName(context);
    final characteristic = cetasika.localizedCharacteristic(context);
    final function = cetasika.localizedFunction(context);
    final manifestation = cetasika.localizedManifestation(context);
    final proximateCause = cetasika.localizedProximateCause(context);
    final groupColor = _getGroupColor(cetasika.group);

    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).bottomSheetTheme.backgroundColor ??
                Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            border: Border(top: BorderSide(color: groupColor, width: 4)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(20),
            children: [
              // ── Handle ──────────────────────────────────────────────
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // ── Header ──────────────────────────────────────────────
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: groupColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      cetasika.symbol,
                      style: TextStyle(fontSize: 24, color: groupColor),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${context.l10n.cetasika} ${cetasika.traditionalOrder}',
                          style: TextStyle(fontSize: 11, color: groupColor),
                        ),
                        Text(
                          localizedName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          cetasika.group.localizedName(context.l10n, includeCount: true),
                          style: TextStyle(fontSize: 12, color: groupColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ── Pali name + TTS button ───────────────────────────────
              PaliNameCard(
                namePali: cetasika.namePali,
                ipaTranscription: cetasika.ipaTranscription,
                accentColor: groupColor,
                isSpeaking: _isSpeaking,
                onSpeak: _speakPali,
              ),

              // ── Mô tả ───────────────────────────────────────────────
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  cetasika.localizedDescription(context),
                  style: const TextStyle(fontSize: 15, height: 1.7),
                ),
              ),

              // ── Tứ Nghĩa ────────────────────────────────────────────
              if (characteristic != null ||
                  function != null ||
                  manifestation != null ||
                  proximateCause != null) ...[
                const SizedBox(height: 20),
                Text(
                  '📖 ${context.l10n.fourfoldDefinition}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Theme.of(context).bottomSheetTheme.backgroundColor ??
                        Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      if (characteristic != null)
                        _buildFourAspectRow(context.l10n.characteristic,
                            'Lakkhaṇa', characteristic),
                      if (function != null)
                        _buildFourAspectRow(
                            context.l10n.functionLabel, 'Rasa', function),
                      if (manifestation != null)
                        _buildFourAspectRow(context.l10n.manifestation,
                            'Paccupaṭṭhāna', manifestation),
                      if (proximateCause != null)
                        _buildFourAspectRow(context.l10n.proximateCause,
                            'Padaṭṭhāna', proximateCause),
                    ],
                  ),
                ),
              ],

              // ── Conflict Guard ───────────────────────────────────────
              if (cetasika.conflictRules.isNotEmpty) ...[
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.warning_amber,
                        color: Colors.orange, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      context.l10n.doctrinalConflicts,
                      style:
                          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        context.l10n.rulesCount(cetasika.conflictRules.length),
                        style: TextStyle(
                            fontSize: 11, color: Colors.orange.shade800),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...cetasika.conflictRules
                    .map((rule) => _ConflictRuleCard(rule: rule)),
              ],

              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFourAspectRow(String title, String pali, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13)),
                Text(pali,
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic)),
              ],
            ),
          ),
          Expanded(
            child:
                Text(value, style: const TextStyle(fontSize: 13, height: 1.5)),
          ),
        ],
      ),
    );
  }

  Color _getGroupColor(CetasikaGroup group) {
    switch (group) {
      case CetasikaGroup.sabbacittasadharana:
        return VdpColors.sabbacittasadharana;
      case CetasikaGroup.pakinnaka:
        return VdpColors.pakinnaka;
      case CetasikaGroup.akusala:
        return VdpColors.cetasikaAkusala;
      case CetasikaGroup.sobhana:
        return VdpColors.cetasikaSobhana;
    }
  }

}

class _ConflictRuleCard extends StatelessWidget {
  final ConflictRule rule;
  const _ConflictRuleCard({required this.rule});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.usesEnglishContent
                ? (rule.explanationPali ?? context.l10n.doctrinalConflicts)
                : rule.explanation,
            style: const TextStyle(fontSize: 13),
          ),
          if (rule.explanationPali != null)
            Text(rule.explanationPali!,
                style:
                    const TextStyle(fontSize: 11, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
