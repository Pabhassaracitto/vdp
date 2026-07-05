// lib/features/vithi/providers/vithi_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/vithi_model.dart';
import '../../../data/repositories/vithi_repository.dart';

// ── Loại lộ đang được chọn ──────────────────────────────────
final selectedVithiTypeProvider = StateProvider<VithiDvara>(
  (ref) => VithiDvara.panca,
);

// ── Bước đang active (0-based index trong steps list) ────────
final activeStepIndexProvider = StateProvider<int>((ref) => 0);

// ── Trạng thái auto-play ─────────────────────────────────────
enum PlaybackState { idle, playing, paused }

final playbackStateProvider = StateProvider<PlaybackState>(
  (ref) => PlaybackState.idle,
);

// ── Data: tất cả VithiModel ──────────────────────────────────
final allVithisProvider = FutureProvider<List<VithiModel>>((ref) async {
  final repo = ref.read(vithiRepositoryProvider);
  return repo.loadAll();
});

// ── VithiModel đang hiển thị (theo type đã chọn) ─────────────
final currentVithiProvider = Provider<AsyncValue<VithiModel?>>((ref) {
  final allAsync = ref.watch(allVithisProvider);
  final selectedType = ref.watch(selectedVithiTypeProvider);

  return allAsync.whenData((vithis) {
    try {
      return vithis.firstWhere((v) => v.dvara == selectedType);
    } catch (_) {
      return vithis.isNotEmpty ? vithis.first : null;
    }
  });
});

// ── Step hiện tại đang active ─────────────────────────────────
final activeStepProvider = Provider<VithiStep?>((ref) {
  final vithiAsync = ref.watch(currentVithiProvider);
  final idx = ref.watch(activeStepIndexProvider);

  return vithiAsync.whenOrNull(
    data: (vithi) {
      if (vithi == null || idx >= vithi.steps.length) return null;
      return vithi.steps[idx];
    },
  );
});
