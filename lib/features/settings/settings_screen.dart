import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/localization/language_settings.dart';
import '../../core/theme/vdp_theme.dart';
import '../../data/models/study_module.dart';
import '../../l10n/l10n.dart';
import '../../shared/providers/progress_provider.dart';

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
  }) {
    return AppSettings(
      highContrastMode: highContrastMode ?? this.highContrastMode,
      screenReaderHints: screenReaderHints ?? this.screenReaderHints,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
    );
  }
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
        title: Text(
          context.l10n.navSettings,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: ListView(
        children: [
          _buildAppHeader(context),
          _SectionDivider('🌐 ${context.l10n.languageSection}'),
          const LanguageSettingsSection(),
          _SectionDivider('♿ ${context.l10n.settingsAccessibility}'),
          SwitchListTile(
            title: Text(context.l10n.highContrastMode),
            subtitle: Text(context.l10n.highContrastSubtitle),
            value: settings.highContrastMode,
            onChanged: (value) {
              ref.read(settingsProvider.notifier).state =
                  settings.copyWith(highContrastMode: value);
            },
            secondary: const Icon(Icons.contrast),
          ),
          SwitchListTile(
            title: Text(context.l10n.screenReaderHints),
            subtitle: Text(context.l10n.screenReaderHintsSubtitle),
            value: settings.screenReaderHints,
            onChanged: (value) {
              ref.read(settingsProvider.notifier).state =
                  settings.copyWith(screenReaderHints: value);
            },
            secondary: const Icon(Icons.record_voice_over),
          ),
          _SectionDivider('🔤 ${context.l10n.textSize}'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.textScale,
                      style: const TextStyle(fontSize: 15),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
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
                  onChanged: (value) {
                    ref.read(settingsProvider.notifier).state =
                        settings.copyWith(textScaleFactor: value);
                  },
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('A', style: TextStyle(fontSize: 12)),
                    Text('A', style: TextStyle(fontSize: 22)),
                  ],
                ),
              ],
            ),
          ),
          _SectionDivider('📊 ${context.l10n.studyProgress}'),
          SwitchListTile(
            title: Text(context.l10n.unlockAllLessons),
            subtitle: Text(context.l10n.unlockAllLessonsSubtitle),
            value: progress.allModulesUnlocked,
            onChanged: (value) {
              if (value) {
                _confirmUnlockAll(context, ref);
              } else {
                ref
                    .read(progressProvider.notifier)
                    .toggleAllModulesUnlocked(false);
              }
            },
            secondary: const Icon(
              Icons.lock_open,
              color: VdpColors.secondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: _ProgressSummary(progress: progress),
          ),
          ListTile(
            leading: const Icon(Icons.refresh, color: Colors.orange),
            title: Text(context.l10n.resetProgress),
            subtitle: Text(context.l10n.resetProgressSubtitle),
            onTap: () => _confirmReset(context, ref),
          ),
          if (ref.watch(
            progressProvider.notifier.select((notifier) => notifier.warningDismissed),
          ))
            ListTile(
              leading: const Icon(
                Icons.notifications_active,
                color: Colors.orange,
              ),
              title: Text(context.l10n.showDataWarningAgain),
              subtitle: Text(context.l10n.showDataWarningAgainSubtitle),
              onTap: () {
                ref.read(progressProvider.notifier).resetWarningDismissed();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(context.l10n.dataWarningEnabled)),
                );
              },
            ),
          _SectionDivider('ℹ️ ${context.l10n.aboutApp}'),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(context.l10n.version),
            trailing: const Text(
              '0.2.0',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.book_outlined),
            title: Text(context.l10n.sourceMaterial),
            subtitle: Text(context.l10n.sourceMaterialValue),
          ),
          ListTile(
            leading: const Icon(Icons.gavel),
            title: Text(context.l10n.editorialPrinciples),
            subtitle: const Text(
              'Offline-First · Accuracy-First · Accessibility-First',
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildAppHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [VdpColors.primary, VdpColors.primaryLight],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.appName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  context.l10n.appTagline,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _confirmReset(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.l10n.resetProgressQuestion),
        content: Text(context.l10n.resetProgressWarning),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              await ref.read(progressProvider.notifier).resetAll();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(context.l10n.progressResetSuccess)),
                );
              }
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: Text(context.l10n.reset),
          ),
        ],
      ),
    );
  }

  void _confirmUnlockAll(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.l10n.unlockLessonsQuestion),
        content: Text(context.l10n.unlockLessonsWarning),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(context.l10n.keepGuidedPath),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              ref
                  .read(progressProvider.notifier)
                  .toggleAllModulesUnlocked(true);
            },
            child: Text(context.l10n.unlock),
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
      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 6),
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
        .where((module) => module.completionPercentage >= 80)
        .length;
    final percent = (progress.overallProgress * 100).round();

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
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    VdpColors.secondary,
                  ),
                ),
                Text(
                  '$percent%',
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.modulesCompleted(
                    completed,
                    progress.moduleProgress.length,
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (progress.lastModuleId != null)
                  Text(
                    context.l10n.mostRecentModule(progress.lastModuleId!),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                Text(
                  context.l10n.lastStudied(_formatDate(context)),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(BuildContext context) {
    final difference = DateTime.now().difference(progress.lastStudied);
    if (difference.inDays == 0) return context.l10n.today;
    if (difference.inDays == 1) return context.l10n.yesterday;
    return context.l10n.daysAgo(difference.inDays);
  }
}
