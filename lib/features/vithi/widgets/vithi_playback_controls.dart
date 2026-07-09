// lib/features/vithi/widgets/vithi_playback_controls.dart

import 'package:flutter/material.dart';
import '../providers/vithi_providers.dart';

class VithiPlaybackControls extends StatelessWidget {
  final PlaybackState playbackState;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onAutoPlay;
  final VoidCallback onReset;

  const VithiPlaybackControls({
    super.key,
    required this.playbackState,
    required this.onPrev,
    required this.onNext,
    required this.onAutoPlay,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: onPrev,
            icon: const Icon(Icons.skip_previous, color: Colors.white)),
        IconButton(
            onPressed: onAutoPlay,
            icon: Icon(
                playbackState == PlaybackState.playing
                    ? Icons.pause
                    : Icons.play_arrow,
                color: Colors.white)),
        IconButton(
            onPressed: onNext,
            icon: const Icon(Icons.skip_next, color: Colors.white)),
      ],
    );
  }
}
