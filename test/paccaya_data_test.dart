import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vdp_app/data/models/paccaya_model.dart';

/// Data guard cho 24 Duyên Hệ (Paṭṭhāna naya) — `assets/data/paccayas.json`.
///
/// Accuracy-First (blueprint.md): dữ liệu giáo lý sai không được lọt vào app.
/// Danh sách 24 duyên được viết cứng ở đây theo đúng thứ tự Paccayuddesa của
/// Paṭṭhāna để một lỗi đánh máy hoặc xáo thứ tự trong JSON bị chặn lại.
const _canonicalPaccayaNames = <String>[
  'Hetu-paccaya',
  'Ārammaṇa-paccaya',
  'Adhipati-paccaya',
  'Anantara-paccaya',
  'Samanantara-paccaya',
  'Sahajāta-paccaya',
  'Aññamañña-paccaya',
  'Nissaya-paccaya',
  'Upanissaya-paccaya',
  'Purejāta-paccaya',
  'Pacchājāta-paccaya',
  'Āsevana-paccaya',
  'Kamma-paccaya',
  'Vipāka-paccaya',
  'Āhāra-paccaya',
  'Indriya-paccaya',
  'Jhāna-paccaya',
  'Magga-paccaya',
  'Sampayutta-paccaya',
  'Vippayutta-paccaya',
  'Atthi-paccaya',
  'Natthi-paccaya',
  'Vigata-paccaya',
  'Avigata-paccaya',
];

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final raw = json.decode(File('assets/data/paccayas.json').readAsStringSync())
      as Map<String, dynamic>;
  final list = (raw['paccayas'] as List<dynamic>).cast<Map<String, dynamic>>();
  final models = list.map(PaccayaModel.fromJson).toList()
    ..sort((a, b) => a.order.compareTo(b.order));

  final cetasikaIds = _ids('cetasikas');
  final cittaIds = _ids('cittas');
  // The 12-links dataset file is `paticca.json` (singular) with key `paticcas`.
  final paticcaIds = _ids('paticca', 'paticcas');

  test('dataset ships exactly the 24 conditions in canonical order', () {
    expect(models, hasLength(24),
        reason: 'Paṭṭhāna liệt kê đúng 24 duyên');
    expect(models.map((m) => m.namePali).toList(), _canonicalPaccayaNames,
        reason: 'thứ tự phải đúng Paccayuddesa');
    expect(models.map((m) => m.order).toList(),
        List<int>.generate(24, (i) => i + 1));
    expect(models.map((m) => m.id).toSet(), hasLength(24),
        reason: 'id phải duy nhất');
  });

  test('every condition has a Vietnamese name, definition and both dhamma sides',
      () {
    for (final model in models) {
      expect(model.nameVietnamese, isNotEmpty, reason: model.id);
      expect(model.nameShort, isNotEmpty, reason: model.id);
      expect(model.definitionVi, isNotEmpty, reason: model.id);
      expect(model.paccayaDhamma, isNotEmpty,
          reason: '${model.id} thiếu pháp năng duyên');
      expect(model.paccayuppanna, isNotEmpty,
          reason: '${model.id} thiếu pháp sở duyên');
    }
  });

  test('every condition cites at least one canonical source', () {
    for (final model in models) {
      expect(model.sourceRefs, isNotEmpty, reason: model.id);
      expect(model.hasCanonicalSource, isTrue,
          reason: '${model.id} phải dẫn Paṭṭhāna');
    }
  });

  test('cross references resolve against the shipped datasets', () {
    final broken = <String>[];
    for (final model in models) {
      for (final id in model.relatedCetasikaIds) {
        if (!cetasikaIds.contains(id)) broken.add('${model.id} → $id');
      }
      for (final id in model.relatedCittaIds) {
        if (!cittaIds.contains(id)) broken.add('${model.id} → $id');
      }
      for (final id in model.operatesInPaticca) {
        if (!paticcaIds.contains(id)) broken.add('${model.id} → $id');
      }
    }
    expect(broken, isEmpty, reason: 'ID không tồn tại trong dataset: $broken');
  });

  test('source policy is explicit about the missing Pa-Auk document', () {
    final meta = raw['meta'] as Map<String, dynamic>;
    final policy = meta['sourcePolicy'] as String;
    expect(policy, contains('Paṭṭhāna'));
    expect(policy, contains('Visuddhimagga'));
    expect(policy, contains('Pa-Auk'),
        reason: 'phải ghi rõ là không tìm được tài liệu Pa-Auk');
  });
}

Set<String> _ids(String entity, [String? key]) {
  final file = File('assets/data/$entity.json');
  final raw = json.decode(file.readAsStringSync()) as Map<String, dynamic>;
  final list = (raw[key ?? entity] as List<dynamic>? ?? const [])
      .cast<Map<String, dynamic>>();
  return list.map((item) => item['id'] as String).toSet();
}
