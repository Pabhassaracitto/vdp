// lib/features/audio/widgets/playlist_sheet.dart
//
// "Dạng list" đúng yêu cầu (plan §5.2): danh sách nghe của một module —
// đánh số, thời lượng ≈ (H7), tap hàng = phát từ đây (H6), hàng đang nghe
// sáng lên kèm vị trí. Khu Tùy chọn: lặp 3 chế độ + 5 preset tốc độ.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/l10n.dart';
import '../providers/audio_player_provider.dart';
import 'audio_controls_common.dart';

class PlaylistSheet extends ConsumerWidget {
  const PlaylistSheet({super.key, required this.color, required this.moduleId});

  final Color color;
  final String moduleId;

  static Future<void> show(
    BuildContext context, {
    required Color color,
    required String moduleId,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => PlaylistSheet(color: color, moduleId: moduleId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(audioPlayerProvider);
    final notifier = ref.read(audioPlayerProvider.notifier);
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
            children: [
              // ── Thanh kéo + tiêu đề ────────────────────────────────────
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.dividerColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.listeningQueue,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '${state.moduleTitle} · ${state.playlist.length}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: theme.textTheme.bodySmall?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: () {
                      notifier.playAll(resume: state.canResume);
                      Navigator.of(context).pop();
                    },
                    style: FilledButton.styleFrom(backgroundColor: color),
                    icon: Icon(state.canResume
                        ? Icons.play_arrow_rounded
                        : Icons.playlist_play_rounded),
                    label: Text(state.canResume
                        ? context.l10n.resumeListening
                        : context.l10n.listenAll),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ── Tùy chọn: Lặp (H2) ─────────────────────────────────────
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  for (final mode in RepeatMode.values)
                    ChoiceChip(
                      label: Text(repeatLabel(context, mode)),
                      selected: state.repeatMode == mode,
                      selectedColor: color.withOpacity(0.2),
                      avatar: Icon(
                        repeatIcon(mode),
                        size: 16,
                        color: state.repeatMode == mode ? color : null,
                      ),
                      onSelected: (_) =>
                          notifier.setRepeatMode(mode),
                    ),
                ],
              ),
              const SizedBox(height: 10),

              // ── Tùy chọn: Tốc độ (H3) ──────────────────────────────────
              Row(
                children: [
                  Icon(Icons.speed_rounded, size: 16, color: color),
                  const SizedBox(width: 6),
                  Text(
                    context.l10n.playbackSpeed,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Wrap(
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
              const SizedBox(height: 12),
              const Divider(height: 1),

              // ── Danh sách mục ──────────────────────────────────────────
              for (var i = 0; i < state.playlist.length; i++)
                _TrackRow(
                  index: i,
                  color: color,
                ),
            ],
          ),
        );
      },
    );
  }
}

class _TrackRow extends ConsumerWidget {
  const _TrackRow({required this.index, required this.color});

  final int index;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(audioPlayerProvider);
    final notifier = ref.read(audioPlayerProvider.notifier);
    final theme = Theme.of(context);
    final track = state.playlist[index];
    final isCurrent = index == state.currentIndex;
    final isFinished = state.finishedTrackIds.contains(track.id);
    final cueCount = track.cues.length;

    return ListTile(
      onTap: () {
        notifier.playFrom(track.id);
        Navigator.of(context).pop();
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tileColor: isCurrent ? color.withOpacity(0.08) : null,
      leading: Container(
        width: 34,
        height: 34,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isCurrent ? color.withOpacity(0.15) : theme.dividerColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isCurrent
            ? Icon(
                state.isPlaying ? Icons.graphic_eq_rounded : Icons.play_arrow_rounded,
                size: 18,
                color: color,
              )
            : isFinished
                ? Icon(Icons.check_circle_rounded, size: 16, color: color)
                : Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
      ),
      title: Text(
        track.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 13.5,
          fontWeight: isCurrent ? FontWeight.w800 : FontWeight.w600,
        ),
      ),
      subtitle: Text(
        isCurrent
            ? '${context.l10n.nowPlaying} · ${state.currentCueIndex + 1}/$cueCount'
            : estimateLabel(context, track, state.speed),
        style: TextStyle(
          fontSize: 11.5,
          color: isCurrent ? color : theme.textTheme.bodySmall?.color,
          fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
      trailing: Tooltip(
        message: context.l10n.listenFromHere,
        child: Semantics(
          button: true,
          label: '${context.l10n.listenFromHere}: ${track.title}',
          child: IconButton(
            onPressed: () {
              notifier.playFrom(track.id);
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.play_arrow_rounded, color: color),
          ),
        ),
      ),
    );
  }
}
