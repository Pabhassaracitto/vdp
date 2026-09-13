// lib/features/vithi/providers/vithi_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/vithi_model.dart';
import '../../../data/repositories/vithi_repository.dart';
import '../utils/vithi_moment.dart';

/// ID of the cognitive process currently shown by the player.
///
/// Selection must use the model ID, rather than just [VithiDvara], because the
/// bundled data includes multiple five-door processes (for different object
/// strengths).
final selectedVithiIdProvider = StateProvider<String?>((ref) => null);

/// Zero-based index in the expanded, visual sequence of moments.
final activeStepIndexProvider = StateProvider<int>((ref) => 0);

/// State exposed to the playback controls.
enum PlaybackState { idle, playing, paused }

final playbackStateProvider = StateProvider<PlaybackState>(
  (ref) => PlaybackState.idle,
);

/// All bundled cognitive-process models.
final allVithisProvider = FutureProvider<List<VithiModel>>((ref) async {
  final repo = ref.read(vithiRepositoryProvider);
  return repo.loadAll();
});

/// The process currently displayed by the player.
final currentVithiProvider = Provider<AsyncValue<VithiModel?>>((ref) {
  final allAsync = ref.watch(allVithisProvider);
  final selectedId = ref.watch(selectedVithiIdProvider);

  return allAsync.whenData((vithis) {
    if (vithis.isEmpty) return null;
    if (selectedId == null) return vithis.first;

    for (final vithi in vithis) {
      if (vithi.id == selectedId) return vithi;
    }
    return vithis.first;
  });
});

/// Expanded moments, including seven distinct Javana tiles where applicable.
final currentVithiMomentsProvider = Provider<List<VithiMoment>>((ref) {
  final current = ref.watch(currentVithiProvider);
  return current.whenOrNull(
        data: (vithi) =>
            vithi == null ? const <VithiMoment>[] : VithiMomentSequence.fromVithi(vithi),
      ) ??
      const <VithiMoment>[];
});

/// The expanded moment being studied, or null while data is loading / an index
/// is temporarily outside the current process after switching selections.
final activeVithiMomentProvider = Provider<VithiMoment?>((ref) {
  final moments = ref.watch(currentVithiMomentsProvider);
  final index = ref.watch(activeStepIndexProvider);
  if (index < 0 || index >= moments.length) return null;
  return moments[index];
});

/// Compatibility provider for consumers that only need the compact source
/// step. The player itself uses [activeVithiMomentProvider] to preserve the
/// occurrence number of repeated stages such as Javana 1–7.
final activeStepProvider = Provider<VithiStep?>((ref) {
  return ref.watch(activeVithiMomentProvider)?.step;
});
