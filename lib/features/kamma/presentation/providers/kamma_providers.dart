// lib/features/kamma/presentation/providers/kamma_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/kamma_model.dart';
import '../../../../data/models/citta_model.dart';
import '../../../../domain/enums/kamma_group.dart';
import '../../../../data/repositories/vdp_repository.dart';

/// Tất cả 12 Kamma
final allKammasProvider = FutureProvider<List<KammaModel>>((ref) {
  final repo = ref.watch(vdpRepositoryProvider.notifier);
  return repo.getAllKammas();
});

/// Kamma theo nhóm phân loại
final kammasByGroupProvider =
    FutureProvider.family<List<KammaModel>, KammaGroup>((ref, group) {
  final repo = ref.watch(vdpRepositoryProvider.notifier);
  return repo.getKammasByGroup(group);
});

/// Kamma chi tiết theo ID
final kammaByIdProvider = FutureProvider.family<KammaModel?, String>((ref, id) {
  final repo = ref.watch(vdpRepositoryProvider.notifier);
  return repo.getKammaById(id);
});

/// Danh sách Kamma liên quan đến 1 Citta
final kammasByCittaProvider =
    FutureProvider.family<List<KammaModel>, String>((ref, cittaId) {
  final repo = ref.watch(vdpRepositoryProvider.notifier);
  return repo.getKammasByCitta(cittaId);
});

/// Danh sách Citta tạo được 1 loại Kamma
final cittasByKammaProvider =
    FutureProvider.family<List<CittaModel>, String>((ref, kammaId) {
  final repo = ref.watch(vdpRepositoryProvider.notifier);
  return repo.getCittasByKamma(kammaId);
});

/// Tab filter state cho KammaListScreen
final selectedKammaGroupProvider =
    StateProvider<KammaGroup>((ref) => KammaGroup.byTime);
