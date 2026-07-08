// lib/features/study/module_detail_screen.dart
// Module Detail — Dynamic Content từ VdpRepository
// Milestone 3: Lọc Tâm/Tâm Sở theo ID có trong moduleData (không dùng static)
// Type-safe, null-safe, 0 warnings

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/vdp_theme.dart';
import '../../data/models/cetasika_model.dart';
import '../../data/models/citta_model.dart';
import '../../data/models/study_module.dart';
import '../../data/repositories/vdp_repository.dart';
import '../../shared/providers/progress_provider.dart';
import '../quiz/quiz_screen.dart';

// ─── Screen ───────────────────────────────────────────────────────────────────

class ModuleDetailScreen extends ConsumerStatefulWidget {
  final StudyModule moduleData;
  const ModuleDetailScreen({super.key, required this.moduleData});

  @override
  ConsumerState<ModuleDetailScreen> createState() => _ModuleDetailScreenState();
}

class _ModuleDetailScreenState extends ConsumerState<ModuleDetailScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  /// Tracks revealed items trong Blur/Reveal tab.
  /// Dùng Set để đảm bảo idempotent reveal.
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

    // ── SOURCE OF TRUTH: Lấy data từ repository, lọc theo module IDs ────────
    // watch() để rebuild khi data thay đổi (Offline-First: data load async)
    final dataState = ref.watch(vdpRepositoryProvider);

    // Lọc chỉ các Citta thuộc module này — không dùng toàn bộ DB
    final moduleCittas = _filterCittas(
      allCittas: dataState.cittas,
      ids: widget.moduleData.cittaIds,
    );

    // Lọc chỉ các Cetasika thuộc module này
    final moduleCetasikas = _filterCetasikas(
      allCetasikas: dataState.cetasikas,
      ids: widget.moduleData.cetasikaIds,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        foregroundColor: Colors.white,
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
            Tab(
              text: 'Ôn Tập',
              icon: Icon(Icons.visibility_off_rounded, size: 18),
            ),
            Tab(text: 'Kiểm Tra', icon: Icon(Icons.quiz_rounded, size: 18)),
          ],
        ),
      ),
      body: dataState.status == DataLoadStatus.loading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: Học tập — hiển thị đầy đủ thông tin Tâm/Tâm Sở
                _StudyTab(
                  module: widget.moduleData,
                  cittas: moduleCittas,
                  cetasikas: moduleCetasikas,
                ),
                // Tab 2: Blur/Reveal Active Recall
                _BlurRevealTab(
                  module: widget.moduleData,
                  cittas: moduleCittas,
                  cetasikas: moduleCetasikas,
                  revealedItems: _revealedItems,
                  onReveal: (id) => setState(() => _revealedItems.add(id)),
                  onResetAll: () => setState(() => _revealedItems.clear()),
                ),
                // Tab 3: Quiz entry point
                _QuizTab(module: widget.moduleData),
              ],
            ),
    );
  }

  // ── Filter helpers ─────────────────────────────────────────────────────────

  /// Lọc và giữ thứ tự theo cittaIds trong module (Source of Truth).
  static List<CittaModel> _filterCittas({
    required List<CittaModel> allCittas,
    required List<String> ids,
  }) {
    if (ids.isEmpty) return const [];
    // Dùng Map để lookup O(1), giữ thứ tự từ ids
    final lookup = {for (final c in allCittas) c.id: c};
    return ids
        .map((id) => lookup[id])
        .whereType<CittaModel>() // loại null (ID chưa có trong DB)
        .toList();
  }

  /// Lọc và giữ thứ tự theo cetasikaIds trong module (Source of Truth).
  static List<CetasikaModel> _filterCetasikas({
    required List<CetasikaModel> allCetasikas,
    required List<String> ids,
  }) {
    if (ids.isEmpty) return const [];
    final lookup = {for (final c in allCetasikas) c.id: c};
    return ids
        .map((id) => lookup[id])
        .whereType<CetasikaModel>()
        .toList();
  }
}

// ─── Tab 1: Study ────────────────────────────────────────────────────────────

class _StudyTab extends StatelessWidget {
  final StudyModule module;
  final List<CittaModel> cittas;
  final List<CetasikaModel> cetasikas;

  const _StudyTab({
    required this.module,
    required this.cittas,
    required this.cetasikas,
  });

  @override
  Widget build(BuildContext context) {
    final color = Color(module.colorCode);
    final hasContent = cittas.isNotEmpty || cetasikas.isNotEmpty;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // ── Module Header Card ───────────────────────────────────────────
        _ModuleHeaderCard(module: module, color: color),
        const SizedBox(height: 20),

        // ── Empty state ──────────────────────────────────────────────────
        if (!hasContent) ...[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 48,
                    color: color.withOpacity(0.4),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Module này chưa có dữ liệu Tâm/Tâm Sở.\n'
                    'Vui lòng kiểm tra file JSON.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ] else ...[
          // ── Tâm (Citta) section ───────────────────────────────────────
          if (cittas.isNotEmpty) ...[
            _SectionHeader(
              'Tâm (Citta) trong Module — ${cittas.length} tâm',
              color,
            ),
            ...cittas.map(
              (citta) => _CittaStudyCard(citta: citta, color: color),
            ),
            const SizedBox(height: 16),
          ],

          // ── Tâm Sở (Cetasika) section ─────────────────────────────────
          if (cetasikas.isNotEmpty) ...[
            _SectionHeader(
              'Tâm Sở (Cetasika) trong Module — ${cetasikas.length} tâm sở',
              color,
            ),
            ...cetasikas.map(
              (cs) => _CetasikaStudyCard(cetasika: cs, color: color),
            ),
          ],
        ],

        const SizedBox(height: 40),
      ],
    );
  }
}

// ─── Tab 2: Blur/Reveal Active Recall ────────────────────────────────────────

class _BlurRevealTab extends StatelessWidget {
  final StudyModule module;
  final List<CittaModel> cittas;
  final List<CetasikaModel> cetasikas;
  final Set<String> revealedItems;
  final void Function(String) onReveal;
  final VoidCallback onResetAll;

  const _BlurRevealTab({
    required this.module,
    required this.cittas,
    required this.cetasikas,
    required this.revealedItems,
    required this.onReveal,
    required this.onResetAll,
  });

  @override
  Widget build(BuildContext context) {
    final color = Color(module.colorCode);

    // Xây dựng danh sách recall items từ dữ liệu type-safe
    final allItems = <_RecallItem>[
      // Cetasika items — hỏi về ý nghĩa & nhóm
      ...cetasikas.map(
        (cs) => _RecallItem(
          id: 'cs_${cs.id}',
          hint: cs.symbol,
          question:
              'Tâm Sở "${cs.nameVietnamese}" (${cs.namePali}) có nghĩa là gì?',
          answer: '${cs.descriptionVi}\n'
              'Nhóm: ${_getGroupName(cs.group)}',
        ),
      ),
      // Citta items — hỏi về nhóm, thọ, cõi
      ...cittas.map(
        (c) => _RecallItem(
          id: 'ci_${c.id}',
          hint: _getBhumiSymbol(c.bhumiGroup),
          question:
              'Tâm "${c.nameVietnamese}" thuộc nhóm nào và có thọ gì?',
          answer: 'Cõi: ${_getBhumiName(c.bhumiGroup)}\n'
              'Thọ: ${_getVedanaName(c.vedana)}\n'
              'Pāḷi: ${c.namePali}',
        ),
      ),
    ];

    if (allItems.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.visibility_off_rounded,
                size: 64,
                color: color.withOpacity(0.3),
              ),
              const SizedBox(height: 16),
              const Text(
                'Module này chưa có nội dung ôn tập.\nHãy quay lại sau!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),
        ),
      );
    }

    final revealedCount = allItems
        .where((item) => revealedItems.contains(item.id))
        .length;
    final total = allItems.length;
    final allRevealed = revealedCount == total;

    return Column(
      children: [
        // ── Progress bar + Reset button ───────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: total == 0 ? 0 : revealedCount / total,
                        backgroundColor: Colors.grey.shade200,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(color),
                        minHeight: 8,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$revealedCount / $total đã xem',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              TextButton.icon(
                onPressed: revealedCount > 0 ? onResetAll : null,
                icon: const Icon(Icons.refresh_rounded, size: 16),
                label: const Text('Reset', style: TextStyle(fontSize: 12)),
                style: TextButton.styleFrom(
                  foregroundColor: color,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                ),
              ),
            ],
          ),
        ),

        // ── Completion banner ─────────────────────────────────────────────
        if (allRevealed)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Row(
              children: [
                const Text('🏆', style: TextStyle(fontSize: 20)),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Bạn đã ôn tập tất cả nội dung! Hãy làm Quiz để kiểm tra.',
                    style: TextStyle(fontSize: 13, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),

        // ── Cards list ────────────────────────────────────────────────────
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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

  // Label helpers (type-safe, không dùng .name raw)
  static String _getGroupName(CetasikaGroup g) => switch (g) {
        CetasikaGroup.sabbacittasadharana => '7 Biến Hành',
        CetasikaGroup.pakinnaka => '6 Biệt Cảnh',
        CetasikaGroup.akusala => '14 Bất Thiện',
        CetasikaGroup.sobhana => '25 Tịnh Hảo',
      };

  static String _getVedanaName(Vedana v) => switch (v) {
        Vedana.pleasant => 'Lạc thọ (Sukha)',
        Vedana.unpleasant => 'Khổ thọ (Dukkha)',
        Vedana.neutral => 'Xả thọ (Upekkhā)',
        Vedana.joy => 'Hỷ thọ (Somanassa)',
      };

  static String _getBhumiName(BhumiGroup b) => switch (b) {
        BhumiGroup.akusala => 'Bất Thiện',
        BhumiGroup.ahetuka => 'Vô Nhân',
        BhumiGroup.sobhanaKamavacara => 'Tịnh Hảo Dục Giới',
        BhumiGroup.rupavacara => 'Sắc Giới',
        BhumiGroup.arupavacara => 'Vô Sắc Giới',
        BhumiGroup.lokuttara => 'Siêu Thế',
      };

  static String _getBhumiSymbol(BhumiGroup b) => switch (b) {
        BhumiGroup.akusala => '🔴',
        BhumiGroup.ahetuka => '⚪',
        BhumiGroup.sobhanaKamavacara => '🟢',
        BhumiGroup.rupavacara => '🔵',
        BhumiGroup.arupavacara => '🟣',
        BhumiGroup.lokuttara => '✨',
      };
}

// ─── Recall Item Model ────────────────────────────────────────────────────────

class _RecallItem {
  final String id;
  final String hint;
  final String question;
  final String answer;

  const _RecallItem({
    required this.id,
    required this.hint,
    required this.question,
    required this.answer,
  });
}

// ─── Blur/Reveal Card ─────────────────────────────────────────────────────────

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
      label: '${item.question}. '
          '${isRevealed ? "Câu trả lời: ${item.answer}" : "Nhấn để xem câu trả lời"}',
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
            // Question row
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.hint,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item.question,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                    ),
                  ),
                  // Indicator
                  Icon(
                    isRevealed
                        ? Icons.check_circle_rounded
                        : Icons.lock_outline_rounded,
                    size: 18,
                    color: isRevealed
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                ],
              ),
            ),

            const Divider(height: 1, thickness: 1),

            // Answer — blurred or revealed
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: isRevealed
                  ? Padding(
                      key: const ValueKey('revealed'),
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        item.answer,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                    )
                  : GestureDetector(
                      key: const ValueKey('blurred'),
                      onTap: onReveal,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 18,
                        ),
                        child: Center(
                          child: ElevatedButton.icon(
                            onPressed: onReveal,
                            icon: const Icon(
                              Icons.visibility_rounded,
                              size: 16,
                            ),
                            label: const Text('Hiện đáp án'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: VdpColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
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
    final totalItems =
        module.cittaIds.length + module.cetasikaIds.length;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.quiz_rounded,
              size: 72,
              color: color.withOpacity(0.4),
            ),
            const SizedBox(height: 20),
            Text(
              'Kiểm Tra\n${module.title}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '$totalItems nội dung trong module',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Tối đa 10 câu hỏi trắc nghiệm\n'
              'Tổng hợp kiến thức trong module này',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 220,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => QuizScreen(module: module),
                  ),
                ),
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text(
                  'Bắt đầu Quiz',
                  style: TextStyle(fontSize: 16),
                ),
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

// ─── Shared Widgets ───────────────────────────────────────────────────────────

class _ModuleHeaderCard extends StatelessWidget {
  final StudyModule module;
  final Color color;

  const _ModuleHeaderCard({required this.module, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    if (module.titlePali.isNotEmpty)
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
          if (module.description.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              module.description,
              style: const TextStyle(fontSize: 14, height: 1.7),
            ),
          ],
          const SizedBox(height: 10),
          // Stats row
          Row(
            children: [
              _StatChip(
                icon: Icons.psychology_rounded,
                label: '${module.cittaIds.length} Tâm',
                color: color,
              ),
              const SizedBox(width: 8),
              _StatChip(
                icon: Icons.auto_awesome_rounded,
                label: '${module.cetasikaIds.length} Tâm Sở',
                color: color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _StatChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final Color color;

  const _SectionHeader(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: color,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

// ─── Citta Study Card ─────────────────────────────────────────────────────────

class _CittaStudyCard extends ConsumerWidget {
  final CittaModel citta; // Type-safe: CittaModel thay vì dynamic
  final Color color;

  const _CittaStudyCard({required this.citta, required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBookmarked =
        ref.watch(progressProvider).bookmarkedCittaIds.contains(citta.id);

    return Container(
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      citta.nameVietnamese,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      citta.namePali,
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
              // Bookmark button
              IconButton(
                icon: Icon(
                  isBookmarked
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  color:
                      isBookmarked ? VdpColors.secondary : Colors.grey.shade400,
                  size: 20,
                ),
                onPressed: () => ref
                    .read(progressProvider.notifier)
                    .toggleCittaBookmark(citta.id),
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                tooltip: isBookmarked ? 'Bỏ bookmark' : 'Bookmark',
              ),
              const SizedBox(width: 4),
              // Note button
              IconButton(
                icon: const Icon(
                  Icons.edit_note_rounded,
                  size: 20,
                  color: Colors.grey,
                ),
                onPressed: () => _showNoteEditor(context, ref),
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.only(left: 4),
                tooltip: 'Ghi chú',
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Doctrinal note
          if (citta.doctrinalNote != null && citta.doctrinalNote!.isNotEmpty)
            Text(
              citta.doctrinalNote!,
              style: const TextStyle(
                fontSize: 13,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          const SizedBox(height: 6),
          // Metadata chips
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: [
              _InfoChip(
                label: _getVedanaLabel(citta.vedana),
                color: _getVedanaColor(citta.vedana),
              ),
              _InfoChip(
                label: _getBhumiLabel(citta.bhumiGroup),
                color: color,
              ),
            ],
          ),
          // Personal note preview
          _NotePreview(itemId: citta.id),
        ],
      ),
    );
  }

  void _showNoteEditor(BuildContext context, WidgetRef ref) {
    final existingNote =
        ref.read(progressProvider).personalNotes[citta.id] ?? '';
    final controller = TextEditingController(text: existingNote);

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ghi chú: ${citta.nameVietnamese}'),
        content: TextField(
          controller: controller,
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: 'Nhập ghi chú của bạn...',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(progressProvider.notifier)
                  .saveNote(citta.id, controller.text);
              Navigator.pop(context);
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  static String _getVedanaLabel(Vedana v) => switch (v) {
        Vedana.pleasant => '😊 Lạc thọ',
        Vedana.unpleasant => '😔 Khổ thọ',
        Vedana.neutral => '😐 Xả thọ',
        Vedana.joy => '😄 Hỷ thọ',
      };

  static Color _getVedanaColor(Vedana v) => switch (v) {
        Vedana.pleasant => Colors.green,
        Vedana.unpleasant => Colors.red,
        Vedana.neutral => Colors.grey,
        Vedana.joy => Colors.orange,
      };

  static String _getBhumiLabel(BhumiGroup b) => switch (b) {
        BhumiGroup.akusala => '🔴 Bất Thiện',
        BhumiGroup.ahetuka => '⚪ Vô Nhân',
        BhumiGroup.sobhanaKamavacara => '🟢 Tịnh Hảo DG',
        BhumiGroup.rupavacara => '🔵 Sắc Giới',
        BhumiGroup.arupavacara => '🟣 Vô Sắc Giới',
        BhumiGroup.lokuttara => '✨ Siêu Thế',
      };
}

// ─── Cetasika Study Card ──────────────────────────────────────────────────────

class _CetasikaStudyCard extends ConsumerWidget {
  final CetasikaModel cetasika; // Type-safe: CetasikaModel thay vì dynamic
  final Color color;

  const _CetasikaStudyCard({required this.cetasika, required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBookmarked = ref
        .watch(progressProvider)
        .bookmarkedCetasikaIds
        .contains(cetasika.id);

    return Container(
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
          // Symbol
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              cetasika.symbol,
              style: const TextStyle(fontSize: 22),
            ),
          ),
          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cetasika.nameVietnamese,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            cetasika.namePali,
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Bookmark
                    IconButton(
                      icon: Icon(
                        isBookmarked
                            ? Icons.bookmark_rounded
                            : Icons.bookmark_border_rounded,
                        color: isBookmarked
                            ? VdpColors.secondary
                            : Colors.grey.shade400,
                        size: 20,
                      ),
                      onPressed: () => ref
                          .read(progressProvider.notifier)
                          .toggleCetasikaBookmark(cetasika.id),
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                    ),
                    // Note
                    IconButton(
                      icon: const Icon(
                        Icons.edit_note_rounded,
                        size: 20,
                        color: Colors.grey,
                      ),
                      onPressed: () => _showNoteEditor(context, ref),
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.only(left: 4),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  cetasika.descriptionVi,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                // Group badge
                _InfoChip(
                  label: _getGroupName(cetasika.group),
                  color: color,
                ),
                // Personal note preview
                _NotePreview(itemId: cetasika.id),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showNoteEditor(BuildContext context, WidgetRef ref) {
    final existingNote =
        ref.read(progressProvider).personalNotes[cetasika.id] ?? '';
    final controller = TextEditingController(text: existingNote);

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ghi chú: ${cetasika.nameVietnamese}'),
        content: TextField(
          controller: controller,
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: 'Nhập ghi chú của bạn...',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(progressProvider.notifier)
                  .saveNote(cetasika.id, controller.text);
              Navigator.pop(context);
            },
            child: const Text('Lưu'),
          ),
        ],
      ),
    );
  }

  static String _getGroupName(CetasikaGroup g) => switch (g) {
        CetasikaGroup.sabbacittasadharana => '7 Biến Hành',
        CetasikaGroup.pakinnaka => '6 Biệt Cảnh',
        CetasikaGroup.akusala => '14 Bất Thiện',
        CetasikaGroup.sobhana => '25 Tịnh Hảo',
      };
}

// ─── Shared Micro-widgets ─────────────────────────────────────────────────────

class _InfoChip extends StatelessWidget {
  final String label;
  final Color color;

  const _InfoChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Hiển thị preview ghi chú cá nhân nếu có.
class _NotePreview extends ConsumerWidget {
  final String itemId;
  const _NotePreview({required this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final note = ref.watch(progressProvider).personalNotes[itemId];
    if (note == null || note.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.amber.shade50,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.amber.shade200),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.sticky_note_2_rounded,
              size: 14,
              color: Colors.amber,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                note,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.4,
                  color: Colors.black87,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
