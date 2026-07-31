// lib/features/paticca/data/paticca_repository_impl.dart
import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../data/models/paticca_model.dart';

class PaticcaRepositoryImpl {
  Future<List<PaticcaModel>> getAllPaticcas() async {
    final raw = await rootBundle.loadString('assets/data/paticca.json');
    final decoded = json.decode(raw) as Map<String, dynamic>;
    final list = (decoded['paticcas'] as List)
        .map((e) => PaticcaModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }
}
