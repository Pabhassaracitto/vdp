// lib/features/study/study_screen.dart
// Adaptive Study Engine - Graph-based phi tuyến

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/vdp_theme.dart';
import '../../data/models/study_module.dart';
import '../../shared/providers/progress_provider.dart';
import 'module_detail_screen.dart';

class StudyScreen extends ConsumerWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Lộ Trình Học', style: TextStyle(fontSize: 18)),
            Text('Adaptive Study Path',
                style: TextStyle(fontSize: 11, color: Colors.white70)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            tooltip: 'Tiến độ tổng quan',
            onPressed: () => _showOverallProgress(context, progress),
          ),
        ],
      ),
      body: Column(
        children: [
          _ProgressSummaryBar(progress: progress),
          _SmartRecommendation(progress: progress),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: _ModuleGraph(progress: progress),
            ),
          ),
        ],
      ),
    );
  }

  void _showOverallProgress(BuildContext context, UserProgress progress) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _OverallProgressSheet(progress: progress),
    );
  }
}

class _ProgressSummaryBar extends StatelessWidget {
  final UserProgress progress;
  const _ProgressSummaryBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    final pct = (progress.overallProgress * 100).round();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [VdpColors.primary, VdpColors.primaryLight],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tiến độ học tập: $pct%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress.overallProgress,
                    backgroundColor: Colors.white24,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        VdpColors.secondary),
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              Text(
                '${progress.moduleProgress.values.where((m) => m.completionPercentage >= 80).length}',
                style: const TextStyle(
                  color: VdpColors.secondary,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                'Module\nhoàn thành',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SmartRecommendation extends ConsumerWidget {
  final UserProgress progress;
  const _SmartRecommendation({required this.progress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allModules = kStudyModules
        .map((m) => StudyModule(
              id: m['id'] as String,
              title: m['title'] as String,
              titlePali: m['titlePali'] as String,
              description: m['description'] as String,
              prerequisiteIds: List<String>.from(m['prerequisiteIds'] ?? []),
              recommendedOrder: m['recommendedOrder'] as int,
              colorCode: m['colorCode'] as int,
              icon: m['icon'] as String,
              isRequired: m['isRequired'] as bool? ?? false,
              phase: m['phase'] as int? ?? 1,
            ))
        .toList();

    final nextModule = allModules
        .where((m) =>
            !progress.moduleProgress.containsKey(m.id) &&
            progress.isModuleUnlocked(m, allModules))
        .toList()
      ..sort((a, b) => a.recommendedOrder.compareTo(b.recommendedOrder));

    if (nextModule.isEmpty) return const SizedBox.shrink();

    final next = nextModule.first;
    final color = Color(next.colorCode);

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Text(next.icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '💡 Nên học tiếp',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
                Text(
                  next.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ModuleDetailScreen(moduleData: next),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Học', style: TextStyle(fontSize: 13)),
          ),
        ],
      ),
    );
  }
}

class _ModuleGraph extends ConsumerWidget {
  final UserProgress progress;
  const _ModuleGraph({required this.progress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phase1 =
        kStudyModules.where((m) => (m['phase'] as int) == 1).toList();
    final phase2 =
        kStudyModules.where((m) => (m['phase'] as int) == 2).toList();
    final phase3 =
        kStudyModules.where((m) => (m['phase'] as int) == 3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        _PhaseSection(
            title: 'Pha 1 — Foundation',
            phase: 1,
            modules: phase1,
            progress: progress),
        const SizedBox(height: 8),
        _PhaseSection(
            title: 'Pha 2 — Causality',
            phase: 2,
            modules: phase2,
            progress: progress),
        const SizedBox(height: 8),
        _PhaseSection(
            title: 'Pha 3 — Mastery',
            phase: 3,
            modules: phase3,
            progress: progress),
      ],
    );
  }
}

class _PhaseSection extends StatelessWidget {
  final String title;
  final int phase;
  final List<Map<String, dynamic>> modules;
  final UserProgress progress;

  const _PhaseSection({
    required this.title,
    required this.phase,
    required this.modules,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: VdpColors.primary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$phase',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: VdpColors.onBackground,
                ),
              ),
            ],
          ),
        ),
        ...modules.map((m) => _ModuleCard(moduleData: m, progress: progress)),
      ],
    );
  }
}

class _ModuleCard extends ConsumerWidget {
  final Map<String, dynamic> moduleData;
  final UserProgress progress;

  const _ModuleCard({required this.moduleData, required this.progress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allModules = kStudyModules
        .map((m) => StudyModule(
              id: m['id'] as String,
              title: m['title'] as String,
              titlePali: m['titlePali'] as String,
              description: m['description'] as String,
              prerequisiteIds: List<String>.from(m['prerequisiteIds'] ?? []),
              recommendedOrder: m['recommendedOrder'] as int,
              colorCode: m['colorCode'] as int,
              icon: m['icon'] as String,
              isRequired: (m['isRequired'] as bool?) ?? false,
              phase: (m['phase'] as int?) ?? 1,
            ))
        .toList();

    final module = allModules.firstWhere((m) => m.id == moduleData['id']);
    final isUnlocked = progress.isModuleUnlocked(module, allModules);
    final modProgress = progress.moduleProgress[module.id];
    final pct = modProgress?.completionPercentage ?? 0;
    final color = Color(module.colorCode);

    return GestureDetector(
      onTap: isUnlocked
          ? () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ModuleDetailScreen(moduleData: module),
                ),
              )
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isUnlocked ? Colors.white : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isUnlocked ? color.withOpacity(0.4) : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isUnlocked
                        ? color.withOpacity(0.12)
                        : Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child:
                      Text(module.icon, style: const TextStyle(fontSize: 22)),
                ),
                if (progress.allModulesUnlocked)
                  const Positioned(
                      right: 0,
                      bottom: 0,
                      child: Icon(Icons.lock_open,
                          size: 14, color: VdpColors.secondary)),
                if (!isUnlocked && !progress.allModulesUnlocked)
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(Icons.lock, size: 18, color: Colors.grey),
                  ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                module.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: isUnlocked ? VdpColors.onBackground : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OverallProgressSheet extends StatelessWidget {
  final UserProgress progress;
  const _OverallProgressSheet({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Text(
            'Tổng Quan Tiến Độ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 140,
            height: 140,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress.overallProgress,
                  strokeWidth: 12,
                  backgroundColor: Colors.grey.shade200,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(VdpColors.secondary),
                ),
                Text(
                  '${(progress.overallProgress * 100).round()}%',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: VdpColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
