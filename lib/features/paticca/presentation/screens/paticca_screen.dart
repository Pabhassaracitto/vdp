// lib/features/paticca/presentation/screens/paticca_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/l10n.dart';
import '../../../audio/providers/audio_player_provider.dart';
import '../../../audio/widgets/playlist_sheet.dart';
import '../providers/paticca_audio_session.dart';
import '../providers/paticca_providers.dart';
import '../widgets/list/paccaya_group_filter_bar.dart';
import '../widgets/list/paccaya_list_view.dart';
import '../widgets/list/paticca_filter_bar.dart';
import '../widgets/list/paticca_list_view.dart';

/// Tab Nhân Duyên — hai phần của Paccaya-saṅgaha-vibhāga:
/// A. Paṭiccasamuppāda naya: 12 chi Duyên khởi.
/// B. Paṭṭhāna naya: 24 Duyên Hệ.
///
/// V1.9.2 §3 (1c-b): trước bản này tab này KHÔNG có tính năng nghe — toàn bộ
/// tính năng đọc/nghe chỉ tồn tại ở tab Học. Tự chuẩn bị playlist (giống
/// `_StudyTabState` ở module_detail_screen.dart — idempotent, không tự phát)
/// ngay khi mở từng phần (Liên kết/Duyên hệ), để cả nút "Nghe toàn bộ" lẫn
/// mục trong `PlaylistSheet` đều sẵn sàng mà không cần người dùng bấm gì
/// trước. Dùng lại NGUYÊN engine/provider/queue/repeat của tab Học
/// (`audioPlayerProvider` + `EntityPlaylistBuilder`), nên mọi thứ đã sửa ở
/// 1a/1b (lặp đúng, karaoke, thanh nghe nổi) tự động áp dụng ở đây.
class PaticcaScreen extends ConsumerStatefulWidget {
  const PaticcaScreen({super.key});

  @override
  ConsumerState<PaticcaScreen> createState() => _PaticcaScreenState();
}

class _PaticcaScreenState extends ConsumerState<PaticcaScreen> {
  bool _preparedList = false;
  bool _preparedPaccaya = false;

  void _ensurePrepared(bool isPaccaya) {
    final already = isPaccaya ? _preparedPaccaya : _preparedList;
    if (already) return;
    if (isPaccaya) {
      _preparedPaccaya = true;
    } else {
      _preparedList = true;
    }
    Future<void>.microtask(() {
      if (!mounted) return;
      PaticcaAudioSession.prepare(context, ref, isPaccaya: isPaccaya);
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeTab =
        ref.watch(paticcaFlowchartStateProvider.select((s) => s.activeTab));
    final notifier = ref.read(paticcaFlowchartStateProvider.notifier);
    final isPaccaya = activeTab == PaticcaViewTab.paccaya;
    _ensurePrepared(isPaccaya);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.conditionsTitle)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
            // Cuộn ngang khi nhãn dài ở một số ngôn ngữ — tránh overflow như
            // đã từng gặp ở Bảng Tương Ưng (M1-T1).
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SegmentedButton<PaticcaViewTab>(
                segments: [
                  ButtonSegment(
                    value: PaticcaViewTab.list,
                    label: Text(context.l10n.conditionsTabLinks),
                    icon: const Icon(Icons.link),
                  ),
                  ButtonSegment(
                    value: PaticcaViewTab.paccaya,
                    label: Text(context.l10n.conditionsTabPaccaya),
                    icon: const Icon(Icons.hub),
                  ),
                ],
                selected: {
                  isPaccaya ? PaticcaViewTab.paccaya : PaticcaViewTab.list
                },
                showSelectedIcon: false,
                onSelectionChanged: (selection) =>
                    notifier.switchTab(selection.first),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: _PaticcaListenRow(isPaccaya: isPaccaya),
          ),
          if (isPaccaya) const PaccayaFilterBar() else const PaticcaFilterBar(),
          Expanded(
            child: isPaccaya ? const PaccayaListView() : const PaticcaListView(),
          ),
        ],
      ),
    );
  }
}

/// Nút "Nghe toàn bộ 12 chi" / "Nghe toàn bộ 24 duyên hệ" — cùng hình dạng
/// với `_ListenActionsRow` ở tab Học (module_detail_screen.dart) để người
/// dùng có một mẫu hình nhất quán cho "nghe" ở bất kỳ đâu trong app.
class _PaticcaListenRow extends ConsumerWidget {
  final bool isPaccaya;
  const _PaticcaListenRow({required this.isPaccaya});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionId = PaticcaAudioSession.sessionId(isPaccaya);
    final state = ref.watch(audioPlayerProvider);
    final isThisSession = state.moduleId == sessionId && state.hasSession;
    final canResume = isThisSession && state.canResume;
    // Theo màu chủ đề hiện hành (sáng/tối) thay vì hằng số cố định — nút nghe
    // ở tab Nhân Duyên không gắn với 1 module màu riêng như tab Học.
    final color = Theme.of(context).colorScheme.primary;

    Future<void> prepare() => PaticcaAudioSession.prepare(context, ref, isPaccaya: isPaccaya);

    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: () async {
              await prepare();
              if (!context.mounted) return;
              await ref
                  .read(audioPlayerProvider.notifier)
                  .playAll(resume: canResume);
            },
            style: FilledButton.styleFrom(backgroundColor: color),
            icon: const Icon(Icons.headphones_rounded),
            label: Text(
              canResume ? context.l10n.resumeListening : context.l10n.listenAll,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              await prepare();
              if (!context.mounted) return;
              PlaylistSheet.show(context, color: color, moduleId: sessionId);
            },
            icon: const Icon(Icons.queue_music_rounded),
            label: Text(
              context.l10n.listeningQueue,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
