// lib/features/vithi/vithi_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/vithi_providers.dart';
import 'widgets/vithi_header.dart';
import 'widgets/vithi_timeline.dart';
import 'widgets/vithi_detail_panel.dart';
import 'widgets/vithi_playback_controls.dart';

class VithiScreen extends ConsumerWidget {
  const VithiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vithiAsync = ref.watch(currentVithiProvider);
    final activeStep = ref.watch(activeStepProvider);
    final playbackState = ref.watch(playbackStateProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(title: const Text('Lộ Trình Tâm')),
      body: vithiAsync.when(
        data: (vithi) => vithi == null
            ? const SizedBox()
            : Column(
                children: [
                  VithiHeader(currentVithi: vithi),
                  Expanded(
                      child: VithiTimeline(
                          vithi: vithi,
                          onStepTap: (i) => ref
                              .read(activeStepIndexProvider.notifier)
                              .state = i)),
                  VithiPlaybackControls(
                    playbackState: playbackState,
                    onPrev: () =>
                        ref.read(activeStepIndexProvider.notifier).state--,
                    onNext: () =>
                        ref.read(activeStepIndexProvider.notifier).state++,
                    onAutoPlay: () => {},
                    onReset: () =>
                        ref.read(activeStepIndexProvider.notifier).state = 0,
                  ),
                  if (activeStep != null) VithiDetailPanel(step: activeStep),
                ],
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
      ),
    );
  }
}
