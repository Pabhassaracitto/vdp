// lib/features/audio/widgets/full_player_sheet.dart
//
// Bảng điều khiển đầy đủ (plan §5.3): transport ⏮/⏯/⏭, lặp xoay 3 chế độ,
// "Nghe lại ×N" cho học thuộc (H2), preset tốc độ (H3), vị trí mục/đoạn.

import 'package:flutter/material.dart' hide RepeatMode; // use audio RepeatMode
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/l10n.dart';
import '../providers/audio_player_provider.dart';
import 'audio_controls_common.dart';
import 'playlist_sheet.dart';

class FullPlayerSheet extends ConsumerWidget {
  const FullPlayerSheet({super.key, required this.color, required this.moduleId});

  final Color color;
  final String moduleId;

  static Future<void> show(
    BuildContext context, {
    required Color color,
    required String moduleId,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => FullPlayerSheet(color: color, moduleId: moduleId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(audioPlayerProvider);
    final notifier = ref.read(audioPlayerProvider.notifier);
    final theme = Theme.of(context);
    final track = state.currentTrack;
    final cueCount = track?.cues.length ?? 0;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Kéo thả + tiêu đề ─────────────────────────────────────────
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: theme.dividerColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              state.moduleTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              track?.title ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            Semantics(
              liveRegion: true,
              label: '${state.currentTrackNumber}/${state.playlist.length}'
                  ' · ${state.currentCueIndex + 1}/$cueCount',
              child: Text(
                '${state.currentTrackNumber}/${state.playlist.length}'
                ' · ${state.currentCueIndex + 1}/$cueCount',
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 18),

            // ── Transport: ⏮ / ⏯ / ⏭ (cùng ngôn ngữ vithi playback) ──────
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Tooltip(
                  message: context.l10n.previousTrack,
                  child: Semantics(
                    button: true,
                    label: context.l10n.previousTrack,
                    child: IconButton(
                      onPressed: notifier.previous,
                      iconSize: 32,
                      icon: const Icon(Icons.skip_previous_rounded),
                    ),
                  ),
                ),
                const SizedBox(width: 18),
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
                    iconSize: 40,
                    style: IconButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(14),
                    ),
                    icon: Icon(
                      state.isPlaying
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                    ),
                  ),
                ),
                const SizedBox(width: 18),
                Tooltip(
                  message: context.l10n.next,
                  child: Semantics(
                    button: true,
                    label: context.l10n.next,
                    child: IconButton(
                      onPressed: notifier.next,
                      iconSize: 32,
                      icon: const Icon(Icons.skip_next_rounded),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),

            // ── Lặp + Nghe lại ×N (học thuộc — H2) ────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Tooltip(
                  message: repeatLabel(context, state.repeatMode),
                  child: Semantics(
                    button: true,
                    label: repeatLabel(context, state.repeatMode),
                    child: TextButton.icon(
                      onPressed: notifier.cycleRepeatMode,
                      icon: Icon(
                        repeatIcon(state.repeatMode),
                        color: state.repeatMode == RepeatMode.off
                            ? theme.iconTheme.color?.withOpacity(0.45)
                            : color,
                      ),
                      label: Text(
                        repeatLabel(context, state.repeatMode),
                        style: const TextStyle(fontSize: 12.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Tooltip(
                  message: context.l10n.listenAgain,
                  child: Semantics(
                    button: true,
                    label: state.repeatTimesLeft == null
                        ? context.l10n.listenAgain
                        : '${context.l10n.listenAgain} ×'
                            '${state.repeatTimesLeft! + 1}',
                    child: TextButton.icon(
                      onPressed: notifier.cycleListenAgain,
                      icon: Icon(
                        Icons.replay_rounded,
                        color: state.repeatTimesLeft == null
                            ? theme.iconTheme.color?.withOpacity(0.45)
                            : color,
                      ),
                      label: Text(
                        state.repeatTimesLeft == null
                            ? '${context.l10n.listenAgain} ×'
                            : '${context.l10n.listenAgain} ×'
                                '${state.repeatTimesLeft! + 1}',
                        style: const TextStyle(fontSize: 12.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // ── Tốc độ ────────────────────────────────────────────────────
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final preset in kSpeedPresets)
                  ChoiceChip(
                    label: Text(formatSpeed(preset)),
                    selected: (state.speed - preset).abs() < 0.001,
                    selectedColor: color.withOpacity(0.2),
                    onSelected: (_) => notifier.setSpeed(preset),
                  ),
              ],
            ),
            const SizedBox(height: 10),

            // ── Mở danh sách nghe ─────────────────────────────────────────
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                PlaylistSheet.show(context, color: color, moduleId: moduleId);
              },
              icon: const Icon(Icons.queue_music_rounded),
              label: Text(
                '${context.l10n.listeningQueue} (${state.playlist.length})',
                style: const TextStyle(fontSize: 12.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
