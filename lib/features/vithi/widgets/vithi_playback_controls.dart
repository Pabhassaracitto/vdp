// lib/features/vithi/widgets/vithi_playback_controls.dart

import 'package:flutter/material.dart';

import '../../../core/theme/vdp_theme.dart';
import '../providers/vithi_providers.dart';
import '../utils/vithi_ui_text.dart';

/// Accessible controls for stepping through the cognitive-process sequence.
class VithiPlaybackControls extends StatelessWidget {
  const VithiPlaybackControls({
    super.key,
    required this.playbackState,
    required this.activeIndex,
    required this.totalMoments,
    required this.onPrev,
    required this.onNext,
    required this.onAutoPlay,
    required this.onReset,
  });

  final PlaybackState playbackState;
  final int activeIndex;
  final int totalMoments;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;
  final VoidCallback onAutoPlay;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    final isPlaying = playbackState == PlaybackState.playing;
    final accent = context.isHighContrast ? HCColors.primary : VdpColors.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: context.isHighContrast ? HCColors.surfaceVariant : VdpColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: accent.withOpacity(context.isHighContrast ? 0.65 : 0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Tooltip(
            message: VithiUiText.previous(context),
            child: IconButton(
              onPressed: onPrev,
              icon: const Icon(Icons.skip_previous_rounded),
            ),
          ),
          const SizedBox(width: 2),
          Semantics(
            button: true,
            label: isPlaying ? VithiUiText.pause(context) : VithiUiText.play(context),
            child: IconButton.filled(
              onPressed: onAutoPlay,
              tooltip: isPlaying ? VithiUiText.pause(context) : VithiUiText.play(context),
              style: IconButton.styleFrom(
                backgroundColor: accent,
                foregroundColor: context.isHighContrast ? Colors.black : Colors.white,
              ),
              icon: Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded),
            ),
          ),
          const SizedBox(width: 2),
          Tooltip(
            message: VithiUiText.next(context),
            child: IconButton(
              onPressed: onNext,
              icon: const Icon(Icons.skip_next_rounded),
            ),
          ),
          Container(
            width: 1,
            height: 28,
            color: Theme.of(context).dividerColor,
            margin: const EdgeInsets.symmetric(horizontal: 5),
          ),
          Tooltip(
            message: VithiUiText.reset(context),
            child: IconButton(
              onPressed: onReset,
              icon: const Icon(Icons.replay_rounded),
            ),
          ),
          Flexible(
            child: Semantics(
              liveRegion: true,
              label: VithiUiText.momentProgress(
                context,
                totalMoments == 0 ? 0 : activeIndex + 1,
                totalMoments,
              ),
              child: Text(
                '${totalMoments == 0 ? 0 : activeIndex + 1} / $totalMoments',
                style: TextStyle(color: accent, fontSize: 12, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
