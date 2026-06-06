// lib/features/study/module_detail_screen.dart
// Chi tiết Module + Blur/Reveal Active Recall

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/study_module.dart';
import '../../data/repositories/vdp_repository.dart';
import '../../core/theme/vdp_theme.dart';
import '../quiz/quiz_screen.dart';

class ModuleDetailScreen extends ConsumerStatefulWidget {
  final StudyModule moduleData;
  const ModuleDetailScreen({super.key, required this.moduleData});

  @override
  ConsumerState<ModuleDetailScreen> createState() => _ModuleDetailScreenState();
}

class _ModuleDetailScreenState extends ConsumerState<ModuleDetailScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final Set<String> _revealedItems = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Color(widget.moduleData.colorCode);
    final dataState = ref.watch(vdpRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          widget.moduleData.title,
          style: const TextStyle(fontSize: 16),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: const [
            Tab(text: 'Học', icon: Icon(Icons.menu_book, size: 18)),
            Tab(text: 'Ôn Tập', icon: Icon(Icons.visibility_off, size: 18)),
            Tab(text: 'Kiểm Tra', icon: Icon(Icons.quiz, size: 18)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _StudyTab(module: widget.moduleData, dataState: dataState),
          _BlurRevealTab(
            module: widget.moduleData,
            dataState: dataState,
            revealedItems: _revealedItems,
            onReveal: (id) => setState(() => _revealedItems.add(id)),
          ),
          _QuizTab(module: widget.moduleData),
        ],
      ),
    );
  }
}

// ─── Tab 1: Study ────────────────────────────────────────────────────────────

class _StudyTab extends StatelessWidget {
  final StudyModule module;
  final VdpDataState dataState;

  const _StudyTab({required this.module, required this.dataState});

  @override
  Widget build(BuildContext context) {
    final color = Color(module.colorCode);
    final relatedCittas =
        dataState.cittas.where((c) => module.cittaIds.contains(c.id)).toList();
    final relatedCetasikas = dataState.cetasikas
        .where((c) => module.cetasikaIds.contains(c.id))
        .toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Module header card
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: color.withOpacity(0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(module.icon, style: const TextStyle(fontSize: 36)),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          module.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          module.titlePali,
                          style: TextStyle(
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                module.description,
                style: const TextStyle(fontSize: 14, height: 1.7),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Tâm liên quan
        if (relatedCittas.isNotEmpty) ...[
          _SectionHeader('Tâm (Citta) trong Module', color),
          ...relatedCittas
              .map((citta) => _CittaStudyCard(citta: citta, color: color)),
          const SizedBox(height: 12),
        ],

        // Tâm Sở liên quan
        if (relatedCetasikas.isNotEmpty) ...[
          _SectionHeader('Tâm Sở (Cetasika) trong Module', color),
          ...relatedCetasikas
              .map((cs) => _CetasikaStudyCard(cetasika: cs, color: color)),
        ],

        const SizedBox(height: 40),
      ],
    );
  }
}

// ─── Tab 2: Blur/Reveal Active Recall ────────────────────────────────────────

class _BlurRevealTab extends StatelessWidget {
  final StudyModule module;
  final VdpDataState dataState;
  final Set<String> revealedItems;
  final void Function(String) onReveal;

  const _BlurRevealTab({
    required this.module,
    required this.dataState,
    required this.revealedItems,
    required this.onReveal,
  });

  @override
  Widget build(BuildContext context) {
    final cetasikas = dataState.cetasikas
        .where((c) => module.cetasikaIds.contains(c.id))
        .toList();
    final cittas =
        dataState.cittas.where((c) => module.cittaIds.contains(c.id)).toList();

    final allItems = [
      ...cetasikas.map((c) => _RecallItem(
            id: c.id,
            question:
                'Tâm Sở "${c.nameVietnamese}" (${c.namePali}) có nghĩa là gì?',
            answer: c.descriptionVi,
            hint: c.symbol,
          )),
      ...cittas.map((c) => _RecallItem(
            id: c.id,
            question: 'Tâm "${c.nameVietnamese}" thuộc nhóm nào và có thọ gì?',
            answer:
                '${c.bhumiGroup.name.bhumiSymbol} Nhóm: ${c.bhumiGroup.name}\n'
                'Thọ: ${c.vedana.name}\n'
                'Pāḷi: ${c.namePali}',
            hint: c.bhumiGroup.name.bhumiSymbol,
          )),
    ];

    if (allItems.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Text(
            'Module này chưa có nội dung ôn tập.\nHãy quay lại sau!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
        ),
      );
    }

    final revealed = revealedItems.length;
    final total = allItems.length;

    return Column(
      children: [
        // Progress
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: total == 0 ? 0 : revealed / total,
                    backgroundColor: Colors.grey.shade200,
                    minHeight: 8,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '$revealed/$total',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ],
          ),
        ),

        // Cards
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: allItems.length,
            itemBuilder: (context, i) {
              final item = allItems[i];
              final isRevealed = revealedItems.contains(item.id);
              return _BlurRevealCard(
                item: item,
                isRevealed: isRevealed,
                onReveal: () => onReveal(item.id),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _RecallItem {
  final String id;
  final String question;
  final String answer;
  final String hint;
  const _RecallItem({
    required this.id,
    required this.question,
    required this.answer,
    required this.hint,
  });
}

class _BlurRevealCard extends StatelessWidget {
  final _RecallItem item;
  final bool isRevealed;
  final VoidCallback onReveal;

  const _BlurRevealCard({
    required this.item,
    required this.isRevealed,
    required this.onReveal,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label:
          '${item.question}. ${isRevealed ? "Câu trả lời: ${item.answer}" : "Nhấn để xem câu trả lời"}',
      button: !isRevealed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Text(item.hint, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item.question,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Answer (blurred or revealed)
            GestureDetector(
              onTap: isRevealed ? null : onReveal,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isRevealed
                    ? Padding(
                        key: const ValueKey('revealed'),
                        padding: const EdgeInsets.all(14),
                        child: Text(
                          item.answer,
                          style: const TextStyle(fontSize: 14, height: 1.6),
                        ),
                      )
                    : Container(
                        key: const ValueKey('blurred'),
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Blurred placeholder
                            Text(
                              '▓▓▓▓▓▓▓▓ ▓▓▓▓▓ ▓▓▓▓▓▓▓ ▓▓▓▓',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade300,
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: onReveal,
                              icon: const Icon(Icons.visibility, size: 16),
                              label: const Text('Hiện đáp án'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: VdpColors.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Tab 3: Quiz Entry ────────────────────────────────────────────────────────

class _QuizTab extends StatelessWidget {
  final StudyModule module;
  const _QuizTab({required this.module});

  @override
  Widget build(BuildContext context) {
    final color = Color(module.colorCode);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.quiz, size: 72, color: color.withOpacity(0.4)),
            const SizedBox(height: 20),
            Text(
              'Kiểm Tra ${module.title}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              '10 câu hỏi trắc nghiệm\nTổng hợp kiến thức trong module',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.6),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 220,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(module: module),
                  ),
                ),
                icon: const Icon(Icons.play_arrow),
                label:
                    const Text('Bắt đầu Quiz', style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Shared widgets inside this file ─────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  final Color color;
  const _SectionHeader(this.title, this.color);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      );
}

class _CittaStudyCard extends StatelessWidget {
  final dynamic citta;
  final Color color;
  const _CittaStudyCard({required this.citta, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${citta.bhumiGroup.name.bhumiSymbol} ${citta.nameVietnamese}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              citta.namePali,
              style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: color,
              ),
            ),
            if (citta.doctrinalNote != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  citta.doctrinalNote!,
                  style: const TextStyle(
                      fontSize: 13, height: 1.5, color: Colors.black87),
                ),
              ),
          ],
        ),
      );
}

class _CetasikaStudyCard extends StatelessWidget {
  final dynamic cetasika;
  final Color color;
  const _CetasikaStudyCard({required this.cetasika, required this.color});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cetasika.symbol, style: TextStyle(fontSize: 22, color: color)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cetasika.nameVietnamese,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    cetasika.namePali,
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cetasika.descriptionVi,
                    style: const TextStyle(fontSize: 13, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
