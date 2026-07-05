// lib/features/paticca/presentation/providers/paticca_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/models/paticca_model.dart';
import '../../data/paticca_repository_impl.dart';
import 'paticca_flowchart_state.dart';

part 'paticca_providers.freezed.dart';

// ─────────────────────────────────────────────
// State class
// ─────────────────────────────────────────────

enum PaticcaViewTab { list, flowchart, threeKiep }
enum ChainDirection { forward, reverse, none }

@freezed
class PaticcaFlowchartState with _$PaticcaFlowchartState {
  const factory PaticcaFlowchartState({
    /// Node đang được chọn (null = chưa chọn)
    @Default(null) String? selectedNodeId,

    /// Hướng highlight chain
    @Default(ChainDirection.none) ChainDirection chainDirection,

    /// Danh sách node ID đang được highlight
    @Default([]) List<String> highlightedNodeIds,

    /// Tab nội bộ đang hiển thị
    @Default(PaticcaViewTab.list) PaticcaViewTab activeTab,

    /// Filter theo vatta (null = tất cả)
    @Default(null) PaticcaVatta? filterVatta,

    /// Filter theo kiep (null = tất cả)
    @Default(null) PaticcaKiep? filterKiep,

    /// Phase C: animation đang chạy không
    @Default(false) bool isAnimating,
  }) = _PaticcaFlowchartState;
}

// ─────────────────────────────────────────────
// Data provider — load từ JSON (offline-first)
// ─────────────────────────────────────────────

/// Provider trả về toàn bộ 12 chi từ JSON asset
final paticcaListProvider = FutureProvider<List<PaticcaModel>>((ref) async {
  final repo = ref.watch(paticcaRepositoryProvider);
  return repo.getAllPaticcas();
});

/// Provider trả về 1 chi theo ID
final paticcaByIdProvider =
    Provider.family<AsyncValue<PaticcaModel?>, String>((ref, id) {
  return ref.watch(paticcaListProvider).whenData(
        (list) => list.firstWhere(
          (p) => p.id == id,
          orElse: () => throw Exception('PaticcaModel not found: $id'),
        ),
      );
});

// ─────────────────────────────────────────────
// UI State provider
// ─────────────────────────────────────────────

final paticcaFlowchartStateProvider =
    StateNotifierProvider<PaticcaFlowchartNotifier, PaticcaFlowchartState>(
  (ref) => PaticcaFlowchartNotifier(ref),
);

// ─────────────────────────────────────────────
// Computed: filtered list
// ─────────────────────────────────────────────

final paticcaFilteredListProvider = Provider<AsyncValue<List<PaticcaModel>>>(
  (ref) {
    final listAsync = ref.watch(paticcaListProvider);
    final state = ref.watch(paticcaFlowchartStateProvider);

    return listAsync.whenData((list) {
      return list.where((p) {
        final vattaOk =
            state.filterVatta == null || p.vatta == state.filterVatta;
        final kiepOk = state.filterKiep == null || p.kiep == state.filterKiep;
        return vattaOk && kiepOk;
      }).toList();
    });
  },
);

/// Repository provider
final paticcaRepositoryProvider = Provider<PaticcaRepositoryImpl>(
  (ref) => PaticcaRepositoryImpl(),
);
