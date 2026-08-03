// lib/features/study/module_detail_screen.dart
// Module Detail — Dynamic Content từ VdpRepository
// Fix: Hỗ trợ đầy đủ Tâm/Tâm Sở/Nghiệp/Duyên Khởi/Sắc Pháp/Lộ Trình
// Nguồn gốc lỗi "chưa đủ dữ liệu" là do M6,M8,M9,M10 không có citta/cetasikaIds → đã bổ sung trong study_module.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/vdp_theme.dart';
import '../../data/models/cetasika_model.dart';
import '../../data/models/citta_model.dart';
import '../../data/models/kamma_model.dart';
import '../../data/models/paticca_model.dart';
import '../../data/models/rupa_model.dart';
import '../../data/models/study_module.dart';
import '../../data/models/vithi_model.dart';
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

    final moduleCittas = _filterByIds<CittaModel>(
      all: dataState.cittas,
      ids: widget.moduleData.cittaIds,
      getId: (c) => c.id,
    );
    final moduleCetasikas = _filterByIds<CetasikaModel>(
      all: dataState.cetasikas,
      ids: widget.moduleData.cetasikaIds,
      getId: (c) => c.id,
    );
    final moduleKammas = _filterByIds<KammaModel>(
      all: dataState.kammas,
      ids: widget.moduleData.kammaIds,
      getId: (k) => k.id,
    );
    final modulePaticcas = _filterByIds<PaticcaModel>(
      all: dataState.paticcas,
      ids: widget.moduleData.paticcaIds,
      getId: (p) => p.id,
    );
    final moduleRupas = _filterByIds<RupaModel>(
      all: dataState.rupas,
      ids: widget.moduleData.rupaIds,
      getId: (r) => r.id,
    );
    final moduleVithis = _filterByIds<VithiModel>(
      all: dataState.vithis,
      ids: widget.moduleData.vithiIds,
      getId: (v) => v.id,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        foregroundColor: Colors.white,
        title: Text(widget.moduleData.title, style: const TextStyle(fontSize: 16)),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: const [
            Tab(text: 'Học', icon: Icon(Icons.menu_book, size: 18)),
            Tab(text: 'Ôn Tập', icon: Icon(Icons.visibility_off_rounded, size: 18)),
            Tab(text: 'Kiểm Tra', icon: Icon(Icons.quiz_rounded, size: 18)),
          ],
        ),
      ),
      body: dataState.status == DataLoadStatus.loading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                _StudyTab(
                  module: widget.moduleData,
                  cittas: moduleCittas,
                  cetasikas: moduleCetasikas,
                  kammas: moduleKammas,
                  paticcas: modulePaticcas,
                  rupas: moduleRupas,
                  vithis: moduleVithis,
                ),
                _BlurRevealTab(
                  module: widget.moduleData,
                  cittas: moduleCittas,
                  cetasikas: moduleCetasikas,
                  kammas: moduleKammas,
                  paticcas: modulePaticcas,
                  rupas: moduleRupas,
                  vithis: moduleVithis,
                  revealedItems: _revealedItems,
                  onReveal: (id) => setState(() => _revealedItems.add(id)),
                  onResetAll: () => setState(() => _revealedItems.clear()),
                ),
                _QuizTab(module: widget.moduleData),
              ],
            ),
    );
  }

  static List<T> _filterByIds<T>({
    required List<T> all,
    required List<String> ids,
    required String Function(T) getId,
  }) {
    if (ids.isEmpty) return const [];
    final lookup = {for (final e in all) getId(e): e};
    return ids.map((id) => lookup[id]).whereType<T>().toList();
  }
}

// ─── Tab 1: Study ────────────────────────────────────────────────────────────

class _StudyTab extends StatelessWidget {
  final StudyModule module;
  final List<CittaModel> cittas;
  final List<CetasikaModel> cetasikas;
  final List<KammaModel> kammas;
  final List<PaticcaModel> paticcas;
  final List<RupaModel> rupas;
  final List<VithiModel> vithis;

  const _StudyTab({
    required this.module,
    required this.cittas,
    required this.cetasikas,
    required this.kammas,
    required this.paticcas,
    required this.rupas,
    required this.vithis,
  });

  @override
  Widget build(BuildContext context) {
    final color = Color(module.colorCode);
    final hasContent = cittas.isNotEmpty ||
        cetasikas.isNotEmpty ||
        kammas.isNotEmpty ||
        paticcas.isNotEmpty ||
        rupas.isNotEmpty ||
        vithis.isNotEmpty;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _ModuleHeaderCard(module: module, color: color),
        const SizedBox(height: 20),
        if (!hasContent) ...[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(Icons.info_outline_rounded, size: 48, color: color.withOpacity(0.4)),
                  const SizedBox(height: 12),
                  const Text(
                    'Module này chưa cấu hình đủ dữ liệu.\nVui lòng kiểm tra kStudyModules hoặc assets/data/',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ] else ...[
          if (cittas.isNotEmpty) ...[
            _SectionHeader('Tâm (Citta) — ${cittas.length} tâm', color),
            ...cittas.map((c) => _CittaStudyCard(citta: c, color: color)),
            const SizedBox(height: 16),
          ],
          if (cetasikas.isNotEmpty) ...[
            _SectionHeader('Tâm Sở (Cetasika) — ${cetasikas.length} tâm sở', color),
            ...cetasikas.map((cs) => _CetasikaStudyCard(cetasika: cs, color: color)),
            const SizedBox(height: 16),
          ],
          if (kammas.isNotEmpty) ...[
            _SectionHeader('Nghiệp (Kamma) — ${kammas.length} loại', color),
            ...kammas.map((k) => _KammaStudyCard(kamma: k, color: color)),
            const SizedBox(height: 16),
          ],
          if (paticcas.isNotEmpty) ...[
            _SectionHeader('Duyên Khởi (Paṭicca) — ${paticcas.length} chi', color),
            ...paticcas.map((p) => _PaticcaStudyCard(paticca: p, color: color)),
            const SizedBox(height: 16),
          ],
          if (rupas.isNotEmpty) ...[
            _SectionHeader('Sắc Pháp (Rūpa) — ${rupas.length} sắc', color),
            ...rupas.map((r) => _RupaStudyCard(rupa: r, color: color)),
            const SizedBox(height: 16),
          ],
          if (vithis.isNotEmpty) ...[
            _SectionHeader('Lộ Trình Tâm (Vīthi) — ${vithis.length} lộ', color),
            ...vithis.map((v) => _VithiStudyCard(vithi: v, color: color)),
          ],
        ],
        const SizedBox(height: 40),
      ],
    );
  }
}

// ─── Tab 2: Blur/Reveal ───────────────────────────────────────────────────────

class _BlurRevealTab extends StatelessWidget {
  final StudyModule module;
  final List<CittaModel> cittas;
  final List<CetasikaModel> cetasikas;
  final List<KammaModel> kammas;
  final List<PaticcaModel> paticcas;
  final List<RupaModel> rupas;
  final List<VithiModel> vithis;
  final Set<String> revealedItems;
  final void Function(String) onReveal;
  final VoidCallback onResetAll;

  const _BlurRevealTab({
    required this.module,
    required this.cittas,
    required this.cetasikas,
    required this.kammas,
    required this.paticcas,
    required this.rupas,
    required this.vithis,
    required this.revealedItems,
    required this.onReveal,
    required this.onResetAll,
  });

  @override
  Widget build(BuildContext context) {
    final color = Color(module.colorCode);
    final allItems = <_RecallItem>[
      ...cetasikas.map((cs) => _RecallItem(
            id: 'cs_${cs.id}',
            hint: cs.symbol,
            question: 'Tâm Sở "${cs.nameVietnamese}" (${cs.namePali}) có nghĩa là gì?',
            answer: '${cs.descriptionVi}\nNhóm: ${_getGroupName(cs.group)}',
          )),
      ...cittas.map((c) => _RecallItem(
            id: 'ci_${c.id}',
            hint: _getBhumiSymbol(c.bhumiGroup),
            question: 'Tâm "${c.nameVietnamese}" thuộc nhóm nào và có thọ gì?',
            answer: 'Cõi: ${_getBhumiName(c.bhumiGroup)}\nThọ: ${_getVedanaName(c.vedana)}\nPāḷi: ${c.namePali}',
          )),
      ...kammas.map((k) => _RecallItem(
            id: 'km_${k.id}',
            hint: '⚖️',
            question: 'Nghiệp "${k.nameVietnamese}" (${k.namePali}) có ý nghĩa gì?',
            answer: '${k.descriptionVi}\nNhóm: ${_getKammaGroup(k)}',
          )),
      ...paticcas.map((p) => _RecallItem(
            id: 'pd_${p.id}',
            hint: '🔄',
            question: '${p.order}. ${p.nameVietnamese} (${p.namePali}) là gì?',
            answer: '${p.descriptionVi}\nVòng: ${p.vatta.name}, Kiếp: ${p.kiep.name}',
          )),
      ...rupas.map((r) => _RecallItem(
            id: 'rp_${r.id}',
            hint: '🧱',
            question: 'Sắc "${r.nameVietnamese}" (${r.namePali}) thuộc loại nào?',
            answer: '${r.descriptionVi}\nLoại: ${r.type.name} / ${r.subGroup.name}\nNhân: ${r.causes.map((e) => e.name).join(", ")}',
          )),
      ...vithis.map((v) => _RecallItem(
            id: 'vt_${v.id}',
            hint: '📊',
            question: 'Lộ "${v.nameVietnamese}" (${v.namePali}) có đặc điểm gì?',
            answer: '${v.descriptionVi}\nTổng sát-na: ${v.totalSteps}\nCửa: ${v.dvara.name}',
          )),
    ];

    if (allItems.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.visibility_off_rounded, size: 64, color: color.withOpacity(0.3)),
            const SizedBox(height: 16),
            const Text('Module này chưa có nội dung ôn tập.\nHãy quay lại sau!',
                textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 15)),
          ]),
        ),
      );
    }

    final revealedCount = allItems.where((i) => revealedItems.contains(i.id)).length;
    final total = allItems.length;
    final allRevealed = revealedCount == total;

    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
        child: Row(children: [
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                    value: total == 0 ? 0 : revealedCount / total,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 8)),
            const SizedBox(height: 4),
            Text('$revealedCount / $total đã xem',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ])),
          const SizedBox(width: 12),
          TextButton.icon(
              onPressed: revealedCount > 0 ? onResetAll : null,
              icon: const Icon(Icons.refresh_rounded, size: 16),
              label: const Text('Reset', style: TextStyle(fontSize: 12)),
              style: TextButton.styleFrom(foregroundColor: color)),
        ]),
      ),
      if (allRevealed)
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green.shade200)),
            child: Row(children: const [
              Text('🏆', style: TextStyle(fontSize: 20)),
              SizedBox(width: 10),
              Expanded(
                  child: Text('Bạn đã ôn tập tất cả nội dung! Hãy làm Quiz để kiểm tra.',
                      style: TextStyle(fontSize: 13, color: Colors.green)))
            ])),
      Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: allItems.length,
              itemBuilder: (context, i) {
                final item = allItems[i];
                final isRevealed = revealedItems.contains(item.id);
                return _BlurRevealCard(item: item, isRevealed: isRevealed, onReveal: () => onReveal(item.id));
              })),
    ]);
  }

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
  static String _getKammaGroup(KammaModel k) {
    if (k.byTime != null) return 'Thời gian: ${k.byTime!.name}';
    if (k.byFunction != null) return 'Phận sự: ${k.byFunction!.name}';
    if (k.byPriority != null) return 'Ưu tiên: ${k.byPriority!.name}';
    if (k.byResult != null) return 'Quả: ${k.byResult!.name}';
    return 'Nghiệp';
  }
}

class _RecallItem {
  final String id;
  final String hint;
  final String question;
  final String answer;
  const _RecallItem({required this.id, required this.hint, required this.question, required this.answer});
}

class _BlurRevealCard extends StatelessWidget {
  final _RecallItem item;
  final bool isRevealed;
  final VoidCallback onReveal;
  const _BlurRevealCard({required this.item, required this.isRevealed, required this.onReveal});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 2))]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(item.hint, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(item.question,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.4))),
                Icon(isRevealed ? Icons.check_circle_rounded : Icons.lock_outline_rounded,
                    size: 18, color: isRevealed ? Colors.green : Colors.grey.shade400),
              ])),
          const Divider(height: 1),
          AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, anim) => FadeTransition(opacity: anim, child: child),
              child: isRevealed
                  ? Padding(
                      key: const ValueKey('revealed'),
                      padding: const EdgeInsets.all(14),
                      child: Text(item.answer, style: const TextStyle(fontSize: 14, height: 1.6, color: Colors.black87)))
                  : GestureDetector(
                      key: const ValueKey('blurred'),
                      onTap: onReveal,
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                          child: Center(
                              child: ElevatedButton.icon(
                                  onPressed: onReveal,
                                  icon: const Icon(Icons.visibility_rounded, size: 16),
                                  label: const Text('Hiện đáp án'),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: VdpColors.primary,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))))),
                    )),
        ]));
  }
}

// ─── Tab 3: Quiz Entry ────────────────────────────────────────────────────────

class _QuizTab extends StatelessWidget {
  final StudyModule module;
  const _QuizTab({required this.module});

  @override
  Widget build(BuildContext context) {
    final color = Color(module.colorCode);
    final totalItems = module.cittaIds.length +
        module.cetasikaIds.length +
        module.kammaIds.length +
        module.paticcaIds.length +
        module.rupaIds.length +
        module.vithiIds.length;

    return Center(
        child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.quiz_rounded, size: 72, color: color.withOpacity(0.4)),
              const SizedBox(height: 20),
              Text('Kiểm Tra\n${module.title}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text('$totalItems nội dung trong module', style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
              const SizedBox(height: 12),
              const Text('Tối đa 10 câu hỏi trắc nghiệm\nTổng hợp kiến thức trong module này',
                  textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.6)),
              const SizedBox(height: 30),
              SizedBox(
                  width: 220,
                  child: ElevatedButton.icon(
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute<void>(builder: (_) => QuizScreen(module: module))),
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: const Text('Bắt đầu Quiz', style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))))),
            ])));
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
            border: Border.all(color: color.withOpacity(0.25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(module.icon, style: const TextStyle(fontSize: 36)),
            const SizedBox(width: 14),
            Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(module.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              if (module.titlePali.isNotEmpty)
                Text(module.titlePali, style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: color)),
            ])),
          ]),
          if (module.description.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(module.description, style: const TextStyle(fontSize: 14, height: 1.7)),
          ],
          const SizedBox(height: 10),
          Wrap(spacing: 8, runSpacing: 6, children: [
            if (module.cittaIds.isNotEmpty) _StatChip(icon: Icons.psychology_rounded, label: '${module.cittaIds.length} Tâm', color: color),
            if (module.cetasikaIds.isNotEmpty) _StatChip(icon: Icons.auto_awesome_rounded, label: '${module.cetasikaIds.length} Tâm Sở', color: color),
            if (module.kammaIds.isNotEmpty) _StatChip(icon: Icons.balance_rounded, label: '${module.kammaIds.length} Nghiệp', color: color),
            if (module.paticcaIds.isNotEmpty) _StatChip(icon: Icons.loop_rounded, label: '${module.paticcaIds.length} Duyên', color: color),
            if (module.rupaIds.isNotEmpty) _StatChip(icon: Icons.category_rounded, label: '${module.rupaIds.length} Sắc', color: color),
            if (module.vithiIds.isNotEmpty) _StatChip(icon: Icons.timeline_rounded, label: '${module.vithiIds.length} Lộ', color: color),
          ]),
        ]));
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _StatChip({required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600)),
        ]));
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
        child: Text(title,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: color, letterSpacing: 0.2)));
  }
}

// ─── Citta Card ───────────────────────────────────────────────────────────────

class _CittaStudyCard extends ConsumerWidget {
  final CittaModel citta;
  final Color color;
  const _CittaStudyCard({required this.citta, required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBookmarked = ref.watch(progressProvider).bookmarkedCittaIds.contains(citta.id);
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withOpacity(0.2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(citta.nameVietnamese, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              Text(citta.namePali, style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: color)),
            ])),
            IconButton(
                icon: Icon(isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                    color: isBookmarked ? VdpColors.secondary : Colors.grey.shade400, size: 20),
                onPressed: () => ref.read(progressProvider.notifier).toggleCittaBookmark(citta.id),
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero),
            const SizedBox(width: 4),
            IconButton(
                icon: const Icon(Icons.edit_note_rounded, size: 20, color: Colors.grey),
                onPressed: () => _showNoteEditor(context, ref),
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.only(left: 4)),
          ]),
          const SizedBox(height: 6),
          if (citta.doctrinalNote != null && citta.doctrinalNote!.isNotEmpty)
            Text(citta.doctrinalNote!, style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87)),
          const SizedBox(height: 6),
          Wrap(spacing: 6, runSpacing: 4, children: [
            _InfoChip(label: _getVedanaLabel(citta.vedana), color: _getVedanaColor(citta.vedana)),
            _InfoChip(label: _getBhumiLabel(citta.bhumiGroup), color: color),
          ]),
          _NotePreview(itemId: citta.id),
        ]));
  }

  void _showNoteEditor(BuildContext context, WidgetRef ref) {
    final existingNote = ref.read(progressProvider).personalNotes[citta.id] ?? '';
    final controller = TextEditingController(text: existingNote);
    showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
                title: Text('Ghi chú: ${citta.nameVietnamese}'),
                content: TextField(controller: controller, maxLines: 5, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Nhập ghi chú...'), autofocus: true),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(progressProvider.notifier).saveNote(citta.id, controller.text);
                        Navigator.pop(context);
                      },
                      child: const Text('Lưu')),
                ]));
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

// ─── Cetasika Card ────────────────────────────────────────────────────────────

class _CetasikaStudyCard extends ConsumerWidget {
  final CetasikaModel cetasika;
  final Color color;
  const _CetasikaStudyCard({required this.cetasika, required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBookmarked = ref.watch(progressProvider).bookmarkedCetasikaIds.contains(cetasika.id);
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withOpacity(0.2))),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
              child: Text(cetasika.symbol, style: const TextStyle(fontSize: 22))),
          const SizedBox(width: 12),
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(cetasika.nameVietnamese, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                Text(cetasika.namePali, style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: color)),
              ])),
              IconButton(
                  icon: Icon(isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                      color: isBookmarked ? VdpColors.secondary : Colors.grey.shade400, size: 20),
                  onPressed: () => ref.read(progressProvider.notifier).toggleCetasikaBookmark(cetasika.id),
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero),
              IconButton(
                  icon: const Icon(Icons.edit_note_rounded, size: 20, color: Colors.grey),
                  onPressed: () => _showNoteEditor(context, ref),
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.only(left: 4)),
            ]),
            const SizedBox(height: 4),
            Text(cetasika.descriptionVi, style: const TextStyle(fontSize: 13, height: 1.5, color: Colors.black87)),
            const SizedBox(height: 6),
            _InfoChip(label: _getGroupName(cetasika.group), color: color),
            _NotePreview(itemId: cetasika.id),
          ])),
        ]));
  }

  void _showNoteEditor(BuildContext context, WidgetRef ref) {
    final existingNote = ref.read(progressProvider).personalNotes[cetasika.id] ?? '';
    final controller = TextEditingController(text: existingNote);
    showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
                title: Text('Ghi chú: ${cetasika.nameVietnamese}'),
                content: TextField(controller: controller, maxLines: 5, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Nhập ghi chú...'), autofocus: true),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hủy')),
                  ElevatedButton(
                      onPressed: () {
                        ref.read(progressProvider.notifier).saveNote(cetasika.id, controller.text);
                        Navigator.pop(context);
                      },
                      child: const Text('Lưu')),
                ]));
  }

  static String _getGroupName(CetasikaGroup g) => switch (g) {
        CetasikaGroup.sabbacittasadharana => '7 Biến Hành',
        CetasikaGroup.pakinnaka => '6 Biệt Cảnh',
        CetasikaGroup.akusala => '14 Bất Thiện',
        CetasikaGroup.sobhana => '25 Tịnh Hảo',
      };
}

// ─── Kamma Card ───────────────────────────────────────────────────────────────

class _KammaStudyCard extends StatelessWidget {
  final KammaModel kamma;
  final Color color;
  const _KammaStudyCard({required this.kamma, required this.color});

  @override
  Widget build(BuildContext context) {
    final group = () {
      if (kamma.byTime != null) return '⏰ ${kamma.byTime!.name}';
      if (kamma.byFunction != null) return '⚙️ ${kamma.byFunction!.name}';
      if (kamma.byPriority != null) return '🎯 ${kamma.byPriority!.name}';
      if (kamma.byResult != null) return '🌍 ${kamma.byResult!.name}';
      return '⚖️ Nghiệp';
    }();

    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: color.withOpacity(0.05), borderRadius: BorderRadius.circular(10), border: Border.all(color: color.withOpacity(0.2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(kamma.nameVietnamese, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          Text(kamma.namePali, style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: color)),
          const SizedBox(height: 6),
          Text(kamma.descriptionVi, style: const TextStyle(fontSize: 13, height: 1.5)),
          const SizedBox(height: 6),
          Wrap(spacing: 6, children: [
            _InfoChip(label: group, color: color),
            _InfoChip(label: kamma.nameShort, color: Colors.brown),
          ]),
          if (kamma.examples.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text('Ví dụ: ${kamma.examples.first}', style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontStyle: FontStyle.italic)),
          ]
        ]));
  }
}

// ─── Paticca Card ─────────────────────────────────────────────────────────────

class _PaticcaStudyCard extends StatelessWidget {
  final PaticcaModel paticca;
  final Color color;
  const _PaticcaStudyCard({required this.paticca, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: color.withOpacity(0.05), borderRadius: BorderRadius.circular(10), border: Border.all(color: color.withOpacity(0.2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text('${paticca.order}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13))),
            const SizedBox(width: 10),
            Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(paticca.nameVietnamese, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
              Text(paticca.namePali, style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: color)),
            ])),
          ]),
          const SizedBox(height: 8),
          Text(paticca.descriptionVi, style: const TextStyle(fontSize: 13, height: 1.5)),
          const SizedBox(height: 6),
          Wrap(spacing: 6, runSpacing: 4, children: [
            _InfoChip(label: 'Vòng ${paticca.vatta.name}', color: Colors.deepPurple),
            _InfoChip(label: 'Kiếp ${paticca.kiep.name}', color: Colors.teal),
          ]),
        ]));
  }
}

// ─── Rupa Card ────────────────────────────────────────────────────────────────

class _RupaStudyCard extends StatelessWidget {
  final RupaModel rupa;
  final Color color;
  const _RupaStudyCard({required this.rupa, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: color.withOpacity(0.05), borderRadius: BorderRadius.circular(10), border: Border.all(color: color.withOpacity(0.2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(rupa.nameVietnamese, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          Text(rupa.namePali, style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: color)),
          const SizedBox(height: 6),
          Text(rupa.descriptionVi, style: const TextStyle(fontSize: 13, height: 1.5)),
          const SizedBox(height: 6),
          Wrap(spacing: 6, runSpacing: 4, children: [
            _InfoChip(label: rupa.type.name, color: color),
            _InfoChip(label: rupa.subGroup.name, color: Colors.blueGrey),
            ...rupa.causes.map((c) => _InfoChip(label: c.name, color: Colors.orange)),
          ]),
        ]));
  }
}

// ─── Vithi Card ───────────────────────────────────────────────────────────────

class _VithiStudyCard extends StatelessWidget {
  final VithiModel vithi;
  final Color color;
  const _VithiStudyCard({required this.vithi, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: color.withOpacity(0.05), borderRadius: BorderRadius.circular(10), border: Border.all(color: color.withOpacity(0.2))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(vithi.nameVietnamese, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          Text(vithi.namePali, style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: color)),
          const SizedBox(height: 6),
          Text(vithi.descriptionVi, style: const TextStyle(fontSize: 13, height: 1.5)),
          const SizedBox(height: 8),
          Text('Các sát-na:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
          const SizedBox(height: 4),
          ...vithi.steps.take(7).map((s) => Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text('• ${s.stepNumber}. ${s.nameVietnamese} (${s.role.name})',
                  style: const TextStyle(fontSize: 12, height: 1.4)))),
          if (vithi.steps.length > 7)
            Text('... và ${vithi.steps.length - 7} bước nữa', style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
          const SizedBox(height: 6),
          Wrap(spacing: 6, children: [
            _InfoChip(label: '${vithi.totalSteps} sát-na', color: color),
            _InfoChip(label: vithi.dvara.name, color: Colors.indigo),
            _InfoChip(label: vithi.vithiType.name, color: Colors.teal),
          ]),
        ]));
  }
}

// ─── Micro widgets ────────────────────────────────────────────────────────────

class _InfoChip extends StatelessWidget {
  final String label;
  final Color color;
  const _InfoChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration:
            BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withOpacity(0.3))),
        child: Text(label, style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600)));
  }
}

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
                color: Colors.amber.shade50, borderRadius: BorderRadius.circular(6), border: Border.all(color: Colors.amber.shade200)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.sticky_note_2_rounded, size: 14, color: Colors.amber),
              const SizedBox(width: 6),
              Expanded(
                  child: Text(note,
                      style: const TextStyle(fontSize: 12, height: 1.4, color: Colors.black87),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis)),
            ])));
  }
}
