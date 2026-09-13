// lib/data/models/paccaya_model.dart
// Model cho 24 Duyên Hệ (Paṭṭhāna naya — Định Luật Duyên Hệ Tương Quan).
//
// LƯU Ý KỸ THUẬT: model này viết tay (không dùng freezed/json_serializable) vì
// `build_runner` không thể chạy trong môi trường không có Flutter SDK.
// Cấu trúc từ khoá khớp 1-1 với `assets/data/paccayas.json`; nếu sau này muốn
// chuyển sang freezed thì chỉ cần thay phần `fromJson` bằng codegen.
//
// Nguồn dữ liệu: xem `meta.sourcePolicy` trong assets/data/paccayas.json và
// docs/study-content-sources.md (mục M8_NHAN_DUYEN → 24 Duyên Hệ).

/// Nhóm lọc hiển thị trong UI. Đây là phân nhóm sư phạm do ứng dụng đặt ra,
/// KHÔNG phải phân loại gốc của Paṭṭhāna — thứ tự gốc nằm ở [PaccayaModel.order].
enum PaccayaGroup {
  rootObject('root_object'),
  continuity('continuity'),
  conascence('conascence'),
  timeRelation('time_relation'),
  kammaVipaka('kamma_vipaka'),
  general('general');

  const PaccayaGroup(this.wireValue);

  final String wireValue;

  static PaccayaGroup parse(Object? value) {
    for (final group in PaccayaGroup.values) {
      if (group.wireValue == value) return group;
    }
    return PaccayaGroup.general;
  }
}

/// Một chi phần nhỏ của duyên (vd: Cảnh trưởng / Câu sanh trưởng).
class PaccayaSubdivision {
  final String namePali;
  final String nameVi;
  final String note;

  const PaccayaSubdivision({
    required this.namePali,
    required this.nameVi,
    this.note = '',
  });

  factory PaccayaSubdivision.fromJson(Map<String, dynamic> json) {
    return PaccayaSubdivision(
      namePali: json['namePali'] as String? ?? '',
      nameVi: json['nameVi'] as String? ?? '',
      note: json['note'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'namePali': namePali,
        'nameVi': nameVi,
        'note': note,
      };
}

/// Tham chiếu nguồn học liệu cho một duyên.
class PaccayaSourceRef {
  final String source;
  final String locator;

  /// `canonical` (Paṭṭhāna), `commentarial` (Thanh Tịnh Đạo / Sớ giải),
  /// `secondary` (bản dịch / giáo trình hiện đại).
  final String confidence;

  const PaccayaSourceRef({
    required this.source,
    required this.locator,
    this.confidence = 'secondary',
  });

  factory PaccayaSourceRef.fromJson(Map<String, dynamic> json) {
    return PaccayaSourceRef(
      source: json['source'] as String? ?? '',
      locator: json['locator'] as String? ?? '',
      confidence: json['confidence'] as String? ?? 'secondary',
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'source': source,
        'locator': locator,
        'confidence': confidence,
      };

  String describe() => locator.isEmpty ? source : '$source — $locator';
}

/// 1 object = 1 duyên trong 24 duyên hệ.
class PaccayaModel {
  final String id;
  final int order;
  final String namePali;
  final String nameVietnamese;
  final String nameShort;
  final String nameEnglish;
  final PaccayaGroup group;
  final String definitionVi;

  /// Pháp làm năng duyên (paccaya-dhamma).
  final String paccayaDhamma;

  /// Pháp được duyên (paccayuppanna).
  final String paccayuppanna;

  /// Công thức Pāḷi gốc trong Paccayaniddesa (chỉ có ở một số duyên đã đối chiếu).
  final String? paliFormula;

  final List<PaccayaSubdivision> subdivisions;
  final List<String> examples;

  /// Các chi Thập Nhị Nhân Duyên mà duyên này vận hành (theo Thanh Tịnh Đạo XVII).
  final List<String> operatesInPaticca;

  final List<String> relatedCittaIds;
  final List<String> relatedCetasikaIds;
  final String? doctrinalNote;
  final List<PaccayaSourceRef> sourceRefs;

  const PaccayaModel({
    required this.id,
    required this.order,
    required this.namePali,
    required this.nameVietnamese,
    required this.nameShort,
    required this.nameEnglish,
    required this.group,
    required this.definitionVi,
    required this.paccayaDhamma,
    required this.paccayuppanna,
    this.paliFormula,
    this.subdivisions = const [],
    this.examples = const [],
    this.operatesInPaticca = const [],
    this.relatedCittaIds = const [],
    this.relatedCetasikaIds = const [],
    this.doctrinalNote,
    this.sourceRefs = const [],
  });

  factory PaccayaModel.fromJson(Map<String, dynamic> json) {
    return PaccayaModel(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      namePali: json['namePali'] as String? ?? '',
      nameVietnamese: json['nameVietnamese'] as String? ?? '',
      nameShort: json['nameShort'] as String? ?? '',
      nameEnglish: json['nameEnglish'] as String? ?? '',
      group: PaccayaGroup.parse(json['group']),
      definitionVi: json['definitionVi'] as String? ?? '',
      paccayaDhamma: json['paccayaDhamma'] as String? ?? '',
      paccayuppanna: json['paccayuppanna'] as String? ?? '',
      paliFormula: json['paliFormula'] as String?,
      subdivisions: _listOfMaps(json['subdivisions'])
          .map(PaccayaSubdivision.fromJson)
          .toList(),
      examples: _listOfStrings(json['examples']),
      operatesInPaticca: _listOfStrings(json['operatesInPaticca']),
      relatedCittaIds: _listOfStrings(json['relatedCittaIds']),
      relatedCetasikaIds: _listOfStrings(json['relatedCetasikaIds']),
      doctrinalNote: json['doctrinalNote'] as String?,
      sourceRefs: _listOfMaps(json['sourceRefs'])
          .map(PaccayaSourceRef.fromJson)
          .toList(),
    );
  }

  static List<Map<String, dynamic>> _listOfMaps(Object? raw) {
    if (raw is! List) return const [];
    return raw.whereType<Map<String, dynamic>>().toList();
  }

  static List<String> _listOfStrings(Object? raw) {
    if (raw is! List) return const [];
    return raw.whereType<String>().toList();
  }

  bool get hasCanonicalSource =>
      sourceRefs.any((ref) => ref.confidence == 'canonical');
}
