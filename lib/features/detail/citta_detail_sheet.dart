// lib/features/detail/citta_detail_sheet.dart
// Bottom sheet chi tiết Tâm khi người dùng nhấn vào

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vdp_app/shared/providers/progress_provider.dart';

import '../../core/localization/content_catalog.dart';
import '../../core/localization/localized_content.dart';
import '../../core/theme/vdp_theme.dart';
import '../../core/utils/pali_tts_helper.dart';
import '../../data/models/citta_model.dart';
import '../../data/repositories/vdp_repository.dart';
import '../../l10n/l10n.dart';
import 'widgets/pali_name_card.dart';

// Chuyển sang StatefulWidget để quản lý trạng thái isSpeaking
class CittaDetailSheet extends ConsumerStatefulWidget {
  final CittaModel citta;

  const CittaDetailSheet({super.key, required this.citta});

  @override
  ConsumerState<CittaDetailSheet> createState() => _CittaDetailSheetState();
}

class _CittaDetailSheetState extends ConsumerState<CittaDetailSheet> {
  bool _isSpeaking = false;

  Future<void> _speakPali() async {
    if (_isSpeaking) {
      await PaliTtsHelper.instance.stop();
      if (mounted) setState(() => _isSpeaking = false);
      return;
    }

    setState(() => _isSpeaking = true);

    final success = await PaliTtsHelper.instance.speak(widget.citta.namePali);

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
    PaliTtsHelper.instance.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final citta = widget.citta;
    final localizedName = citta.localizedName(context);
    final localizedDoctrine = citta.localizedDoctrine(context);
    final localizedExamples = citta.localizedExamples(context);
    final bhumiColor = citta.bhumiGroup.name.bhumiColor;
    final cetasikas = ref.read(cetasikasProvider);
    final alwaysAssocs = citta.cetasikaAssociations
        .where((a) => a.type == AssociationType.always)
        .toList();
    final sometimesAssocs = citta.cetasikaAssociations
        .where((a) => a.type == AssociationType.sometimes)
        .toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      expand: false,
      builder: (context, scrollController) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).bottomSheetTheme.backgroundColor ??
                  Theme.of(context).colorScheme.surface,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              border: Border(top: BorderSide(color: bhumiColor, width: 4)),
            ),
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(20),
              children: [
                // ── Handle ──────────────────────────────────────────────
                Semantics(
                  label: context.l10n.dragHandleSemantics,
                  child: Center(
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
                ),

                // ── Header ──────────────────────────────────────────────
                Row(
                  children: [
                    Semantics(
                      label: 'Bhumi Group ${citta.bhumiGroup.name}',
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: bhumiColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: bhumiColor, width: 1),
                        ),
                        child: Text(
                          citta.bhumiGroup.name.bhumiSymbol,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.cittaNumber(citta.orderIndex),
                            style: TextStyle(fontSize: 12, color: bhumiColor),
                          ),
                          Text(
                            localizedName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ── Note Button ──────────────────────────────────────
                    IconButton(
                      icon: const Icon(Icons.edit_note_rounded,
                          color: VdpColors.primary),
                      onPressed: () => _showNoteEditor(context, citta),
                    ),
                    // ── Bookmark Button ──────────────────────────────────
                    Consumer(builder: (context, ref, _) {
                      final isBookmarked = ref
                          .watch(progressProvider)
                          .bookmarkedCittaIds
                          .contains(citta.id);
                      return IconButton(
                        icon: Icon(
                          isBookmarked
                              ? Icons.bookmark_rounded
                              : Icons.bookmark_border_rounded,
                          color:
                              isBookmarked ? VdpColors.secondary : Colors.grey,
                        ),
                        onPressed: () => ref
                            .read(progressProvider.notifier)
                            .toggleCittaBookmark(citta.id),
                      );
                    }),
                  ],
                ),

                const SizedBox(height: 12),

                // ── Pali name + TTS button ───────────────────────────────
                PaliNameCard(
                  namePali: citta.namePali,
                  ipaTranscription: null, // CittaModel không có IPA
                  accentColor: bhumiColor,
                  isSpeaking: _isSpeaking,
                  onSpeak: _speakPali,
                ),

                const SizedBox(height: 16),

                // ── Info chips ───────────────────────────────────────────
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _InfoChip(
                      label: citta.vedana.localizedName(context.l10n),
                      icon: _getVedanaSymbol(citta.vedana),
                      color: _getVedanaColor(citta.vedana),
                    ),
                    _InfoChip(
                      label: citta.function.localizedName(context.l10n),
                      icon: '⚙',
                      color: VdpColors.primaryLight,
                    ),
                    _InfoChip(
                      label: citta.bhumiGroup.localizedName(context.l10n),
                      icon: citta.bhumiGroup.name.bhumiSymbol,
                      color: bhumiColor,
                    ),
                  ],
                ),

                // ── Ghi chú giáo lý ─────────────────────────────────────
                if (localizedDoctrine != null) ...[
                  const SizedBox(height: 16),
                  _SectionTitle('📖 ${context.l10n.doctrine}'),
                  Text(
                    localizedDoctrine,
                    style: const TextStyle(fontSize: 14, height: 1.6),
                  ),
                ],

                // ── Ví dụ ───────────────────────────────────────────────
                if (localizedExamples.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  _SectionTitle('💡 ${context.l10n.examples}'),
                  ...localizedExamples.map((ex) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Expanded(
                                child: Text(ex,
                                    style: const TextStyle(fontSize: 14))),
                          ],
                        ),
                      )),
                ],

                // ── Tâm Sở Cố Định ───────────────────────────────────────
                const SizedBox(height: 16),
                _SectionTitle('✦ ${context.l10n.fixedCetasikasCount(alwaysAssocs.length)}'),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: alwaysAssocs.map((assoc) {
                    final cs = cetasikas
                        .where((c) => c.id == assoc.cetasikaId)
                        .firstOrNull;
                    return _CetasikaChip(
                      label: cs?.localizedShortName(context) ?? assoc.cetasikaId,
                      type: AssociationType.always,
                    );
                  }).toList(),
                ),

                // ── Tâm Sở Bất Định ──────────────────────────────────────
                if (sometimesAssocs.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  _SectionTitle(
                    '◎ ${context.l10n.variableCetasikasCount(sometimesAssocs.length)}',
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: sometimesAssocs.map((assoc) {
                      final cs = cetasikas
                          .where((c) => c.id == assoc.cetasikaId)
                          .firstOrNull;
                      return _CetasikaChip(
                        label: cs?.localizedShortName(context) ?? assoc.cetasikaId,
                        type: AssociationType.sometimes,
                        note: assoc.note,
                      );
                    }).toList(),
                  ),
                ],

                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  // ─── Note Editor ──────────────────────────────────────────────────────────

  void _showNoteEditor(BuildContext context, CittaModel citta) {
    final noteKey = 'citta_${citta.id}';
    final noteController = TextEditingController(
        text: ref.read(progressProvider).personalNotes[noteKey] ?? '');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.personalNote),
        content: TextField(
          controller: noteController,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: context.l10n.personalNoteHint,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(context.l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(progressProvider.notifier)
                  .saveNote(noteKey, noteController.text);
              Navigator.pop(ctx);
            },
            child: Text(context.l10n.save),
          ),
        ],
      ),
    );
  }

  // ─── Label helpers ────────────────────────────────────────────────────────

  String _getVedanaSymbol(Vedana vedana) {
    switch (vedana) {
      case Vedana.pleasant:
        return VdpSymbols.pleasant;
      case Vedana.unpleasant:
        return VdpSymbols.unpleasant;
      case Vedana.neutral:
        return VdpSymbols.neutral;
      case Vedana.joy:
        return VdpSymbols.joy;
    }
  }

  Color _getVedanaColor(Vedana vedana) {
    switch (vedana) {
      case Vedana.pleasant:
        return VdpColors.pleasant;
      case Vedana.unpleasant:
        return VdpColors.unpleasant;
      case Vedana.neutral:
        return VdpColors.neutral;
      case Vedana.joy:
        return VdpColors.joy;
    }
  }

}

// ─── Shared Widgets ──────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final String icon;
  final Color color;

  const _InfoChip(
      {required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        '$icon $label',
        style:
            TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _CetasikaChip extends StatelessWidget {
  final String label;
  final AssociationType type;
  final String? note;

  const _CetasikaChip({required this.label, required this.type, this.note});

  @override
  Widget build(BuildContext context) {
    final color =
        type == AssociationType.always ? VdpColors.always : VdpColors.sometimes;
    final symbol = type == AssociationType.always
        ? VdpSymbols.always
        : VdpSymbols.sometimes;

    return Tooltip(
      message: (!context.usesEnglishContent ? note : null) ??
          (type == AssociationType.always
              ? context.l10n.alwaysAssociated
              : context.l10n.mayBeAssociated),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.withOpacity(0.5)),
        ),
        child: Text(
          '$symbol $label',
          style: TextStyle(fontSize: 12, color: VdpColors.onBackground),
        ),
      ),
    );
  }
}
