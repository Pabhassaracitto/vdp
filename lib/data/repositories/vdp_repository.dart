// lib/data/repositories/vdp_repository.dart

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/validators/data_validator.dart';
import '../models/cetasika_model.dart';
import '../models/citta_model.dart';
import '../models/kamma_model.dart';
import '../models/paticca_model.dart';
import '../models/rupa_model.dart';
import '../models/vithi_model.dart';
import '../../domain/enums/kamma_group.dart';

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
  final List<RupaModel> rupas;
  final List<KammaModel> kammas;
  final List<PaticcaModel> paticcas;
  final List<VithiModel> vithis;
  final ValidationResult? validationResult;
  final String? errorMessage;

  const VdpDataState({
    this.status = DataLoadStatus.initial,
    this.cittas = const [],
    this.cetasikas = const [],
    this.rupas = const [],
    this.kammas = const [],
    this.paticcas = const [],
    this.vithis = const [],
    this.validationResult,
    this.errorMessage,
  });

  VdpDataState copyWith({
    DataLoadStatus? status,
    List<CittaModel>? cittas,
    List<CetasikaModel>? cetasikas,
    List<RupaModel>? rupas,
    List<KammaModel>? kammas,
    List<PaticcaModel>? paticcas,
    List<VithiModel>? vithis,
    ValidationResult? validationResult,
    String? errorMessage,
  }) {
    return VdpDataState(
      status: status ?? this.status,
      cittas: cittas ?? this.cittas,
      cetasikas: cetasikas ?? this.cetasikas,
      rupas: rupas ?? this.rupas,
      kammas: kammas ?? this.kammas,
      paticcas: paticcas ?? this.paticcas,
      vithis: vithis ?? this.vithis,
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
    if (state.status == DataLoadStatus.loading ||
        state.status == DataLoadStatus.loaded) {
      return;
    }
    state = state.copyWith(status: DataLoadStatus.loading);

    try {
      final results = await Future.wait([
        _loadCittas(),
        _loadCetasikas(),
        _loadRupas(),
        _loadKammas(),
        _loadPaticcas(),
        _loadVithis(),
      ]);

      final cittas = results[0] as List<CittaModel>;
      final cetasikas = results[1] as List<CetasikaModel>;
      final rupas = results[2] as List<RupaModel>;
      final kammas = results[3] as List<KammaModel>;
      final paticcas = results[4] as List<PaticcaModel>;
      final vithis = results[5] as List<VithiModel>;

      ValidationResult? validation;
      if (cittas.isNotEmpty && cetasikas.isNotEmpty) {
        try {
          validation = VdpDataValidator.validateAll(
            cittas: cittas,
            cetasikas: cetasikas,
          );

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
        }
      }

      state = state.copyWith(
        status: DataLoadStatus.loaded,
        cittas: cittas,
        cetasikas: cetasikas,
        rupas: rupas,
        kammas: kammas,
        paticcas: paticcas,
        vithis: vithis,
        validationResult: validation,
        errorMessage: cittas.isEmpty && cetasikas.isEmpty
            ? 'Chưa có dữ liệu — kiểm tra assets/data/'
            : null,
      );
    } catch (e, st) {
      debugPrint('VDP ▶ initialize() FATAL: $e\n$st');
      state = state.copyWith(
        status: DataLoadStatus.error,
        errorMessage: 'Lỗi khởi tạo: $e',
      );
    }
  }

  // ── Load helpers ───────────────────────────────────────────────

  Future<List<CittaModel>> _loadCittas() async {
    try {
      final raw = await rootBundle.loadString('assets/data/cittas.json');
      final decoded = json.decode(raw);
      final list = (decoded as Map<String, dynamic>)['cittas'] as List?;
      if (list == null) return [];
      return list
          .map((e) => CittaModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('VDP ▶ cittas load lỗi: $e');
      return [];
    }
  }

  Future<List<CetasikaModel>> _loadCetasikas() async {
    try {
      final raw = await rootBundle.loadString('assets/data/cetasikas.json');
      final decoded = json.decode(raw);
      final list = (decoded as Map<String, dynamic>)['cetasikas'] as List?;
      if (list == null) return [];
      return list
          .map((e) => CetasikaModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('VDP ▶ cetasikas load lỗi: $e');
      return [];
    }
  }

  Future<List<RupaModel>> _loadRupas() async {
    try {
      final raw = await rootBundle.loadString('assets/data/rupas.json');
      final decoded = json.decode(raw);
      final list = (decoded as Map<String, dynamic>)['rupas'] as List?;
      if (list == null) return [];
      return list
          .map((e) => RupaModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('VDP ▶ rupas load lỗi: $e');
      return [];
    }
  }

  Future<List<KammaModel>> _loadKammas() async {
    try {
      final raw = await rootBundle.loadString('assets/data/kammas.json');
      final decoded = json.decode(raw);
      final list = (decoded as Map<String, dynamic>)['kammas'] as List?;
      if (list == null) return [];
      return list
          .map((e) => KammaModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('VDP ▶ kammas load lỗi: $e');
      return [];
    }
  }

  Future<List<PaticcaModel>> _loadPaticcas() async {
    try {
      final raw = await rootBundle.loadString('assets/data/paticca.json');
      final decoded = json.decode(raw);
      final list = (decoded as Map<String, dynamic>)['paticcas'] as List?;
      if (list == null) return [];
      return list
          .map((e) => PaticcaModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('VDP ▶ paticcas load lỗi: $e');
      return [];
    }
  }

  Future<List<VithiModel>> _loadVithis() async {
    try {
      final raw = await rootBundle.loadString('assets/data/vithis.json');
      final decoded = json.decode(raw);
      final list = (decoded as Map<String, dynamic>)['vithis'] as List?;
      if (list == null) return [];
      return list
          .map((e) => VithiModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      debugPrint('VDP ▶ vithis load lỗi: $e');
      return [];
    }
  }

  // ── Query methods (giữ nguyên) ────────────────────────────────

  // --- Kamma Query Methods (M5-T2) ---
  
  List<KammaModel> getAllKammas() => state.kammas;

  List<KammaModel> getKammasByGroup(KammaGroup group) {
    return state.kammas.where((k) {
      switch (group) {
        case KammaGroup.byTime:     return k.byTime != null;
        case KammaGroup.byFunction: return k.byFunction != null;
        case KammaGroup.byPriority: return k.byPriority != null;
        case KammaGroup.byResult:   return k.byResult != null;
      }
      return false;
    }).toList();
  }

  KammaModel? getKammaById(String id) {
    return state.kammas.where((k) => k.id == id).firstOrNull;
  }

  List<KammaModel> getKammasByCitta(String cittaId) {
    final citta = state.cittas.where((c) => c.id == cittaId).firstOrNull;
    if (citta == null) return [];
    final linkedKammaIds = citta.kammaLinks;
    return state.kammas.where((k) => linkedKammaIds.contains(k.id)).toList()
      ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
  }

  List<CittaModel> getCittasByKamma(String kammaId) {
    return state.cittas.where((c) => c.kammaLinks.contains(kammaId)).toList()
      ..sort((a,b) => a.id.compareTo(b.id));
  }

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
}

final vdpRepositoryProvider =
    StateNotifierProvider<VdpRepository, VdpDataState>(
  (ref) => VdpRepository(),
);

// Thêm export cho các method của Repository nếu cần thiết
// Hiện tại tôi đang gọi trực tiếp qua ref.watch(vdpRepositoryProvider.notifier)


final cittasProvider = Provider<List<CittaModel>>((ref) {
  return ref.watch(vdpRepositoryProvider).cittas;
});

final cetasikasProvider = Provider<List<CetasikaModel>>((ref) {
  return ref.watch(vdpRepositoryProvider).cetasikas;
});

final dataReadyProvider = Provider<bool>((ref) {
  return ref.watch(vdpRepositoryProvider).isReady;
});
