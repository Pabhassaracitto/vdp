// lib/features/detail/cetasika_detail_sheet.dart
// Bottom sheet chi tiết Tâm Sở + hiển thị Conflict Guard

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/cetasika_model.dart';
import '../../core/theme/vdp_theme.dart';

class CetasikaDetailSheet extends ConsumerWidget {
  final CetasikaModel cetasika;
  
  const CetasikaDetailSheet({super.key, required this.cetasika});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              // Handle
              Center(
                child: Container(
                  width: 40, height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              
              // Header
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
              
              // Pali name + IPA
              GestureDetector(
                onLongPress: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        cetasika.ipaTranscription != null
                            ? 'IPA: /${cetasika.ipaTranscription}/'
                            : 'Chưa có phát âm',
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: groupColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: groupColor.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cetasika.namePali,
                              style: const TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (cetasika.ipaTranscription != null)
                              Text(
                                '/${cetasika.ipaTranscription}/',
                                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                              ),
                          ],
                        ),
                      ),
                      const Column(
                        children: [
                          Icon(Icons.volume_up_outlined, size: 20, color: Colors.blue),
                          Text('Giữ để\nnghe', 
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 9, color: Colors.blue)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              // Mô tả
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
              
              // === CONFLICT GUARD SECTION ===
              if (cetasika.conflictRules.isNotEmpty) ...[
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.warning_amber, color: Colors.orange, size: 18),
                    const SizedBox(width: 6),
                    const Text(
                      'Xung Đột Giáo Lý',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${cetasika.conflictRules.length} quy tắc',
                        style: TextStyle(fontSize: 11, color: Colors.orange.shade800),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...cetasika.conflictRules.map((rule) => 
                  _ConflictRuleCard(rule: rule)),
              ],
              
              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }
  
  Color _getGroupColor(CetasikaGroup group) {
    switch (group) {
      case CetasikaGroup.sabbacittasadharana: return VdpColors.sabbacittasadharana;
      case CetasikaGroup.pakinnaka: return VdpColors.pakinnaka;
      case CetasikaGroup.akusala: return VdpColors.cetasikaAkusala;
      case CetasikaGroup.sobhana: return VdpColors.cetasikaSobhana;
    }
  }
  
  String _getGroupName(CetasikaGroup group) {
    switch (group) {
      case CetasikaGroup.sabbacittasadharana: return '7 Tâm Sở Biến Hành';
      case CetasikaGroup.pakinnaka: return '6 Tâm Sở Biệt Cảnh';
      case CetasikaGroup.akusala: return '14 Tâm Sở Bất Thiện';
      case CetasikaGroup.sobhana: return '25 Tâm Sở Tịnh Hảo';
    }
  }
}

class _ConflictRuleCard extends StatelessWidget {
  final ConflictRule rule;
  
  const _ConflictRuleCard({required this.rule});
  
  @override
  Widget build(BuildContext context) {
    final typeColor = _getTypeColor(rule.type);
    final typeLabel = _getTypeLabel(rule.type);
    
    return Semantics(
      label: 'Xung đột loại $typeLabel: ${rule.explanation}',
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: typeColor.withOpacity(0.06),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: typeColor.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: typeColor.withOpacity(0.08),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: typeColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    typeLabel,
                    style: TextStyle(
                      fontSize: 11,
                      color: typeColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Tâm Sở xung đột:',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
              ],
            ),
            const SizedBox(height: 8),
            
            // Conflicting cetasikas
            Wrap(
              spacing: 6,
              children: rule.conflictingIds.map((id) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: typeColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: typeColor.withOpacity(0.4)),
                ),
                child: Text(id, style: TextStyle(fontSize: 12, color: typeColor)),
              )).toList(),
            ),
            const SizedBox(height: 8),
            
            // Explanation
            Text(
              rule.explanation,
              style: const TextStyle(fontSize: 13, height: 1.5),
            ),
            
            if (rule.explanationPali != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  rule.explanationPali!,
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  
  Color _getTypeColor(ConflictType type) {
    switch (type) {
      case ConflictType.pair: return Colors.red.shade700;
      case ConflictType.triple: return Colors.orange.shade700;
      case ConflictType.bhumi: return Colors.purple.shade700;
      case ConflictType.causal: return Colors.blue.shade700;
    }
  }
  
  String _getTypeLabel(ConflictType type) {
    switch (type) {
      case ConflictType.pair: return 'Cặp đôi';
      case ConflictType.triple: return 'Bộ ba';
      case ConflictType.bhumi: return 'Bhumi';
      case ConflictType.causal: return 'Duyên';
    }
  }
}
