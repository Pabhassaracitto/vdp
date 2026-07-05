// lib/data/repositories/vithi_repository.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/vithi_model.dart';

class VithiRepository {
  List<VithiModel>? _cache;

  Future<List<VithiModel>> loadAll() async {
    if (_cache != null) return _cache!;

    final jsonStr = await rootBundle.loadString('assets/data/vithis.json');
    final jsonMap = json.decode(jsonStr) as Map<String, dynamic>;
    final list = (jsonMap['vithis'] as List)
        .map((e) => VithiModel.fromJson(e as Map<String, dynamic>))
        .toList();

    list.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    _cache = list;
    return _cache!;
  }

  Future<VithiModel?> getByDvara(VithiDvara dvara) async {
    final all = await loadAll();
    try {
      return all.firstWhere((v) => v.dvara == dvara);
    } catch (_) {
      return null;
    }
  }

  Future<VithiModel?> getVithiByType(String type) async {
    final all = await loadAll();
    try {
      return all.firstWhere(
        (v) => v.vithiType.name == type || v.id == type,
      );
    } catch (_) {
      return null;
    }
  }
}

final vithiRepositoryProvider = Provider<VithiRepository>(
  (ref) => VithiRepository(),
);
