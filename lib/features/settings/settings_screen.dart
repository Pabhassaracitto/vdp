// lib/features/settings/settings_screen.dart
// Cài đặt - Accessibility, High Contrast, Reset Progress

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vdp_app/data/models/study_module.dart';

import '../../core/theme/vdp_theme.dart';
import '../../shared/providers/progress_provider.dart';

// Settings state
class AppSettings {
  final bool highContrastMode;
  final bool screenReaderHints;
  final double textScaleFactor;

  const AppSettings({
    this.highContrastMode = false,
    this.screenReaderHints = true,
    this.textScaleFactor = 1.0,
  });

  AppSettings copyWith({
    bool? highContrastMode,
    bool? screenReaderHints,
    double? textScaleFactor,
  }) =>
      AppSettings(
        highContrastMode: highContrastMode ?? this.highContrastMode,
        screenReaderHints: screenReaderHints ?? this.screenReaderHints,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      );
}

final settingsProvider =
    StateProvider<AppSettings>((ref) => const AppSettings());

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final progress = ref.watch(progressProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài Đặt', style: TextStyle(fontSize: 18)),
      ),
      body: ListView(
        children: [
          // App info
          _buildAppHeader(),

          const _SectionDivider('♿ Trợ Năng (Accessibility)'),

          // High contrast
          SwitchListTile(
            title: const Text('Chế độ tương phản cao'),
            subtitle:
                const Text('Tăng độ tương phản màu sắc cho người khó nhìn'),
            value: settings.highContrastMode,
            onChanged: (v) => ref.read(settingsProvider.notifier).state =
                settings.copyWith(highContrastMode: v),
            secondary: const Icon(Icons.contrast),
          ),

          // Screen reader hints
          SwitchListTile(
            title: const Text('Gợi ý trình đọc màn hình'),
            subtitle: const Text('Mô tả chi tiết hơn cho TalkBack / VoiceOver'),
            value: settings.screenReaderHints,
            onChanged: (v) => ref.read(settingsProvider.notifier).state =
                settings.copyWith(screenReaderHints: v),
            secondary: const Icon(Icons.record_voice_over),
          ),

          // Text scale
          const _SectionDivider('🔤 Cỡ Chữ'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tỉ lệ chữ', style: TextStyle(fontSize: 15)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: VdpColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '${(settings.textScaleFactor * 100).round()}%',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: VdpColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: settings.textScaleFactor,
                  min: 0.8,
                  max: 1.5,
                  divisions: 7,
                  label: '${(settings.textScaleFactor * 100).round()}%',
                  activeColor: VdpColors.primary,
                  onChanged: (v) => ref.read(settingsProvider.notifier).state =
                      settings.copyWith(textScaleFactor: v),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('A',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text('A',
                        style: TextStyle(fontSize: 22, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),

          const _SectionDivider('📊 Tiến Độ Học Tập'),

          // Progress summary
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: _ProgressSummary(progress: progress),
          ),

          // Reset progress
          ListTile(
            leading: const Icon(Icons.refresh, color: Colors.orange),
            title: const Text('Đặt lại tiến độ'),
            subtitle: const Text('Xóa toàn bộ dữ liệu học tập'),
            onTap: () => _confirmReset(context, ref),
          ),

          const _SectionDivider('ℹ️ Về Ứng Dụng'),

          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Phiên bản'),
            trailing: Text('1.0.0', style: TextStyle(color: Colors.grey)),
          ),

          const ListTile(
            leading: Icon(Icons.book_outlined),
            title: Text('Nguồn tài liệu'),
            subtitle: Text('Giáo trình King Milanda A — Abhidhamma'),
          ),

          const ListTile(
            leading: Icon(Icons.gavel),
            title: Text('Nguyên tắc biên soạn'),
            subtitle:
                Text('Offline-First · Accuracy-First · Accessibility-First'),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildAppHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [VdpColors.primary, VdpColors.primaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text('☸', style: TextStyle(fontSize: 36)),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vi Diệu Pháp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Abhidhamma Interactive',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _confirmReset(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Đặt lại tiến độ?'),
        content: const Text(
          'Toàn bộ tiến độ học tập và điểm quiz sẽ bị xóa.\n'
          'Hành động này không thể hoàn tác.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(progressProvider.notifier).resetAll();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã đặt lại tiến độ học tập')),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Đặt lại', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  final String title;
  const _SectionDivider(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 6),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.grey.shade600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _ProgressSummary extends StatelessWidget {
  final UserProgress progress;
  const _ProgressSummary({required this.progress});

  @override
  Widget build(BuildContext context) {
    final completed = progress.moduleProgress.values
        .where((m) => m.completionPercentage >= 80)
        .length;
    final pct = (progress.overallProgress * 100).round();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: VdpColors.primary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: VdpColors.primary.withOpacity(0.15)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress.overallProgress,
                  strokeWidth: 6,
                  backgroundColor: Colors.grey.shade200,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(VdpColors.secondary),
                ),
                Text(
                  '$pct%',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: VdpColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$completed / ${progress.moduleProgress.length} module hoàn thành',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              if (progress.lastModuleId != null)
                Text(
                  'Module gần nhất: ${progress.lastModuleId}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              Text(
                'Học lần cuối: ${_formatDate(progress.lastStudied)}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inDays == 0) return 'Hôm nay';
    if (diff.inDays == 1) return 'Hôm qua';
    return '${diff.inDays} ngày trước';
  }
}
