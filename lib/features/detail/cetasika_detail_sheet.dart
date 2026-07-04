// lib/features/detail/cetasika_detail_sheet.dart
// Bottom sheet chi tiết Tâm Sở + hiển thị Conflict Guard

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/vdp_theme.dart';
import '../../core/utils/pali_tts_helper.dart';
import '../../data/models/cetasika_model.dart';
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
          const SnackBar(
            content: Text('Thiết bị không hỗ trợ phát âm TTS.'),
            duration: Duration(seconds: 2),
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
    final groupColor = _getGroupColor(cetasika.group);

    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                          'Tâm Sở ${cetasika.traditionalOrder}',
                          style: TextStyle(fontSize: 11, color: groupColor),
                        ),
                        Text(
                          cetasika.nameVietnamese,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _getGroupName(cetasika.group),
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
                  cetasika.descriptionVi,
                  style: const TextStyle(fontSize: 15, height: 1.7),
                ),
              ),

              // ── Tứ Nghĩa ────────────────────────────────────────────
              if (cetasika.trangThai != null ||
                  cetasika.phanSu != null ||
                  cetasika.thanhTuu != null ||
                  cetasika.nhanGan != null) ...[
                const SizedBox(height: 20),
                const Text(
                  '📖 Tứ Nghĩa',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      if (cetasika.trangThai != null)
                        _buildFourAspectRow(
                            'Đặc tướng', 'Lakkhaṇa', cetasika.trangThai!),
                      if (cetasika.phanSu != null)
                        _buildFourAspectRow(
                            'Phận sự', 'Rasa', cetasika.phanSu!),
                      if (cetasika.thanhTuu != null)
                        _buildFourAspectRow(
                            'Thành tựu', 'Paccupaṭṭhāna', cetasika.thanhTuu!),
                      if (cetasika.nhanGan != null)
                        _buildFourAspectRow(
                            'Nhân gần', 'Padaṭṭhāna', cetasika.nhanGan!),
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
                    const Text(
                      'Xung Đột Giáo Lý',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                        '${cetasika.conflictRules.length} quy tắc',
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

  String _getGroupName(CetasikaGroup group) {
    switch (group) {
      case CetasikaGroup.sabbacittasadharana:
        return 'Tâm Sở Biến Hành';
      case CetasikaGroup.pakinnaka:
        return 'Tâm Sở Biệt Cảnh';
      case CetasikaGroup.akusala:
        return 'Tâm Sở Bất Thiện';
      case CetasikaGroup.sobhana:
        return 'Tâm Sở Tịnh Hảo';
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
          Text(rule.explanation, style: const TextStyle(fontSize: 13)),
          if (rule.explanationPali != null)
            Text(rule.explanationPali!,
                style:
                    const TextStyle(fontSize: 11, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}
