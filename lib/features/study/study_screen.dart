// lib/features/study/study_screen.dart
// Adaptive Study Engine - Graph-based phi tuyến
// M3-T5B: UI Bookmark & Ghi chú

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/localization/localized_content.dart';
import '../../core/theme/vdp_theme.dart';
import '../../data/models/lesson_content.dart';
import '../../data/models/study_module.dart';
import '../../data/repositories/vdp_repository.dart';
import '../../l10n/l10n.dart';
import '../../shared/providers/progress_provider.dart';
import 'module_detail_screen.dart';
import '../audio/widgets/continue_listening_card.dart';

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
        title: Column(
          children: [
            Text(context.l10n.studyPath, style: const TextStyle(fontSize: 18)),
            Text(
              context.l10n.appTagline,
              style: const TextStyle(fontSize: 11, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          // ── 🔖 Bookmark Button với Badge ────────────────────────────────
          Padding(
            padding: EdgeInsetsDirectional.only(end: 4),
            child: Badge(
              isLabelVisible: bookmarkCount > 0,
              label: Text(
                '$bookmarkCount',
                style: TextStyle(fontSize: 10),
              ),
              backgroundColor: VdpColors.secondary,
              child: IconButton(
                icon: const Icon(Icons.bookmark_rounded),
                tooltip: context.l10n.bookmarksAndNotes,
                onPressed: () => _showBookmarksSheet(context, ref),
              ),
            ),
          ),
          // ── 📊 Progress Button ───────────────────────────────────────────
          IconButton(
            icon: const Icon(Icons.bar_chart),
            tooltip: context.l10n.overallProgress,
            onPressed: () => _showOverallProgress(context, progress),
          ),
        ],
      ),
      body: Column(
        children: [
          _ProgressSummaryBar(progress: progress),
          _SmartRecommendation(progress: progress),
          ContinueListeningCard(
            modules: kStudyModules.map((m) => StudyModule.fromJson(Map<String, dynamic>.from(m))).toList(),
            onOpen: (module) => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => ModuleDetailScreen(moduleData: module)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
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
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // ── Handle bar ──────────────────────────────────────────────────
          Container(
            width: 44,
            height: 4,
            margin: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // ── Header ──────────────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
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
                      Text(
                        context.l10n.bookmarksAndNotes,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                      Text(
                        context.l10n.savedItemsCount(bookmarkCount),
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).textTheme.bodySmall?.color,
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
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
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
              labelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              padding: EdgeInsets.all(4),
              dividerColor: Colors.transparent,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(context.l10n.cittaTab),
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
                      Text(context.l10n.cetasikaTab),
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
                      Text(context.l10n.notesTab),
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
      return _EmptyState(
        icon: Icons.bookmark_border_rounded,
        title: context.l10n.noBookmarkedCittas,
        subtitle: context.l10n.bookmarkCittaHint,
      );
    }

    final cittas = ref.watch(cittasProvider);
    final bookmarked =
        cittas.where((c) => bookmarkedIds.contains(c.id)).toList();

    if (bookmarked.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            context.l10n.loadingCittas,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: bookmarked.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final citta = bookmarked[index];
        return _BookmarkItemCard(
          id: citta.id,
          title: citta.localizedName(context),
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
      return _EmptyState(
        icon: Icons.bookmark_border_rounded,
        title: context.l10n.noBookmarkedCetasikas,
        subtitle: context.l10n.bookmarkCittaHint,
      );
    }

    final cetasikas = ref.watch(cetasikasProvider);
    final bookmarked =
        cetasikas.where((c) => bookmarkedIds.contains(c.id)).toList();

    if (bookmarked.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            context.l10n.loadingCetasikas,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: bookmarked.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final cetasika = bookmarked[index];
        return _BookmarkItemCard(
          id: cetasika.id,
          title: cetasika.localizedName(context),
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
      return _EmptyState(
        icon: Icons.edit_note_rounded,
        title: context.l10n.noNotes,
        subtitle: context.l10n.addNoteHint,
      );
    }

    final entries = notes.entries.toList();
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        title: Text(
          context.l10n.deleteNoteQuestion,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        content: Text(
          context.l10n.deleteNoteWarning,
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.l10n.cancel),
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
            child: Text(context.l10n.delete),
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
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
            child: Text(icon, style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 12),

          // ── Text ──────────────────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).textTheme.bodySmall?.color,
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
                tooltip: context.l10n.addNote,
                onTap: onAddNote,
              ),
              const SizedBox(height: 4),
              _SmallIconButton(
                icon: Icons.bookmark_remove_rounded,
                color: Colors.red.shade400,
                tooltip: context.l10n.removeBookmark,
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
      padding: EdgeInsets.all(14),
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
                tooltip: context.l10n.editNote,
                onTap: onEdit,
              ),
              const SizedBox(width: 4),
              _SmallIconButton(
                icon: Icons.delete_outline_rounded,
                color: Colors.red.shade400,
                tooltip: context.l10n.deleteNote,
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
            style: TextStyle(
              fontSize: 13,
              color: Theme.of(context).textTheme.bodyLarge?.color,
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
              Icon(Icons.check_circle_outline,
                  color: Theme.of(context).cardColor, size: 18),
              const SizedBox(width: 8),
              Text(_isEditing ? context.l10n.noteUpdated : context.l10n.noteSaved),
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
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Dialog Header ──────────────────────────────────────────
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
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
                        _isEditing ? context.l10n.editNoteTitle : context.l10n.addNoteTitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                      Text(
                        widget.label,
                        style: TextStyle(
                          fontSize: 11,
                          color: Theme.of(context).textTheme.bodySmall?.color,
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
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                decoration: InputDecoration(
                  hintText: context.l10n.studyNoteHint,
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 13,
                    height: 1.6,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(14),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // ── Character count ────────────────────────────────────────
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                context.l10n.charactersCount(_charCount, _maxChars),
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
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(context.l10n.cancel),
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
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: _isSaving
                        ? SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Theme.of(context).cardColor,
                            ),
                          )
                        : Text(
                            _isEditing ? context.l10n.update : context.l10n.saveNote,
                            style: TextStyle(fontWeight: FontWeight.w700),
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
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        color: VdpColors.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '$count',
        style: TextStyle(
          fontSize: 9,
          color: Theme.of(context).cardColor,
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
          padding: EdgeInsets.all(6),
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
        padding: EdgeInsets.all(32),
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
                color: Theme.of(context).textTheme.titleSmall?.color,
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [VdpColors.primary, VdpColors.primaryLight],
          begin: AlignmentDirectional.centerStart,
          end: AlignmentDirectional.centerEnd,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.studyProgressPercent(pct),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress.overallProgress,
                    backgroundColor: Theme.of(context).cardColor,
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
                style: TextStyle(
                  color: VdpColors.secondary,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                context.l10n.modulesCompletedShort,
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
              cittaIds: List<String>.from(m['cittaIds'] ?? []),
              cetasikaIds: List<String>.from(m['cetasikaIds'] ?? []),
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
      margin: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Text(next.icon, style: TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '💡 ${context.l10n.recommendedNext}',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
                Text(
                  next.localizedTitle(context),
                  style: TextStyle(
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
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(context.l10n.learn, style: const TextStyle(fontSize: 13)),
          ),
        ],
      ),
    );
  }
}

/// Cây học tập có hệ thống (VDP 0.10.3 §3 — "phần học tập chưa được hệ thống"):
/// thay danh sách module phẳng bằng CÂY 3 tầng
///   Giai đoạn → Module → Mục bài học,
/// mỗi nhánh mở/đóng được như cây thư mục, kèm nút MỞ RỘNG TẤT CẢ / THU GỌN
/// TẤT CẢ để thu cả cây về đúng các đầu mục. Mục bài học mở thẳng tới đúng
/// đoạn trong bài (ModuleDetailScreen.initialSectionId) và nghe riêng được
/// mục đó — học có hệ thống luôn vững hơn học rời rạc.
class _ModuleGraph extends ConsumerStatefulWidget {
  final UserProgress progress;
  const _ModuleGraph({required this.progress});

  @override
  ConsumerState<_ModuleGraph> createState() => _ModuleGraphState();
}

class _ModuleGraphState extends ConsumerState<_ModuleGraph> {
  /// Nhánh đang mở, khoá theo tầng: `'phase:1'`, `'module:M1_BASICS'`.
  /// Mặc định mở Giai đoạn 1 để người mới thấy ngay mình bắt đầu từ đâu.
  final Set<String> _expanded = {'phase:1'};

  List<StudyModule> get _allModules => kStudyModules
      .map((m) => StudyModule.fromJson(Map<String, dynamic>.from(m)))
      .toList();

  void _toggle(String nodeId) {
    setState(() {
      if (!_expanded.remove(nodeId)) _expanded.add(nodeId);
    });
  }

  void _expandAll() {
    setState(() {
      for (final module in _allModules) {
        _expanded.add('phase:${module.phase}');
        _expanded.add('module:${module.id}');
      }
    });
  }

  void _collapseAll() {
    setState(_expanded.clear);
  }

  List<({int number, String title})> _phases(BuildContext context) => [
        (number: 1, title: context.l10n.phaseFoundation),
        (number: 2, title: context.l10n.phaseCausality),
        (number: 3, title: context.l10n.phaseMastery),
      ];

  @override
  Widget build(BuildContext context) {
    final progress = widget.progress;
    final allModules = _allModules;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Thanh điều khiển cây: mở rộng / thu gọn toàn bộ ────────────────
        Row(
          children: [
            Expanded(
              child: Text(
                context.l10n.studyPath,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: _expandAll,
              icon: const Icon(Icons.unfold_more_rounded, size: 18),
              label: Text(
                context.l10n.studyTreeExpandAll,
                style: const TextStyle(fontSize: 12),
              ),
            ),
            TextButton.icon(
              onPressed: _collapseAll,
              icon: const Icon(Icons.unfold_less_rounded, size: 18),
              label: Text(
                context.l10n.studyTreeCollapseAll,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),

        // ── Tầng 1: Giai đoạn ─────────────────────────────────────────────
        for (final phase in _phases(context))
          ..._buildPhase(
            context,
            number: phase.number,
            title: phase.title,
            modules: allModules.where((m) => m.phase == phase.number).toList(),
            allModules: allModules,
            progress: progress,
          ),
      ],
    );
  }

  List<Widget> _buildPhase(
    BuildContext context, {
    required int number,
    required String title,
    required List<StudyModule> modules,
    required List<StudyModule> allModules,
    required UserProgress progress,
  }) {
    final nodeId = 'phase:$number';
    final expanded = _expanded.contains(nodeId);
    var completed = 0;
    var sumPct = 0.0;
    for (final module in modules) {
      final pct = progress.moduleProgress[module.id]?.completionPercentage ?? 0;
      sumPct += pct;
      if (pct >= 80) completed++;
    }
    final avgPct = modules.isEmpty ? 0 : (sumPct / modules.length).round();

    return [
      _TreeHeader(
        key: ValueKey('header:$nodeId'),
        expanded: expanded,
        onTap: () => _toggle(nodeId),
        leading: Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            color: VdpColors.primary,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '$number',
            style: TextStyle(
              color: Theme.of(context).cardColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        title: title,
        subtitle: '${context.l10n.modulesCompleted(completed, modules.length)}'
            ' · ${context.l10n.studyProgressPercent(avgPct)}',
        emphasized: true,
      ),
      AnimatedSize(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        alignment: Alignment.topCenter,
        child: expanded
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final module in modules)
                    ..._buildModule(
                      context,
                      module: module,
                      allModules: allModules,
                      progress: progress,
                    ),
                ],
              )
            : const SizedBox(width: double.infinity),
      ),
      const SizedBox(height: 6),
    ];
  }

  List<Widget> _buildModule(
    BuildContext context, {
    required StudyModule module,
    required List<StudyModule> allModules,
    required UserProgress progress,
  }) {
    final nodeId = 'module:${module.id}';
    final expanded = _expanded.contains(nodeId);
    final isUnlocked = progress.isModuleUnlocked(module, allModules);
    final pct = progress.moduleProgress[module.id]?.completionPercentage ?? 0;
    final color = Color(module.colorCode);
    final isDueForReview = progress.isModuleDueForReview(module);
    final sections = module.lessonContent(context).sections;

    return [
      _ModuleNode(
        key: ValueKey('moduleHeader:$nodeId'),
        module: module,
        color: color,
        isUnlocked: isUnlocked,
        allUnlocked: progress.allModulesUnlocked,
        pct: pct,
        isDueForReview: isDueForReview,
        expanded: expanded,
        sectionCount: sections.length,
        onToggle: () => _toggle(nodeId),
        onOpen: isUnlocked
            ? () => _openModule(context, module)
            : null,
      ),
      AnimatedSize(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        alignment: Alignment.topCenter,
        child: expanded && isUnlocked
            ? Padding(
                padding: const EdgeInsetsDirectional.only(start: 24, end: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = 0; i < sections.length; i++)
                      _SectionLeaf(
                        section: sections[i],
                        index: i + 1,
                        color: color,
                        onOpen: () => _openModule(
                          context,
                          module,
                          sectionId: sections[i].id,
                        ),
                        onListen: () => _openModule(
                          context,
                          module,
                          sectionId: sections[i].id,
                          autoPlay: true,
                        ),
                      ),
                    if (sections.isEmpty)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            8, 2, 8, 10),
                        child: Text(
                          context.l10n.moduleHasNoData,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                  ],
                ),
              )
            : const SizedBox(width: double.infinity),
      ),
      const SizedBox(height: 8),
    ];
  }

  void _openModule(
    BuildContext context,
    StudyModule module, {
    String? sectionId,
    bool autoPlay = false,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ModuleDetailScreen(
          moduleData: module,
          initialSectionId: sectionId,
          autoPlaySection: autoPlay,
        ),
      ),
    );
  }
}

/// Đầu mục của một nhánh cây (giai đoạn hoặc module) — hàng bấm được, có mũi
/// tên xoay theo trạng thái mở/đóng.
class _TreeHeader extends StatelessWidget {
  const _TreeHeader({
    super.key,
    required this.expanded,
    required this.onTap,
    required this.leading,
    required this.title,
    this.subtitle,
    this.emphasized = false,
  });

  final bool expanded;
  final VoidCallback onTap;
  final Widget leading;
  final String title;
  final String? subtitle;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      expanded: expanded,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              leading,
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: emphasized ? 15 : 14,
                        fontWeight:
                            emphasized ? FontWeight.w700 : FontWeight.w600,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                    if (subtitle != null && subtitle!.isNotEmpty)
                      Text(
                        subtitle!,
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                  ],
                ),
              ),
              AnimatedRotation(
                turns: expanded ? 0.0 : -0.25,
                duration: const Duration(milliseconds: 180),
                child: const Icon(Icons.keyboard_arrow_down_rounded,
                    size: 20, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Đầu mục một MODULE trong cây — giữ nguyên ngôn ngữ thẻ cũ (icon tròn màu
/// module, thanh tiến độ, huy hiệu khóa / đến hạn ôn) nhưng thêm mũi tên mở
/// ra danh sách mục bài học bên dưới.
class _ModuleNode extends StatelessWidget {
  const _ModuleNode({
    super.key,
    required this.module,
    required this.color,
    required this.isUnlocked,
    required this.allUnlocked,
    required this.pct,
    required this.isDueForReview,
    required this.expanded,
    required this.sectionCount,
    required this.onToggle,
    required this.onOpen,
  });

  final StudyModule module;
  final Color color;
  final bool isUnlocked;
  final bool allUnlocked;
  final double pct;
  final bool isDueForReview;
  final bool expanded;
  final int sectionCount;
  final VoidCallback onToggle;
  final VoidCallback? onOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2, top: 2),
      decoration: BoxDecoration(
        color: isUnlocked
            ? Theme.of(context).cardColor
            : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isUnlocked
              ? color.withOpacity(0.4)
              : Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        children: [
          InkWell(
            // Bấm vào thân = mở/đóng nhánh (hành vi cây thư mục).
            onTap: isUnlocked ? onToggle : onOpen,
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: isUnlocked
                              ? color.withOpacity(0.12)
                              : Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child:
                            Text(module.icon, style: const TextStyle(fontSize: 20)),
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
                      if (!isUnlocked && !allUnlocked)
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: const Icon(Icons.lock,
                              size: 18, color: Colors.grey),
                        ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          module.localizedTitle(context),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: isUnlocked
                                ? Theme.of(context).textTheme.bodyLarge?.color
                                : Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                module.titlePali,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                            if (sectionCount > 0) ...[
                              Icon(Icons.article_outlined,
                                  size: 12, color: Colors.grey.shade600),
                              const SizedBox(width: 3),
                              Text(
                                '$sectionCount',
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ],
                        ),
                        if (isUnlocked && pct > 0) ...[
                          const SizedBox(height: 6),
                          LinearProgressIndicator(
                            value: pct / 100,
                            backgroundColor: Colors.grey.shade200,
                            valueColor: AlwaysStoppedAnimation<Color>(color),
                            minHeight: 4,
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  if (isUnlocked)
                    IconButton(
                      onPressed: onOpen,
                      icon: Icon(Icons.menu_book_rounded, size: 20, color: color),
                    ),
                  AnimatedRotation(
                    turns: expanded ? 0.0 : -0.25,
                    duration: const Duration(milliseconds: 180),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 20,
                      color: isUnlocked ? color : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Lá của cây: MỘT mục bài học trong module. Bấm = mở bài đúng đoạn đó;
/// nút loa = mở bài và nghe riêng mục đó (nối liền học–nghe).
class _SectionLeaf extends StatelessWidget {
  const _SectionLeaf({
    required this.section,
    required this.index,
    required this.color,
    required this.onOpen,
    required this.onListen,
  });

  final LessonSection section;
  final int index;
  final Color color;
  final VoidCallback onOpen;
  final VoidCallback onListen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onOpen,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '$index',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                section.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, height: 1.25),
              ),
            ),
            Tooltip(
              message: context.l10n.listenFromHere,
              child: IconButton(
                onPressed: onListen,
                visualDensity: VisualDensity.compact,
                icon: Icon(Icons.headphones_rounded, size: 18, color: color),
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
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            context.l10n.progressOverview,
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
                  style: TextStyle(
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
            label: context.l10n.totalModules,
            value: '${kStudyModules.length}',
          ),
          _StatRow(
            label: context.l10n.dueForReview,
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
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          Text(value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}
