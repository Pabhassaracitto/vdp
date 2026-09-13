// lib/features/paticca/data/paticca_repository_impl.dart
import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../data/models/paccaya_model.dart';
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

  /// 24 Duyên Hệ (Paṭṭhāna naya — phần B của Paccaya-saṅgaha-vibhāga).
  ///
  /// Trả về rỗng khi asset thiếu hoặc lỗi JSON — UI sẽ hiện trạng thái
  /// "chưa có dữ liệu" thay vì crash.
  Future<List<PaccayaModel>> getAllPaccayas() async {
    try {
      final raw = await rootBundle.loadString('assets/data/paccayas.json');
      final decoded = json.decode(raw) as Map<String, dynamic>;
      final list = decoded['paccayas'];
      if (list is! List) return const [];
      final parsed = list
          .whereType<Map<String, dynamic>>()
          .map(PaccayaModel.fromJson)
          .toList();
      // Paṭṭhāna luôn liệt kê theo đúng thứ tự 1 → 24; sắp xếp lại để kết quả
      // không phụ thuộc thứ tự vật lý của file JSON.
      parsed.sort((a, b) => a.order.compareTo(b.order));
      return parsed;
    } catch (_) {
      return const [];
    }
  }
}
