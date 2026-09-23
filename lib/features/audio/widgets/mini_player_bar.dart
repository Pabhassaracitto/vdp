// lib/features/audio/widgets/mini_player_bar.dart
//
// Thanh nghe nhỏ bám đáy tab bài học (plan §5.1): play/pause ở vùng ngón cái,
// bấm thân thanh mở full player. Chip tốc độ xoay vòng tại chỗ (thói quen H3),
// nút lặp xoay 3 chế độ (H2), nút next cho nghe liền mạch (H1).

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/l10n.dart';
import '../providers/audio_player_provider.dart';
import 'audio_controls_common.dart';
import 'full_player_sheet.dart';

class MiniPlayerBar extends ConsumerWidget {
  const MiniPlayerBar({super.key, required this.moduleId, required this.color});

  final String moduleId;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(audioPlayerProvider);
    if (state.moduleId != moduleId ||
        !state.hasSession ||
        state.status == PlayerStatus.idle) {
      return const SizedBox.shrink();
    }

    final notifier = ref.read(audioPlayerProvider.notifier);
    final theme = Theme.of(context);
    final track = state.currentTrack;
    final cueLabel = track == null
        ? ''
        : '${state.currentCueIndex + 1}/${track.cues.length}';

    return Material(
      elevation: 10,
      color: theme.colorScheme.surface,
      child: SafeArea(
        top: false,
        child: InkWell(
          onTap: () => FullPlayerSheet.show(context, color: color, moduleId: moduleId),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: color.withOpacity(0.35))),
            ),
            child: Row(
              children: [
                // ── Play / Pause — nút to nhất, bấm mù cũng trúng ──────────
                Semantics(
                  button: true,
                  label: state.isPlaying
                      ? context.l10n.pauseAudio
                      : context.l10n.playAudio,
                  child: IconButton.filled(
                    tooltip: state.isPlaying
                        ? context.l10n.pauseAudio
                        : context.l10n.playAudio,
                    onPressed: notifier.togglePlayPause,
                    style: IconButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                    ),
                    icon: Icon(
                      state.isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                // ── Tên mục + vị trí: "mục 3/7 · đoạn 2/5" ────────────────
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        track?.title ?? state.moduleTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${state.currentTrackNumber}/${state.playlist.length}'
                        ' · $cueLabel',
                        style: TextStyle(
                          fontSize: 11,
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                // ── Chip tốc độ xoay vòng 0.75 → … → 2 → 0.75 ─────────────
                Tooltip(
                  message: context.l10n.playbackSpeed,
                  child: Semantics(
                    button: true,
                    label:
                        '${context.l10n.playbackSpeed}: ${formatSpeed(state.speed)}',
                    child: TextButton(
                      onPressed: () =>
                          notifier.setSpeed(nextSpeedPreset(state.speed)),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        minimumSize: const Size(40, 40),
                      ),
                      child: Text(
                        formatSpeed(state.speed),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                ),
                // ── Lặp: Tắt → Mục này → Cả danh sách ─────────────────────
                Tooltip(
                  message: repeatLabel(context, state.repeatMode),
                  child: Semantics(
                    button: true,
                    label: repeatLabel(context, state.repeatMode),
                    child: IconButton(
                      onPressed: notifier.cycleRepeatMode,
                      icon: Icon(
                        repeatIcon(state.repeatMode),
                        color: state.repeatMode == RepeatMode.off
                            ? theme.iconTheme.color?.withOpacity(0.45)
                            : color,
                      ),
                    ),
                  ),
                ),
                Tooltip(
                  message: context.l10n.next,
                  child: Semantics(
                    button: true,
                    label: context.l10n.next,
                    child: IconButton(
                      onPressed: notifier.next,
                      icon: const Icon(Icons.skip_next_rounded),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
