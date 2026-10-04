import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_version.dart';
import '../../core/localization/language_settings.dart';
import '../../core/localization/ui_locale_text.dart';
import '../../core/theme/vdp_theme.dart';
import '../../data/models/study_module.dart';
import '../../l10n/l10n.dart';
import '../../shared/providers/progress_provider.dart';
import '../audio/providers/karaoke_settings_provider.dart';

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
          _SectionDivider('🎧 ${context.l10n.karaokeSettingsTitle}'),
          const _KaraokeSettingsSection(),
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
            subtitle: Text(_SettingsUiText.editorialPrinciplesSummary(context)),
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

/// VDP | Audio V1.9.2 §2 — bật/tắt karaoke tô sáng + 2 lớp con, theo đúng yêu
/// cầu: "cho phép cấu hình trong Cài đặt: bật/tắt karaoke, bật/tắt tô dòng,
/// bật/tắt tô từng chữ". Màu tô thật sự áp dụng ở nơi hiển thị (lesson body/
/// Paticca list item) tự theo theme sáng/tối — ở đây chỉ là công tắc.
class _KaraokeSettingsSection extends ConsumerWidget {
  const _KaraokeSettingsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final karaoke = ref.watch(karaokeSettingsProvider);
    final notifier = ref.read(karaokeSettingsProvider.notifier);

    return Column(
      children: [
        SwitchListTile(
          title: Text(context.l10n.karaokeModeTitle),
          subtitle: Text(context.l10n.karaokeModeSubtitle),
          value: karaoke.karaokeEnabled,
          onChanged: notifier.setKaraokeEnabled,
          secondary: const Icon(Icons.lyrics_outlined),
        ),
        SwitchListTile(
          title: Text(context.l10n.karaokeLineHighlightTitle),
          subtitle: Text(context.l10n.karaokeLineHighlightSubtitle),
          value: karaoke.lineHighlightEnabled,
          // Chỉ có ý nghĩa khi bật karaoke tổng — vẫn cho đổi giá trị lưu sẵn
          // (không ép về false) để khi bật lại karaoke, thói quen cũ còn đó.
          onChanged: karaoke.karaokeEnabled ? notifier.setLineHighlightEnabled : null,
          secondary: const Icon(Icons.horizontal_rule_rounded),
        ),
        SwitchListTile(
          title: Text(context.l10n.karaokeWordHighlightTitle),
          subtitle: Text(context.l10n.karaokeWordHighlightSubtitle),
          value: karaoke.wordHighlightEnabled,
          onChanged: karaoke.karaokeEnabled ? notifier.setWordHighlightEnabled : null,
          secondary: const Icon(Icons.text_fields_rounded),
        ),
      ],
    );
  }
}

class _SettingsUiText {
  const _SettingsUiText._();

  static String editorialPrinciplesSummary(BuildContext context) => localizedUiText(
        context,
        const {
          'en': 'Offline-first · Accuracy-first · Accessibility-first',
          'vi': 'Ưu tiên ngoại tuyến · Ưu tiên chính xác · Ưu tiên tiếp cận',
          'zh': '离线优先 · 准确优先 · 无障碍优先',
          'zh_TW': '離線優先 · 準確優先 · 無障礙優先',
          'hi': 'ऑफ़लाइन-प्रथम · शुद्धता-प्रथम · सुलभता-प्रथम',
          'my': 'အော့ဖ်လိုင်းဦးစားပေး · တိကျမှုဦးစားပေး · အသုံးပြုလွယ်ကူမှုဦးစားပေး',
          'si': 'නොබැඳි ප්‍රමුඛ · නිරවද්‍යතා ප්‍රමුඛ · ප්‍රවේශගම්‍යතා ප්‍රමුඛ',
          'ar': 'الأولوية للعمل دون اتصال · الأولوية للدقة · الأولوية لإتاحة الوصول',
          'bn': 'অফলাইন-প্রথম · নির্ভুলতা-প্রথম · অ্যাক্সেসিবিলিটি-প্রথম',
          'bo': 'དྲ་མེད་སྔོན་ལ། · ཡང་དག་པ་སྔོན་ལ། · སྤྱོད་ཐུབ་པ་སྔོན་ལ།',
          'de': 'Offline zuerst · Genauigkeit zuerst · Barrierefreiheit zuerst',
          'es': 'Primero sin conexión · Primero la precisión · Primero la accesibilidad',
          'fr': 'Hors ligne d’abord · Exactitude d’abord · Accessibilité d’abord',
          'id': 'Offline terlebih dahulu · Akurasi terlebih dahulu · Aksesibilitas terlebih dahulu',
          'it': 'Prima offline · Prima accuratezza · Prima accessibilità',
          'ja': 'オフライン優先 · 正確性優先 · アクセシビリティ優先',
          'km': 'អាទិភាពអอฟឡាញ · អាទិភាពភាពត្រឹមត្រូវ · អាទិភាពភាពងាយចូលប្រើ',
          'ko': '오프라인 우선 · 정확성 우선 · 접근성 우선',
          'lo': 'ໃຊ້ອອບລາຍກ່ອນ · ຄວາມຖືກຕ້ອງກ່ອນ · ການເຂົ້າເຖິງກ່ອນ',
          'mn': 'Офлайн нэн тэргүүнд · Нарийвчлал нэн тэргүүнд · Хүртээмж нэн тэргүүнд',
          'mr': 'ऑफलाइन-प्रथम · अचूकता-प्रथम · सुलभता-प्रथम',
          'pt': 'Offline primeiro · Precisão primeiro · Acessibilidade primeiro',
          'ru': 'Сначала офлайн · Сначала точность · Сначала доступность',
          'ta': 'ஆஃப்லைன் முதலில் · துல்லியம் முதலில் · அணுகல்தன்மை முதலில்',
          'te': 'ఆఫ్‌లైన్ మొదట · ఖచ్చితత్వం మొదట · అందుబాటు మొదట',
          'th': 'ออฟไลน์ก่อน · ความถูกต้องก่อน · การเข้าถึงก่อน',
        },
      );
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
