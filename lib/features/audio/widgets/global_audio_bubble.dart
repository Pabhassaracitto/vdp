// lib/features/audio/widgets/global_audio_bubble.dart
//
// VDP | Audio V1.9.2 §1 — "pop âm thanh toàn app": trước bản này, điều khiển
// nghe (MiniPlayerBar) chỉ sống BÊN TRONG ModuleDetailScreen của đúng module
// đang nghe — rời màn hình đó (vào module khác, về Trang chủ, mở Cài đặt…)
// là mất hẳn mọi điều khiển dù audio vẫn chạy nền. Widget này được vẽ MỘT
// LẦN ở gốc cây widget (xem `main.dart`) nên luôn hiển thị bất kể người dùng
// đang ở màn hình nào, với 4 khả năng mà yêu cầu đã nêu:
//   • "Đến nơi đang phát": điều hướng về đúng module (tab Học) hoặc đúng
//     phần (Liên kết/Duyên hệ) của tab Nhân Duyên đang đọc.
//   • Tạm dừng / tiếp tục ngay tại chỗ (không cần mở lại màn hình).
//   • "Ẩn": thu nhỏ thành một nút tròn nhỏ — phiên vẫn chạy nền.
//   • "Đóng": tắt hẳn phiên nghe.
//
// Widget này nằm ngoài Navigator thật (bên trong `MaterialApp.builder`) nên
// điều hướng qua [rootNavigatorKey] thay vì `Navigator.of(context)` — xem ghi
// chú trong `core/navigation/app_navigator.dart`.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/navigation/app_navigator.dart';
import '../../../data/models/study_module.dart';
import '../../../l10n/l10n.dart';
import '../../paticca/presentation/providers/paticca_providers.dart';
import '../../paticca/presentation/screens/paticca_screen.dart';
import '../../study/module_detail_screen.dart';
import '../providers/audio_player_provider.dart';

class GlobalAudioBubble extends ConsumerWidget {
  const GlobalAudioBubble({super.key});

  /// Điều hướng về đúng nơi đang phát — dùng `rootNavigatorKey` vì widget
  /// này không có Navigator tổ tiên (xem ghi chú đầu file).
  void _goToSource(WidgetRef ref, AudioPlayerState state) {
    final navigator = rootNavigatorKey.currentState;
    if (navigator == null) return;
    switch (state.sourceKind) {
      case AudioSourceKind.study:
        final id = state.moduleId;
        if (id == null) return;
        final modules = kStudyModules
            .map((m) => StudyModule.fromJson(Map<String, dynamic>.from(m)))
            .toList();
        StudyModule? module;
        for (final m in modules) {
          if (m.id == id) {
            module = m;
            break;
          }
        }
        if (module == null) return;
        navigator.push(
          MaterialPageRoute(builder: (_) => ModuleDetailScreen(moduleData: module!)),
        );
      case AudioSourceKind.paticcaList:
      case AudioSourceKind.paticcaPaccaya:
        ref.read(paticcaFlowchartStateProvider.notifier).switchTab(
              state.sourceKind == AudioSourceKind.paticcaPaccaya
                  ? PaticcaViewTab.paccaya
                  : PaticcaViewTab.list,
            );
        navigator.push(MaterialPageRoute(builder: (_) => const PaticcaScreen()));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(audioPlayerProvider);
    if (!state.hasSession) return const SizedBox.shrink();

    final notifier = ref.read(audioPlayerProvider.notifier);
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;

    if (state.bubbleHidden) {
      return _RestoreHandle(
        color: color,
        isPlaying: state.isPlaying,
        onTap: notifier.showBubble,
      );
    }

    final track = state.currentTrack;
    final subtitle = track == null
        ? state.moduleTitle
        : '${state.moduleTitle} · ${state.currentTrackNumber}/${state.playlist.length}';

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(16),
          color: theme.colorScheme.surface,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _goToSource(ref, state),
            child: Semantics(
              button: true,
              label: context.l10n.audioFloatingGoTo,
              child: Container(
              padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: color.withOpacity(0.35)),
              ),
              child: Row(
                children: [
                  Semantics(
                    button: true,
                    label: state.isPlaying ? context.l10n.pauseAudio : context.l10n.playAudio,
                    child: IconButton.filled(
                      tooltip: state.isPlaying ? context.l10n.pauseAudio : context.l10n.playAudio,
                      onPressed: notifier.togglePlayPause,
                      style: IconButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white),
                      icon: Icon(state.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.headphones_rounded, size: 13, color: color),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                context.l10n.nowPlaying,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          track?.title ?? subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Tooltip(
                    message: context.l10n.audioFloatingHide,
                    child: Semantics(
                      button: true,
                      label: context.l10n.audioFloatingHide,
                      child: IconButton(
                        onPressed: notifier.hideBubble,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: context.l10n.audioFloatingClose,
                    child: Semantics(
                      button: true,
                      label: context.l10n.audioFloatingClose,
                      child: IconButton(
                        onPressed: notifier.closeSession,
                        icon: const Icon(Icons.close_rounded),
                      ),
                    ),
                  ),
                ],
              ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Dạng thu nhỏ khi người dùng bấm "Ẩn" — một chấm tròn nhỏ ở góc, không che
/// nội dung, bấm để hiện lại thanh đầy đủ.
class _RestoreHandle extends StatelessWidget {
  const _RestoreHandle({required this.color, required this.isPlaying, required this.onTap});

  final Color color;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 14, 14),
          child: Semantics(
            button: true,
            label: context.l10n.audioFloatingRestore,
            child: Tooltip(
              message: context.l10n.audioFloatingRestore,
              child: Material(
                color: color,
                shape: const CircleBorder(),
                elevation: 8,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Icon(
                      isPlaying ? Icons.graphic_eq_rounded : Icons.headphones_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
