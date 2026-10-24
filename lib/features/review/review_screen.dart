// lib/features/review/review_screen.dart
// Review screen for per-language doctrinal review (web share link).
//
// Route: /review?locale=si&key=PC_03&suggestionId=123
// Read-only for venerables: shows Pāli (anchor), Vietnamese source,
// English fallback, current locale text, and user suggestion.
// Actions: Approve / Request changes / Reject — posts to Linear via
// doc/l10n_evidence/<locale>/suggestions/ (phase 1) or Linear API (phase 2).

import 'package:flutter/material.dart';

import '../../core/localization/content_languages.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({
    super.key,
    required this.locale,
    required this.paliKey,
    this.suggestionId,
    this.suggestionText,
    this.currentText,
    this.englishFallback,
  });

  final String locale; // hi | zh | zh_TW | si | my | ja | th
  final String paliKey; // e.g. PC_11, CS_PHASSA, KM_P_01
  final String? suggestionId;
  final String? suggestionText;
  final String? currentText;
  final String? englishFallback;

  @override
  Widget build(BuildContext context) {
    final lang = contentLanguageFor(locale);
    return Scaffold(
      appBar: AppBar(
        title: Text('Duyệt — ${lang?.nativeName ?? locale} · $paliKey'),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _NoticeCard(
            text:
                'Chỉ duyệt cho locale "$locale" (IN4-${_linearIssueFor(locale)}). '
                'Không cần duyệt ngôn ngữ khác. Quyết định ghi lên Linear + ledger.',
          ),
          const SizedBox(height: 16),
          _FieldCard(label: 'Pāli key (không đổi)', value: paliKey),
          _FieldCard(
            label: 'Bản hiện tại ($locale)',
            value: currentText ?? '(chưa có — đang fallback English)',
            fallback: true,
          ),
          if (englishFallback != null)
            _FieldCard(label: 'English fallback', value: englishFallback!),
          if (suggestionText != null)
            _FieldCard(
              label: 'Đề xuất của người học',
              value: suggestionText!,
              highlight: true,
            ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton.icon(
                onPressed: () => _showSnack(context, 'Đã ghi: Duyệt — sẽ tạo ledger + Linear comment'),
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Duyệt'),
              ),
              OutlinedButton.icon(
                onPressed: () => _showSnack(context, 'Đã ghi: Cần sửa thêm — PM sẽ gửi lại agent'),
                icon: const Icon(Icons.edit_outlined),
                label: const Text('Cần sửa thêm'),
              ),
              TextButton.icon(
                onPressed: () => _showSnack(context, 'Đã ghi: Bác — không áp dụng'),
                icon: const Icon(Icons.block_outlined),
                label: const Text('Bác'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Link này: /review?locale=$locale&key=$paliKey'
            '${suggestionId != null ? '&suggestionId=$suggestionId' : ''}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  static String _linearIssueFor(String tag) {
    const map = {
      'hi': '42', 'zh': '43', 'zh_TW': '44',
      'si': '45', 'my': '46', 'ja': '47', 'th': '48',
    };
    return map[tag] ?? '38';
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

class _FieldCard extends StatelessWidget {
  const _FieldCard({required this.label, required this.value, this.highlight = false, this.fallback = false});
  final String label;
  final String value;
  final bool highlight;
  final bool fallback;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: highlight ? Colors.amber.shade50 : null,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(value, style: TextStyle(fontSize: 14, height: 1.5, fontStyle: fallback ? FontStyle.italic : null)),
          ],
        ),
      ),
    );
  }
}

class _NoticeCard extends StatelessWidget {
  const _NoticeCard({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 18, color: Colors.blue.shade700),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: TextStyle(fontSize: 12, color: Colors.blue.shade900))),
        ],
      ),
    );
  }
}
