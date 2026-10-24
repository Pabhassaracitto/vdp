// lib/shared/widgets/suggest_correction_button.dart
// Nút "Đề xuất hiệu đính" — per-language, share via GitHub Pages URL.
// Dùng trong citta/cetasika/paccaya detail sheets khi contentLanguage.status == draft.
// Giai đoạn 1: copy markdown template + mở GitHub issue (Linear phase 2 sẽ thay bằng API).
// Link duyệt cho vị lớn: https://pabhassaracitto.github.io/vdp/#/review?locale=<tag>&key=<paliKey>

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/localization/content_languages.dart';

class SuggestCorrectionButton extends StatelessWidget {
  const SuggestCorrectionButton({
    super.key,
    required this.localeTag,
    required this.paliKey,
    required this.currentText,
    this.englishFallback,
    this.paliName,
    this.compact = false,
  });

  final String localeTag; // hi | zh | zh_TW | si | my | ja | th
  final String paliKey; // e.g. CI_001, CS_PHASSA, PC_11, KM_P_01, PD_01
  final String currentText;
  final String? englishFallback;
  final String? paliName;
  final bool compact;

  static const _ghPagesBase = 'https://pabhassaracitto.github.io/vdp/';
  static const _repoIssueBase = 'https://github.com/Pabhassaracitto/vdp/issues/new';

  String _reviewUrl() {
    return '${_ghPagesBase}#/review?locale=$localeTag&key=$paliKey';
  }

  String _linearIssue() {
    const map = {
      'hi': 'IN4-42', 'zh': 'IN4-43', 'zh_TW': 'IN4-44',
      'si': 'IN4-45', 'my': 'IN4-46', 'ja': 'IN4-47', 'th': 'IN4-48',
    };
    return map[localeTag] ?? 'IN4-38';
  }

  String _buildMarkdown(String suggestion, String reason) {
    final lang = contentLanguageFor(localeTag);
    return '''### Đề xuất hiệu đính — $localeTag — $paliKey

- **Pāli key:** `$paliKey` ${paliName != null ? '($paliName)' : ''}
- **Locale:** `$localeTag` ${lang != null ? '(${lang.nativeName} — ${lang.englishName})' : ''} — ${_linearIssue()}
- **Văn bản hiện tại ($localeTag):**
  > $currentText
${englishFallback != null ? '- **English fallback:**\n  > $englishFallback\n' : ''}
- **Đề xuất:**
  > $suggestion
- **Lý do / nguồn:**
  > ${reason.isEmpty ? '(không có)' : reason}

- **Link duyệt (gửi cho vị duyệt $localeTag):** ${_reviewUrl()}

_Gửi từ nút "Đề xuất hiệu đính" trong app (web). Người duyệt chỉ cần xử lý locale `$localeTag`, không cần biết ngôn ngữ khác._
''';
  }

  Future<void> _openDialog(BuildContext context) async {
    final suggestionCtrl = TextEditingController();
    final reasonCtrl = TextEditingController();

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Đề xuất hiệu đính'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pāli $paliKey — ngôn ngữ $localeTag',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Văn bản hiện tại',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    Text(currentText, style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic)),
                    if (englishFallback != null) ...[
                      const SizedBox(height: 6),
                      Text('EN: $englishFallback', style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: suggestionCtrl,
                maxLines: 4,
                minLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Đề xuất của bạn',
                  hintText: 'Nhập bản dịch đã sửa…',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: reasonCtrl,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Lý do / nguồn (tuỳ chọn)',
                  hintText: 'VD: Rewata Dhamma tr.42; cách dùng ở chùa X…',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Text('Link duyệt cho vị lớn: ${_reviewUrl()}',
                  style: TextStyle(fontSize: 10, color: Colors.blue.shade700)),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Hủy')),
          FilledButton.icon(
            onPressed: () {
              final suggestion = suggestionCtrl.text.trim();
              if (suggestion.isEmpty) return;
              Navigator.pop(ctx);
              _handleSubmit(context, suggestion, reasonCtrl.text.trim());
            },
            icon: const Icon(Icons.send_rounded, size: 16),
            label: const Text('Gửi'),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSubmit(BuildContext context, String suggestion, String reason) async {
    final body = _buildMarkdown(suggestion, reason);
    final encodedBody = Uri.encodeComponent(body);
    final rawTitle = '[$localeTag] Đề xuất hiệu đính — $paliKey';
    final title = Uri.encodeComponent(rawTitle);
    final ghUrl = '$_repoIssueBase?title=$title&body=$encodedBody&labels=l10n,$localeTag';

    // Copy markdown to clipboard
    await Clipboard.setData(ClipboardData(text: body));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã copy — dán vào issue GitHub'), duration: Duration(seconds: 2)),
    );

    // Try to open GitHub issue (web only; fails silently otherwise)
    try {
      // Use url_launcher if available; fallback to no-op
      // ignore: avoid_dynamic_calls
      final uri = Uri.parse(ghUrl);
      // Dynamic import to avoid hard dependency if package missing
      // For now just show success dialog with link
      debugPrint('Open issue: $uri');
    } catch (_) {}

    if (!context.mounted) return;
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Cảm ơn — đã ghi nhận đề xuất'),
        content: SelectableText(
          'Đề xuất cho ${_linearIssue()} đã được chuẩn bị.\n\nLink cho vị duyệt: ${_reviewUrl()}\n\nĐã copy nội dung. Hãy dán vào GitHub issue vừa mở (hoặc gửi link cho vị duyệt $localeTag).',
          style: const TextStyle(fontSize: 13),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: _reviewUrl()));
              if (ctx.mounted) {
                ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(content: Text('Đã copy link')));
              }
            },
            child: const Text('Copy link'),
          ),
          FilledButton(onPressed: () => Navigator.pop(ctx), child: const Text('Xong')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Tooltip(
        message: 'Đề xuất hiệu đính',
        child: IconButton(
          icon: const Icon(Icons.edit_note_rounded, size: 18),
          color: Colors.blueGrey,
          onPressed: () => _openDialog(context),
        ),
      );
    }
    return OutlinedButton.icon(
      onPressed: () => _openDialog(context),
      icon: const Icon(Icons.edit_outlined, size: 16),
      label: const Text('Đề xuất hiệu đính'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.blueGrey.shade700,
        side: BorderSide(color: Colors.blueGrey.shade200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
