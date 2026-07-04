// lib/features/study/study_screen.dart
// Adaptive Study Engine - Graph-based phi tuyến
// M3-T5B: UI Bookmark & Ghi chú

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/vdp_theme.dart';
import '../../data/models/study_module.dart';
import '../../data/repositories/vdp_repository.dart';
import '../../shared/providers/progress_provider.dart';
import 'module_detail_screen.dart';

// ══════════════════════════════════════════════════════════════════════════════
// STUDY SCREEN (AppBar + Bookmark Sheet)
// ══════════════════════════════════════════════════════════════════════════════

class StudyScreen extends ConsumerWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);
    final bookmarkCount = ref.watch(bookmarkCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Lộ Trình Học', style: TextStyle(fontSize: 18)),
            Text(
              'Adaptive Study Path',
              style: TextStyle(fontSize: 11, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          // ── 🔖 Bookmark Button với Badge ────────────────────────────────
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Badge(
              isLabelVisible: bookmarkCount > 0,
              label: Text(
                '$bookmarkCount',
                style: const TextStyle(fontSize: 10),
              ),
              backgroundColor: VdpColors.secondary,
              child: IconButton(
                icon: const Icon(Icons.bookmark_rounded),
                tooltip: 'Bookmark & Ghi chú',
                onPressed: () => _showBookmarksSheet(context, ref),
              ),
            ),
          ),
          // ── 📊 Progress Button ───────────────────────────────────────────
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

  // ── Mở Bookmark Sheet ────────────────────────────────────────────────────
  void _showBookmarksSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _BookmarksSheet(),
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

// ══════════════════════════════════════════════════════════════════════════════
// BOOKMARK SHEET — Widget chính
// ══════════════════════════════════════════════════════════════════════════════

class _BookmarksSheet extends ConsumerStatefulWidget {
  const _BookmarksSheet();

  @override
  ConsumerState<_BookmarksSheet> createState() => _BookmarksSheetState();
}

class _BookmarksSheetState extends ConsumerState<_BookmarksSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    final progress = ref.watch(progressProvider);
    final notifier = ref.read(progressProvider.notifier);
    final bookmarkCount = ref.watch(bookmarkCountProvider);

    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.82,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // ── Handle bar ──────────────────────────────────────────────────
          Container(
            width: 44,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // ── Header ──────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: VdpColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.bookmark_rounded,
                    color: VdpColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bookmark & Ghi chú',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: VdpColors.onBackground,
                        ),
                      ),
                      Text(
                        '$bookmarkCount mục đã lưu',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: Colors.grey.shade400),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // ── TabBar ──────────────────────────────────────────────────────
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: VdpColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey.shade600,
              labelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              padding: const EdgeInsets.all(4),
              dividerColor: Colors.transparent,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Tâm'),
                      if (progress.bookmarkedCittaIds.isNotEmpty) ...[
                        const SizedBox(width: 4),
                        _MiniCountBadge(
                          count: progress.bookmarkedCittaIds.length,
                        ),
                      ],
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Tâm sở'),
                      if (progress.bookmarkedCetasikaIds.isNotEmpty) ...[
                        const SizedBox(width: 4),
                        _MiniCountBadge(
                          count: progress.bookmarkedCetasikaIds.length,
                        ),
                      ],
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Ghi chú'),
                      if (progress.personalNotes.isNotEmpty) ...[
                        const SizedBox(width: 4),
                        _MiniCountBadge(
                          count: progress.personalNotes.length,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // ── TabBarView ──────────────────────────────────────────────────
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Tab 1: Citta Bookmarks
                _CittaBookmarksList(
                  bookmarkedIds: progress.bookmarkedCittaIds,
                  onRemove: (id) => notifier.toggleCittaBookmark(id),
                  onAddNote: (id) => _showNoteEditor(
                    context,
                    ref,
                    key: 'citta_$id',
                    label: id,
                  ),
                ),

                // Tab 2: Cetasika Bookmarks
                _CetasikaBookmarksList(
                  bookmarkedIds: progress.bookmarkedCetasikaIds,
                  onRemove: (id) => notifier.toggleCetasikaBookmark(id),
                  onAddNote: (id) => _showNoteEditor(
                    context,
                    ref,
                    key: 'cetasika_$id',
                    label: id,
                  ),
                ),

                // Tab 3: Personal Notes
                _NotesList(
                  notes: progress.personalNotes,
                  onEdit: (key, existingNote) => _showNoteEditor(
                    context,
                    ref,
                    key: key,
                    label: key,
                    existingNote: existingNote,
                  ),
                  onDelete: (key) => notifier.deleteNote(key),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// TAB 1: Danh sách Citta đã bookmark
// ══════════════════════════════════════════════════════════════════════════════

class _CittaBookmarksList extends ConsumerWidget {
  final Set<String> bookmarkedIds;
  final void Function(String id) onRemove;
  final void Function(String id) onAddNote;

  const _CittaBookmarksList({
    required this.bookmarkedIds,
    required this.onRemove,
    required this.onAddNote,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (bookmarkedIds.isEmpty) {
      return const _EmptyState(
        icon: Icons.bookmark_border_rounded,
        title: 'Chưa có Tâm nào được bookmark',
        subtitle: 'Vào màn hình học và nhấn 🔖 để lưu lại',
      );
    }

    final cittas = ref.watch(cittasProvider);
    final bookmarked =
        cittas.where((c) => bookmarkedIds.contains(c.id)).toList();

    if (bookmarked.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Text(
            'Đang tải dữ liệu Tâm...',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: bookmarked.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final citta = bookmarked[index];
        return _BookmarkItemCard(
          id: citta.id,
          title: citta.nameVietnamese,
          subtitle: citta.namePali,
          accentColor: VdpColors.primary,
          icon: '🧠',
          onRemove: () => onRemove(citta.id),
          onAddNote: () => onAddNote(citta.id),
        );
      },
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// TAB 2: Danh sách Cetasika đã bookmark
// ══════════════════════════════════════════════════════════════════════════════

class _CetasikaBookmarksList extends ConsumerWidget {
  final Set<String> bookmarkedIds;
  final void Function(String id) onRemove;
  final void Function(String id) onAddNote;

  const _CetasikaBookmarksList({
    required this.bookmarkedIds,
    required this.onRemove,
    required this.onAddNote,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (bookmarkedIds.isEmpty) {
      return const _EmptyState(
        icon: Icons.bookmark_border_rounded,
        title: 'Chưa có Tâm sở nào được bookmark',
        subtitle: 'Vào màn hình học và nhấn 🔖 để lưu lại',
      );
    }

    final cetasikas = ref.watch(cetasikasProvider);
    final bookmarked =
        cetasikas.where((c) => bookmarkedIds.contains(c.id)).toList();

    if (bookmarked.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Text(
            'Đang tải dữ liệu Tâm Sở...',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: bookmarked.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final cetasika = bookmarked[index];
        return _BookmarkItemCard(
          id: cetasika.id,
          title: cetasika.nameVietnamese,
          subtitle: cetasika.namePali,
          accentColor: VdpColors.secondary,
          icon: '💎',
          onRemove: () => onRemove(cetasika.id),
          onAddNote: () => onAddNote(cetasika.id),
        );
      },
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// TAB 3: Danh sách Ghi chú cá nhân
// ══════════════════════════════════════════════════════════════════════════════

class _NotesList extends StatelessWidget {
  final Map<String, String> notes;
  final void Function(String key, String existingNote) onEdit;
  final void Function(String key) onDelete;

  const _NotesList({
    required this.notes,
    required this.onEdit,
    required this.onDelete,
  });

  // Parse key để hiển thị label thân thiện
  // Key format: citta_CI_001  hoặc  cetasika_CS_PHASSA
  String _formatLabel(String key) {
    if (key.startsWith('citta_')) {
      return '🧠 ${key.replaceFirst('citta_', '')}';
    } else if (key.startsWith('cetasika_')) {
      return '💎 ${key.replaceFirst('cetasika_', '')}';
    }
    return key;
  }

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return const _EmptyState(
        icon: Icons.edit_note_rounded,
        title: 'Chưa có ghi chú nào',
        subtitle: 'Nhấn ✏️ trong màn hình học để thêm ghi chú cá nhân',
      );
    }

    final entries = notes.entries.toList();
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: entries.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final entry = entries[index];
        return _NoteItemCard(
          noteKey: entry.key,
          label: _formatLabel(entry.key),
          noteContent: entry.value,
          onEdit: () => onEdit(entry.key, entry.value),
          onDelete: () => _confirmDelete(context, entry.key),
        );
      },
    );
  }

  void _confirmDelete(BuildContext context, String key) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Xóa ghi chú?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        content: const Text(
          'Ghi chú này sẽ bị xóa vĩnh viễn. Bạn có chắc không?',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete(key);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// CARD: Bookmark Item (dùng chung cho Citta & Cetasika)
// ══════════════════════════════════════════════════════════════════════════════

class _BookmarkItemCard extends StatelessWidget {
  final String id;
  final String title;
  final String subtitle;
  final Color accentColor;
  final String icon;
  final VoidCallback onRemove;
  final VoidCallback onAddNote;

  const _BookmarkItemCard({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.accentColor,
    required this.icon,
    required this.onRemove,
    required this.onAddNote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: accentColor.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          // ── Icon ──────────────────────────────────────────────────────
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(icon, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 12),

          // ── Text ──────────────────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: VdpColors.onBackground,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  id,
                  style: TextStyle(
                    fontSize: 10,
                    color: accentColor.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // ── Actions ───────────────────────────────────────────────────
          Column(
            children: [
              _SmallIconButton(
                icon: Icons.edit_note_rounded,
                color: Colors.blueGrey,
                tooltip: 'Thêm ghi chú',
                onTap: onAddNote,
              ),
              const SizedBox(height: 4),
              _SmallIconButton(
                icon: Icons.bookmark_remove_rounded,
                color: Colors.red.shade400,
                tooltip: 'Xóa bookmark',
                onTap: onRemove,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// CARD: Note Item
// ══════════════════════════════════════════════════════════════════════════════

class _NoteItemCard extends StatelessWidget {
  final String noteKey;
  final String label;
  final String noteContent;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _NoteItemCard({
    required this.noteKey,
    required this.label,
    required this.noteContent,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.amber.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header: Label + Actions ────────────────────────────────────
          Row(
            children: [
              const Icon(Icons.sticky_note_2_rounded,
                  size: 16, color: Colors.amber),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.amber.shade800,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _SmallIconButton(
                icon: Icons.edit_rounded,
                color: Colors.blueGrey.shade400,
                tooltip: 'Sửa ghi chú',
                onTap: onEdit,
              ),
              const SizedBox(width: 4),
              _SmallIconButton(
                icon: Icons.delete_outline_rounded,
                color: Colors.red.shade400,
                tooltip: 'Xóa ghi chú',
                onTap: onDelete,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(height: 1),
          const SizedBox(height: 8),

          // ── Note Content ────────────────────────────────────────────────
          Text(
            noteContent,
            style: const TextStyle(
              fontSize: 13,
              color: VdpColors.onBackground,
              height: 1.5,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// NOTE EDITOR DIALOG
// ══════════════════════════════════════════════════════════════════════════════

/// Hàm tiện ích: mở dialog thêm/sửa ghi chú
/// [key]          : "citta_CI_001" hoặc "cetasika_CS_PHASSA"
/// [label]        : Tên hiển thị thân thiện cho user
/// [existingNote] : Nếu null → chế độ thêm mới; nếu có → chế độ sửa
void _showNoteEditor(
  BuildContext context,
  WidgetRef ref, {
  required String key,
  required String label,
  String? existingNote,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => _NoteEditorDialog(
      noteKey: key,
      label: label,
      existingNote: existingNote,
      onSave: (text) {
        ref.read(progressProvider.notifier).saveNote(key, text);
      },
    ),
  );
}

class _NoteEditorDialog extends StatefulWidget {
  final String noteKey;
  final String label;
  final String? existingNote;
  final void Function(String text) onSave;

  const _NoteEditorDialog({
    required this.noteKey,
    required this.label,
    required this.existingNote,
    required this.onSave,
  });

  @override
  State<_NoteEditorDialog> createState() => _NoteEditorDialogState();
}

class _NoteEditorDialogState extends State<_NoteEditorDialog> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _isSaving = false;
  int _charCount = 0;
  static const int _maxChars = 500;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.existingNote ?? '');
    _focusNode = FocusNode();
    _charCount = _controller.text.length;

    _controller.addListener(() {
      setState(() => _charCount = _controller.text.length);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool get _isEditing => widget.existingNote != null;
  bool get _isEmpty => _controller.text.trim().isEmpty;
  bool get _isOverLimit => _charCount > _maxChars;

  Future<void> _handleSave() async {
    if (_isEmpty || _isOverLimit) return;

    setState(() => _isSaving = true);

    await Future.delayed(const Duration(milliseconds: 100));

    widget.onSave(_controller.text.trim());

    if (mounted) {
      setState(() => _isSaving = false);
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle_outline,
                  color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(_isEditing ? 'Đã cập nhật ghi chú' : 'Đã lưu ghi chú'),
            ],
          ),
          backgroundColor: VdpColors.primary,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Dialog Header ──────────────────────────────────────────
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    _isEditing
                        ? Icons.edit_note_rounded
                        : Icons.note_add_rounded,
                    color: Colors.amber.shade700,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _isEditing ? 'Sửa ghi chú' : 'Thêm ghi chú',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: VdpColors.onBackground,
                        ),
                      ),
                      Text(
                        widget.label,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: Colors.grey.shade400),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 16),

            // ── TextField ──────────────────────────────────────────────
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:
                      _isOverLimit ? Colors.red.shade300 : Colors.grey.shade200,
                ),
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                maxLines: 6,
                minLines: 4,
                maxLength: _maxChars + 10,
                buildCounter: (_,
                        {required currentLength,
                        required isFocused,
                        required maxLength}) =>
                    null,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: VdpColors.onBackground,
                ),
                decoration: InputDecoration(
                  hintText: 'Nhập ghi chú của bạn về mục này...\n\n'
                      'Ví dụ: Tâm này xuất hiện trong lúc thiền định khi...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 13,
                    height: 1.6,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(14),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // ── Character count ────────────────────────────────────────
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$_charCount / $_maxChars ký tự',
                style: TextStyle(
                  fontSize: 11,
                  color:
                      _isOverLimit ? Colors.red.shade400 : Colors.grey.shade400,
                  fontWeight:
                      _isOverLimit ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ── Action Buttons ─────────────────────────────────────────
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.grey.shade600,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Hủy'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: (!_isEmpty && !_isOverLimit && !_isSaving)
                        ? _handleSave
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: VdpColors.primary,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: _isSaving
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            _isEditing ? 'Cập nhật' : 'Lưu ghi chú',
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// SHARED WIDGETS — Tái sử dụng nội bộ
// ══════════════════════════════════════════════════════════════════════════════

/// Badge nhỏ hiển thị số lượng trong TabBar
class _MiniCountBadge extends StatelessWidget {
  final int count;
  const _MiniCountBadge({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        color: VdpColors.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '$count',
        style: const TextStyle(
          fontSize: 9,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

/// Nút icon nhỏ tái sử dụng
class _SmallIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String tooltip;
  final VoidCallback onTap;

  const _SmallIconButton({
    required this.icon,
    required this.color,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 16, color: color),
        ),
      ),
    );
  }
}

/// Widget Empty State tái sử dụng
class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _EmptyState({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(icon, size: 36, color: Colors.grey.shade400),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade400,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════════
// EXISTING WIDGETS (giữ nguyên từ bản cũ)
// ══════════════════════════════════════════════════════════════════════════════

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
                decoration: const BoxDecoration(
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
    final isDueForReview = progress.isModuleDueForReview(module);

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
              clipBehavior: Clip.none,
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
                if (isDueForReview)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          color: Colors.orange, shape: BoxShape.circle),
                      child: const Icon(Icons.refresh,
                          size: 10, color: Colors.white),
                    ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    module.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isUnlocked ? VdpColors.onBackground : Colors.grey,
                    ),
                  ),
                  if (isUnlocked && pct > 0)
                    LinearProgressIndicator(
                      value: pct / 100,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      minHeight: 4,
                    ),
                ],
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
          const SizedBox(height: 20),
          _StatRow(
            label: 'Tổng modules',
            value: '${kStudyModules.length}',
          ),
          _StatRow(
            label: 'Cần ôn tập',
            value:
                '${kStudyModules.map((m) => StudyModule.fromJson(m)).where((m) => progress.isModuleDueForReview(m)).length}',
          ),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;
  const _StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}
