import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';
import 'locale_controller.dart';

class LanguageSettingsSection extends ConsumerWidget {
  const LanguageSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(localeSettingsProvider);
    final currentLanguage = settings.uiLocale == null
        ? context.l10n.systemDefault
        : AppLanguage.fromTag(
              AppLanguage.localeTag(settings.uiLocale!),
            )?.safeDisplayName ??
            context.l10n.systemDefault;

    return Column(
      children: [
        ListTile(
          leading: GestureDetector(
            onLongPress: () => _restoreSystemLanguage(context, ref),
            child: const Icon(Icons.language_rounded),
          ),
          title: Text(context.l10n.interfaceLanguage),
          subtitle: Text(currentLanguage),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => showSafeLanguagePicker(context, ref),
          onLongPress: () => _restoreSystemLanguage(context, ref),
        ),
        ListTile(
          leading: const Icon(Icons.menu_book_rounded),
          title: Text(context.l10n.contentLanguage),
          subtitle: Text(context.l10n.contentLanguageSubtitle),
          trailing: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: settings.contentLocale,
              items: [
                DropdownMenuItem(
                  value: 'vi',
                  child: Text(context.l10n.contentVietnamese),
                ),
                DropdownMenuItem(
                  value: 'en',
                  child: Text(context.l10n.contentEnglish),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  ref
                      .read(localeSettingsProvider.notifier)
                      .setContentLocale(value);
                }
              },
            ),
          ),
        ),
        if (settings.contentLocale == 'en')
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(72, 0, 20, 12),
            child: Text(
              context.l10n.translationReviewNotice,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }

  Future<void> _restoreSystemLanguage(
    BuildContext context,
    WidgetRef ref,
  ) async {
    await ref.read(localeSettingsProvider.notifier).setUiLocale(null);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.restoredSystemLanguage)),
      );
    }
  }
}

class _LanguageSelection {
  final AppLanguage? language;
  final bool systemDefault;

  const _LanguageSelection.language(this.language) : systemDefault = false;
  const _LanguageSelection.system()
      : language = null,
        systemDefault = true;
}

Future<void> showSafeLanguagePicker(
  BuildContext context,
  WidgetRef ref,
) async {
  final selection = await showModalBottomSheet<_LanguageSelection>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => const _LanguagePickerSheet(),
  );
  if (selection == null || !context.mounted) return;

  final displayName = selection.systemDefault
      ? context.l10n.systemDefault
      : selection.language!.safeDisplayName;
  final accepted = await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          icon: const Icon(Icons.language_rounded),
          title: Text(context.l10n.languageChangePreviewTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fixed English recovery text remains readable even if the
              // currently selected locale was accidental.
              const Text(
                'Change interface language?',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(context.l10n.languageChangePreviewBody(displayName)),
              const SizedBox(height: 12),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  displayName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          actions: [
            TextButton.icon(
              onPressed: () => Navigator.pop(dialogContext, false),
              icon: const Icon(Icons.arrow_back),
              label: Text('${context.l10n.cancel} / Cancel'),
            ),
            FilledButton.icon(
              onPressed: () => Navigator.pop(dialogContext, true),
              icon: const Icon(Icons.check),
              label: Text('${context.l10n.apply} / Apply'),
            ),
          ],
        ),
      ) ??
      false;
  if (!accepted || !context.mounted) return;

  final previous = ref.read(localeSettingsProvider).uiLocale;
  await ref.read(localeSettingsProvider.notifier).setUiLocale(
        selection.systemDefault ? null : selection.language!.locale,
      );
  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('✓ ${context.l10n.languageChangedTo(displayName)}'),
      action: SnackBarAction(
        label: '↶ ${context.l10n.undo} / Undo',
        onPressed: () => ref
            .read(localeSettingsProvider.notifier)
            .setUiLocale(previous),
      ),
      duration: const Duration(seconds: 8),
    ),
  );
}

class _LanguagePickerSheet extends StatefulWidget {
  const _LanguagePickerSheet();

  @override
  State<_LanguagePickerSheet> createState() => _LanguagePickerSheetState();
}

class _LanguagePickerSheetState extends State<_LanguagePickerSheet> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final languages = supportedAppLanguages
        .where((language) => language.matches(_query))
        .toList(growable: false);

    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 8, 8),
            child: Row(
              children: [
                const Icon(Icons.language_rounded),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    context.l10n.languagePickerTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  tooltip: context.l10n.close,
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              autofocus: false,
              textDirection: TextDirection.ltr,
              decoration: InputDecoration(
                hintText: context.l10n.languagePickerSearchHint,
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => _query = value),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings_suggest_rounded),
            title: Text('${context.l10n.systemDefault} / System default'),
            subtitle: Text(context.l10n.systemDefaultSubtitle),
            onTap: () => Navigator.pop(
              context,
              const _LanguageSelection.system(),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                final language = languages[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      language.locale.languageCode.toUpperCase(),
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                  title: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(language.safeDisplayName),
                  ),
                  onTap: () => Navigator.pop(
                    context,
                    _LanguageSelection.language(language),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
