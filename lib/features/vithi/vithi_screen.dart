// lib/features/vithi/vithi_screen.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/vithi_constants.dart';
import '../../core/localization/localized_content.dart';
import '../../core/theme/vdp_theme.dart';
import '../../data/models/vithi_model.dart';
import '../../l10n/l10n.dart';
import 'providers/vithi_providers.dart';
import 'utils/vithi_ui_text.dart';
import 'widgets/vithi_detail_panel.dart';
import 'widgets/vithi_header.dart';
import 'widgets/vithi_playback_controls.dart';
import 'widgets/vithi_timeline.dart';

/// Interactive visualisation of the cognitive process (citta-vīthi).
///
/// The underlying dataset stores repeated phases compactly. This screen expands
/// them into individual moments so, for example, the seven Javana moments in
/// the 17-moment five-door process can be followed one by one.
class VithiScreen extends ConsumerStatefulWidget {
  const VithiScreen({super.key});

  @override
  ConsumerState<VithiScreen> createState() => _VithiScreenState();
}

class _VithiScreenState extends ConsumerState<VithiScreen> {
  Timer? _autoPlayTimer;

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    super.dispose();
  }

  void _selectVithi(VithiModel vithi) {
    _stopPlayback();
    // Reset before switching model so the detail panel never sees an index
    // from the longer process while the shorter one is being selected.
    ref.read(activeStepIndexProvider.notifier).state = 0;
    ref.read(selectedVithiIdProvider.notifier).state = vithi.id;
  }

  void _selectMoment(int index, int totalMoments) {
    _stopPlayback(state: PlaybackState.paused);
    ref.read(activeStepIndexProvider.notifier).state = _safeIndex(index, totalMoments);
  }

  void _previous(int currentIndex, int totalMoments) {
    _selectMoment(currentIndex - 1, totalMoments);
  }

  void _next(int currentIndex, int totalMoments) {
    _selectMoment(currentIndex + 1, totalMoments);
  }

  void _reset() {
    _stopPlayback();
    ref.read(activeStepIndexProvider.notifier).state = 0;
  }

  void _toggleAutoPlay(int totalMoments) {
    if (totalMoments == 0) return;

    if (ref.read(playbackStateProvider) == PlaybackState.playing) {
      _stopPlayback(state: PlaybackState.paused);
      return;
    }

    var activeIndex = ref.read(activeStepIndexProvider);
    if (activeIndex >= totalMoments - 1) {
      activeIndex = 0;
      ref.read(activeStepIndexProvider.notifier).state = activeIndex;
    }

    ref.read(playbackStateProvider.notifier).state = PlaybackState.playing;
    _autoPlayTimer?.cancel();
    _autoPlayTimer = Timer.periodic(VithiConstants.autoPlayInterval, (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      final index = ref.read(activeStepIndexProvider);
      if (index >= totalMoments - 1) {
        timer.cancel();
        _autoPlayTimer = null;
        ref.read(playbackStateProvider.notifier).state = PlaybackState.idle;
        return;
      }
      ref.read(activeStepIndexProvider.notifier).state = index + 1;
    });
  }

  void _stopPlayback({PlaybackState state = PlaybackState.idle}) {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = null;
    ref.read(playbackStateProvider.notifier).state = state;
  }

  int _safeIndex(int index, int totalMoments) {
    if (totalMoments <= 0 || index <= 0) return 0;
    if (index >= totalMoments) return totalMoments - 1;
    return index;
  }

  @override
  Widget build(BuildContext context) {
    final vithiAsync = ref.watch(currentVithiProvider);
    final allVithisAsync = ref.watch(allVithisProvider);
    final moments = ref.watch(currentVithiMomentsProvider);
    final activeIndex = ref.watch(activeStepIndexProvider);
    final activeMoment = ref.watch(activeVithiMomentProvider);
    final playbackState = ref.watch(playbackStateProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.mindProcessTitle)),
      body: vithiAsync.when(
        data: (vithi) {
          if (vithi == null) return const _VithiEmptyState();
          final allVithis = allVithisAsync.maybeWhen(
            data: (items) => items,
            orElse: () => <VithiModel>[vithi],
          );

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              VithiHeader(
                currentVithi: vithi,
                vithis: allVithis,
                momentCount: moments.length,
                onVithiSelected: _selectVithi,
              ),
              const SizedBox(height: 16),
              _SectionSurface(
                child: VithiTimeline(
                  vithi: vithi,
                  moments: moments,
                  activeIndex: _safeIndex(activeIndex, moments.length),
                  onStepTap: (index) => _selectMoment(index, moments.length),
                ),
              ),
              const SizedBox(height: 12),
              VithiPlaybackControls(
                playbackState: playbackState,
                activeIndex: _safeIndex(activeIndex, moments.length),
                totalMoments: moments.length,
                onPrev: activeIndex > 0
                    ? () => _previous(activeIndex, moments.length)
                    : null,
                onNext: activeIndex < moments.length - 1
                    ? () => _next(activeIndex, moments.length)
                    : null,
                onAutoPlay: () => _toggleAutoPlay(moments.length),
                onReset: _reset,
              ),
              if (activeMoment != null) ...[
                const SizedBox(height: 12),
                VithiDetailPanel(
                  vithi: vithi,
                  moment: activeMoment,
                  totalMoments: moments.length,
                ),
              ],
              const SizedBox(height: 12),
              _VithiContextCard(vithi: vithi),
              const SizedBox(height: 32),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _VithiLoadError(error: error),
      ),
    );
  }
}

class _SectionSurface extends StatelessWidget {
  const _SectionSurface({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final accent = context.isHighContrast ? HCColors.primary : VdpColors.primary;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.isHighContrast ? HCColors.surfaceVariant : VdpColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accent.withOpacity(context.isHighContrast ? 0.6 : 0.16)),
      ),
      child: child,
    );
  }
}

class _VithiContextCard extends StatelessWidget {
  const _VithiContextCard({required this.vithi});

  final VithiModel vithi;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = context.isHighContrast ? HCColors.primary : VdpColors.primary;

    return Container(
      decoration: BoxDecoration(
        color: context.isHighContrast ? HCColors.surfaceVariant : VdpColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accent.withOpacity(context.isHighContrast ? 0.6 : 0.16)),
      ),
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          leading: Icon(Icons.menu_book_outlined, color: accent, semanticLabel: ''),
          title: Text(
            VithiUiText.backgroundTitle(context),
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          subtitle: Text(
            vithi.arisingCondition ?? vithi.localizedDescription(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall,
          ),
          children: [
            if (vithi.arisingCondition?.isNotEmpty ?? false)
              _ContextItem(
                icon: Icons.bolt_outlined,
                title: VithiUiText.arisingCondition(context),
                body: vithi.arisingCondition!,
                color: accent,
              ),
            if (vithi.significance?.isNotEmpty ?? false)
              _ContextItem(
                icon: Icons.stars_outlined,
                title: VithiUiText.significance(context),
                body: vithi.significance!,
                color: accent,
              ),
            if (vithi.doctrinalNote?.isNotEmpty ?? false)
              _ContextItem(
                icon: Icons.lightbulb_outline_rounded,
                title: VithiUiText.doctrinalNote(context),
                body: vithi.doctrinalNote!,
                color: accent,
              ),
          ],
        ),
      ),
    );
  }
}

class _ContextItem extends StatelessWidget {
  const _ContextItem({
    required this.icon,
    required this.title,
    required this.body,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String body;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 17, color: color, semanticLabel: ''),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 2),
                Text(body, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VithiEmptyState extends StatelessWidget {
  const _VithiEmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Text(
          VithiUiText.noCittaMapping(context),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class _VithiLoadError extends StatelessWidget {
  const _VithiLoadError({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded, size: 48, color: VdpColors.error),
            const SizedBox(height: 12),
            Text(
              context.l10n.errorWithMessage(error.toString()),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
