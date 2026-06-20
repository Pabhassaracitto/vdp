// lib/data/repositories/vdp_repository.dart

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/citta_model.dart';
import '../models/cetasika_model.dart';
import '../../core/validators/data_validator.dart';

enum DataLoadStatus {
  initial,
  loading,
  loaded,
  validationFailed,
  error,
}

class VdpDataState {
  final DataLoadStatus status;
  final List<CittaModel> cittas;
  final List<CetasikaModel> cetasikas;
  final ValidationResult? validationResult;
  final String? errorMessage;

  const VdpDataState({
    this.status = DataLoadStatus.initial,
    this.cittas = const [],
    this.cetasikas = const [],
    this.validationResult,
    this.errorMessage,
  });

  VdpDataState copyWith({
    DataLoadStatus? status,
    List<CittaModel>? cittas,
    List<CetasikaModel>? cetasikas,
    ValidationResult? validationResult,
    String? errorMessage,
  }) {
    return VdpDataState(
      status: status ?? this.status,
      cittas: cittas ?? this.cittas,
      cetasikas: cetasikas ?? this.cetasikas,
      validationResult: validationResult ?? this.validationResult,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isReady => status == DataLoadStatus.loaded;
  bool get hasValidationWarnings => validationResult?.hasWarnings ?? false;
}

class VdpRepository extends StateNotifier<VdpDataState> {
  VdpRepository() : super(const VdpDataState());

  Future<void> initialize() async {
    if (state.status == DataLoadStatus.loading || state.status == DataLoadStatus.loaded) {
      return;
    }
    debugPrint('VDP ▶ initialize() start');
    state = state.copyWith(status: DataLoadStatus.loading);
    
    // Bọc toàn bộ trong try/catch lớn nhất
    // Đảm bảo state LUÔN được set về loaded hoặc error
    try {
      final cittas = await _loadCittas();
      final cetasikas = await _loadCetasikas();
      // Debug orderIndex của cittas ngay sau khi load, trước khi validate, để dễ phát hiện lỗi dữ liệu
      _debugCittaOrderIndexes(cittas);
      // Validate
      ValidationResult? validation;
      if (cittas.isNotEmpty && cetasikas.isNotEmpty) {
        try {
          validation = VdpDataValidator.validateAll(
            cittas: cittas,
            cetasikas: cetasikas,
          );
          debugPrint('VDP ▶ validation done, '
              'valid=${validation.isValid}, '
              'errors=${validation.errors.length}, '
              'warnings=${validation.warnings.length}');

          if (!validation.isValid) {
            state = state.copyWith(
              status: DataLoadStatus.validationFailed,
              validationResult: validation,
              errorMessage: 'Vi phạm quy tắc giáo lý:\n'
                  '${validation.errors.map((e) => '• ${e.message}').join('\n')}',
            );
            return;
          }
        } catch (e) {
          // Validate lỗi → vẫn load, bỏ qua validate
          debugPrint('VDP ▶ validate lỗi (bỏ qua): $e');
        }
      }

      debugPrint('VDP ▶ setState loaded — '
          'cittas=${cittas.length}, cetasikas=${cetasikas.length}');

      state = state.copyWith(
        status: DataLoadStatus.loaded,
        cittas: cittas,
        cetasikas: cetasikas,
        validationResult: validation,
        errorMessage: cittas.isEmpty && cetasikas.isEmpty
            ? 'Chưa có dữ liệu — kiểm tra assets/data/'
            : null,
      );

      debugPrint('VDP ▶ initialize() DONE ✓');
      debugPrint('VDP ▶ Loaded cittas: ${cittas.length}');
debugPrint('VDP ▶ Loaded cetasikas: ${cetasikas.length}');
    } catch (e, st) {
      debugPrint('VDP ▶ initialize() FATAL: $e\n$st');
      // Dù lỗi gì → state = error, KHÔNG để status = loading mãi
      state = state.copyWith(
        status: DataLoadStatus.error,
        errorMessage: 'Lỗi khởi tạo: $e',
      );
    }
  }
  

  // ── Load helpers ───────────────────────────────────────────────

  Future<List<CittaModel>> _loadCittas() async {
    try {
      debugPrint('VDP ▶ loading cittas.json...');
      final raw = await rootBundle.loadString('assets/data/cittas.json');
      debugPrint('VDP ▶ cittas raw length: ${raw.length}');

      final decoded = json.decode(raw);
      debugPrint('VDP ▶ cittas decoded type: ${decoded.runtimeType}');

      final list = (decoded as Map<String, dynamic>)['cittas'] as List?;
      if (list == null) {
        debugPrint('VDP ▶ cittas: key "cittas" không tồn tại');
        return [];
      }

      final cittas = <CittaModel>[];
      for (var i = 0; i < list.length; i++) {
        try {
          cittas.add(
            CittaModel.fromJson(list[i] as Map<String, dynamic>),
          );
        } catch (e) {
          debugPrint('VDP ▶ cittas[$i] parse lỗi: $e');
          // Bỏ qua item lỗi, tiếp tục
        }
      }
      debugPrint('VDP ▶ cittas loaded: ${cittas.length}/${list.length}');
      return cittas;
    } on FlutterError catch (e) {
      debugPrint('VDP ▶ cittas.json không tìm thấy: $e');
      return [];
    } catch (e) {
      debugPrint('VDP ▶ cittas load lỗi khác: $e');
      return [];
    }
  }

  Future<List<CetasikaModel>> _loadCetasikas() async {
    try {
      debugPrint('VDP ▶ loading cetasikas.json...');
      final raw = await rootBundle.loadString('assets/data/cetasikas.json');
      debugPrint('VDP ▶ cetasikas raw length: ${raw.length}');

      final decoded = json.decode(raw);
      debugPrint('VDP ▶ cetasikas decoded type: ${decoded.runtimeType}');

      final list = (decoded as Map<String, dynamic>)['cetasikas'] as List?;
      if (list == null) {
        debugPrint('VDP ▶ cetasikas: key "cetasikas" không tồn tại');
        return [];
      }

      final cetasikas = <CetasikaModel>[];
      for (var i = 0; i < list.length; i++) {
        try {
          cetasikas.add(
            CetasikaModel.fromJson(list[i] as Map<String, dynamic>),
          );
        } catch (e) {
          debugPrint('VDP ▶ cetasikas[$i] parse lỗi: $e');
        }
      }
      debugPrint('VDP ▶ cetasikas loaded: ${cetasikas.length}/${list.length}');
      return cetasikas;
    } on FlutterError catch (e) {
      debugPrint('VDP ▶ cetasikas.json không tìm thấy: $e');
      return [];
    } catch (e) {
      debugPrint('VDP ▶ cetasikas load lỗi khác: $e');
      return [];
    }
  }

  // ── Query methods (giữ nguyên) ────────────────────────────────

  List<CittaModel> getCittasByBhumi(BhumiGroup bhumi) {
    return state.cittas.where((c) => c.bhumiGroup == bhumi).toList()
      ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
  }

  List<CetasikaModel> getCetasikasByGroup(CetasikaGroup group) {
    return state.cetasikas.where((c) => c.group == group).toList()
      ..sort((a, b) => a.traditionalOrder.compareTo(b.traditionalOrder));
  }

  AssociationType getAssociationType(String cittaId, String cetasikaId) {
    final citta = state.cittas.where((c) => c.id == cittaId).firstOrNull;
    if (citta == null) return AssociationType.never;
    final assoc = citta.cetasikaAssociations
        .where((a) => a.cetasikaId == cetasikaId)
        .firstOrNull;
    return assoc?.type ?? AssociationType.never;
  }

  List<dynamic> search(String query) {
    final q = query.toLowerCase();
    final results = <dynamic>[];
    results.addAll(state.cittas.where((c) =>
        c.nameVietnamese.toLowerCase().contains(q) ||
        c.namePali.toLowerCase().contains(q)));
    results.addAll(state.cetasikas.where((c) =>
        c.nameVietnamese.toLowerCase().contains(q) ||
        c.namePali.toLowerCase().contains(q)));
    return results;
  }

  Set<String> getDimmedCetasikas(String selectedCetasikaId) {
    final selected =
        state.cetasikas.where((c) => c.id == selectedCetasikaId).firstOrNull;
    if (selected == null) return {};
    final dimmed = <String>{};
    for (final rule in selected.conflictRules) {
      dimmed.addAll(rule.conflictingIds);
    }
    for (final cetasika in state.cetasikas) {
      for (final rule in cetasika.conflictRules) {
        if (rule.conflictingIds.contains(selectedCetasikaId)) {
          dimmed.add(cetasika.id);
        }
      }
    }
    return dimmed;
  }
  void _debugCittaOrderIndexes(List<CittaModel> cittas) {
  if (cittas.isEmpty) {
    debugPrint('VDP ▶ No cittas loaded');
    return;
  }

  final indexes = cittas.map((e) => e.orderIndex).toList()..sort();

  final seen = <int>{};
  final duplicates = <int>[];

  for (final idx in indexes) {
    if (!seen.add(idx) && !duplicates.contains(idx)) {
      duplicates.add(idx);
    }
  }

  final missing1To121 = <int>[];
  for (var i = 1; i <= 121; i++) {
    if (!seen.contains(i)) {
      missing1To121.add(i);
    }
  }

  final outOfRange = indexes.where((e) => e < 1 || e > 121).toList();

  debugPrint('VDP ▶ Loaded cittas: ${cittas.length}');
  debugPrint('VDP ▶ orderIndex min=${indexes.first}, max=${indexes.last}, unique=${seen.length}');
  debugPrint('VDP ▶ duplicate orderIndex: ${duplicates.isEmpty ? 'none' : duplicates}');
  debugPrint('VDP ▶ missing orderIndex 1..121: ${missing1To121.isEmpty ? 'none' : missing1To121}');
  debugPrint('VDP ▶ out-of-range orderIndex: ${outOfRange.isEmpty ? 'none' : outOfRange}');
  debugPrint('VDP ▶ first 20 indexes: ${indexes.take(20).toList()}');

  final last20Start = indexes.length > 20 ? indexes.length - 20 : 0;
  debugPrint('VDP ▶ last 20 indexes: ${indexes.skip(last20Start).toList()}');
}
}

final vdpRepositoryProvider =
    StateNotifierProvider<VdpRepository, VdpDataState>(
  (ref) => VdpRepository(),
);

final cittasProvider = Provider<List<CittaModel>>((ref) {
  return ref.watch(vdpRepositoryProvider).cittas;
});

final cetasikasProvider = Provider<List<CetasikaModel>>((ref) {
  return ref.watch(vdpRepositoryProvider).cetasikas;
});

final dataReadyProvider = Provider<bool>((ref) {
  return ref.watch(vdpRepositoryProvider).isReady;
});
