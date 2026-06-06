// lib/data/models/citta_model.dart
// Model for Tâm (Consciousness/Citta) - 121 types

import 'package:freezed_annotation/freezed_annotation.dart';

part 'citta_model.freezed.dart';
part 'citta_model.g.dart';

/// Cảnh thọ (Vedana / Feeling tone)
enum Vedana {
  @JsonValue('pleasant') pleasant,       // Lạc thọ
  @JsonValue('unpleasant') unpleasant,   // Khổ thọ
  @JsonValue('neutral') neutral,         // Xả thọ
  @JsonValue('joy') joy,                 // Hỷ thọ (Piti-vedana, dạng tâm lý)
}

/// Cõi giới của tâm
enum BhumiGroup {
  @JsonValue('akusala') akusala,           // Bất Thiện
  @JsonValue('ahetuka') ahetuka,           // Vô Nhân
  @JsonValue('sobhana_kamavacara') sobhanaKamavacara, // Tịnh Hảo Dục Giới
  @JsonValue('rupavacara') rupavacara,     // Sắc Giới
  @JsonValue('arupavacara') arupavacara,   // Vô Sắc Giới
  @JsonValue('lokuttara') lokuttara,       // Siêu Thế
}

/// Loại tâm theo chức năng
enum CittaFunction {
  @JsonValue('vipaka') vipaka,       // Quả
  @JsonValue('kiriya') kiriya,       // Duy Tác
  @JsonValue('kusala') kusala,       // Thiện
  @JsonValue('akusala') akusala,     // Bất Thiện
}

/// Loại phối hợp Tâm - Tâm Sở
enum AssociationType {
  @JsonValue('always') always,       // Luôn phối hợp (cố định)
  @JsonValue('sometimes') sometimes, // Có thể có (bất định)
  @JsonValue('never') never,         // Không phối hợp
}

@freezed
class CetasikaAssociation with _$CetasikaAssociation {
  const factory CetasikaAssociation({
    required String cetasikaId,
    required AssociationType type,
    String? note, // Ghi chú đặc biệt (vd: "tùy duyên", "sometimes in anger")
  }) = _CetasikaAssociation;

  factory CetasikaAssociation.fromJson(Map<String, dynamic> json) =>
      _$CetasikaAssociationFromJson(json);
}

@freezed
class VatthurSaca with _$VatthurSaca {
  const factory VatthurSaca({
    required String vattuId,       // Vật chất căn cứ (vatthu)
    List<String>? rupaSampayutta,  // Sắc do tâm tạo
  }) = _VatthurSaca;

  factory VatthurSaca.fromJson(Map<String, dynamic> json) =>
      _$VatthurSacaFromJson(json);
}

@freezed
class CittaModel with _$CittaModel {
  const factory CittaModel({
    required String id,
    required String namePali,
    required String nameVietnamese,
    required BhumiGroup bhumiGroup,
    required CittaFunction function,
    required Vedana vedana,
    required List<CetasikaAssociation> cetasikaAssociations,
    
    // Liên kết Nghiệp (N-M)
    @Default([]) List<String> kammaLinks,
    
    // Vật chất liên quan
    VatthurSaca? vatthurSaca,
    
    // Module thuộc về (Study Graph)
    required String moduleId,
    
    // Số thứ tự trong nhóm
    required int orderIndex,
    
    // Ghi chú giáo lý
    String? doctrinalNote,
    
    // Ví dụ thực tế
    List<String>? examples,
  }) = _CittaModel;

  factory CittaModel.fromJson(Map<String, dynamic> json) =>
      _$CittaModelFromJson(json);
}
