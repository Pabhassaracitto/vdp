// lib/features/paticca/presentation/providers/paticca_flowchart_state.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import '../../../../data/models/paticca_model.dart';
import 'paticca_providers.dart';

class PaticcaFlowchartNotifier
    extends StateNotifier<PaticcaFlowchartState> {
  final Ref _ref;

  PaticcaFlowchartNotifier(this._ref)
      : super(const PaticcaFlowchartState());

  // ── Tab navigation ──────────────────────────────

  void switchTab(PaticcaViewTab tab) {
    state = state.copyWith(activeTab: tab);
  }

  // ── Node selection ───────────────────────────────

  void selectNode(String nodeId) {
    if (state.selectedNodeId == nodeId) {
      // Tap lần 2 → bỏ chọn
      clearSelection();
      return;
    }
    state = state.copyWith(selectedNodeId: nodeId);
    _recomputeHighlight(nodeId, state.chainDirection);
  }

  void clearSelection() {
    state = state.copyWith(
      selectedNodeId: null,
      highlightedNodeIds: [],
      chainDirection: ChainDirection.none,
    );
  }

  // ── Chain direction ──────────────────────────────

  void setChainDirection(ChainDirection direction) {
    state = state.copyWith(chainDirection: direction);
    if (state.selectedNodeId != null) {
      _recomputeHighlight(state.selectedNodeId!, direction);
    }
  }

  // ── Highlight logic ──────────────────────────────

  void _recomputeHighlight(String nodeId, ChainDirection direction) {
    final listAsync = _ref.read(paticcaListProvider);
    listAsync.whenData((list) {
      final highlighted = <String>{nodeId};

      if (direction == ChainDirection.forward) {
        // Duyệt xuôi: từ nodeId đến cuối chain
        _traverseForward(nodeId, list, highlighted);
      } else if (direction == ChainDirection.reverse) {
        // Duyệt ngược: từ nodeId trở lại đầu chain
        _traverseReverse(nodeId, list, highlighted);
      }

      state = state.copyWith(
        selectedNodeId: nodeId,
        chainDirection: direction,
        highlightedNodeIds: highlighted.toList(),
      );
    });
  }

  void _traverseForward(
    String currentId,
    List<PaticcaModel> list,
    Set<String> result,
  ) {
    final current = list.firstWhereOrNull((p) => p.id == currentId);
    if (current == null || current.effectId == null) return;
    result.add(current.effectId!);
    _traverseForward(current.effectId!, list, result);
  }

  void _traverseReverse(
    String currentId,
    List<PaticcaModel> list,
    Set<String> result,
  ) {
    final current = list.firstWhereOrNull((p) => p.id == currentId);
    if (current == null || current.causeId == null) return;
    result.add(current.causeId!);
    _traverseReverse(current.causeId!, list, result);
  }

  // ── Filters ──────────────────────────────────────

  void setVattaFilter(PaticcaVatta? vatta) {
    state = state.copyWith(filterVatta: vatta);
  }

  void setKiepFilter(PaticcaKiep? kiep) {
    state = state.copyWith(filterKiep: kiep);
  }
}
