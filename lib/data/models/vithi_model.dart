// lib/data/models/vithi_model.dart
// Model cho Lộ Trình Tâm (Citta-vīthi) — 17 sát-na

import 'package:freezed_annotation/freezed_annotation.dart';

part 'vithi_model.freezed.dart';
part 'vithi_model.g.dart';

// ---------------------------------------------------------------------------
// Enums — tất cả có @JsonValue() theo chuẩn dự án
// ---------------------------------------------------------------------------

/// Phân loại Lộ Trình theo loại cửa (Dvāra).
enum VithiDvara {
  @JsonValue('panca')      panca,      // Lộ Ngũ Môn (5 giác quan)
  @JsonValue('mano')       mano,       // Lộ Ý Môn
  @JsonValue('vithimutta') vithimutta, // Ngoài Lộ (Tục Sinh / Hộ Kiếp / Tử)
}

/// Loại lộ theo cảnh mạnh yếu / mục đích.
enum VithiType {
  @JsonValue('atimahanta') atimahanta, // Cảnh rất lớn — đủ 7 Javana + 2 Tadā
  @JsonValue('mahanta')    mahanta,    // Cảnh lớn — đủ 7 Javana, không Tadā
  @JsonValue('paritta')    paritta,    // Cảnh nhỏ — chỉ đến Santīraṇa
  @JsonValue('atiparittā') atiparitta, // Cảnh rất nhỏ — không thành lộ
  @JsonValue('mano_vithi') manoVithi,  // Lộ Ý Môn thuần tuý
  @JsonValue('vithimutta') vithimutta, // Ngoài Lộ
  @JsonValue('appana')     appana,     // Lộ Đắc Thiền (An Chỉ)
  @JsonValue('lokuttara')  lokuttara,  // Lộ Siêu Thế
}

/// Vai trò của từng sát-na trong lộ trình.
enum VithiStepRole {
  @JsonValue('bhavanga_sota')      bhavangaSota,      // Hộ Kiếp (dòng chảy)
  @JsonValue('bhavanga_calana')    bhavangaCalana,    // Hộ Kiếp Rúng Động
  @JsonValue('bhavangupaccheda')   bhavangupaccheda,  // Hộ Kiếp Dứt Dòng
  @JsonValue('panca_dvaravajjana') pancaDvaravajjana, // Khán Ngũ Môn
  @JsonValue('dvipanca_vinnana')   dvipancaVinnana,   // Ngũ Song Thức
  @JsonValue('sampati_cchana')     sampatiCchana,     // Tiếp Thâu
  @JsonValue('santi_rana')         santiRana,         // Quan Sát
  @JsonValue('vott_hapana')        vottHapana,        // Xác Định (Voṭṭhapana)
  @JsonValue('javana')             javana,            // Đổng Tốc (7 sát-na)
  @JsonValue('tada_aramana')       tadAramana,        // Thập Di / Mót
  @JsonValue('mano_dvaravajjana')  manoDvaravajjana,  // Khán Ý Môn
  @JsonValue('patisandhi')         patisandhi,        // Tục Sinh
  @JsonValue('cuti')               cuti,              // Tử
}

// ---------------------------------------------------------------------------
// Sub-model: một sát-na cụ thể trong lộ
// ---------------------------------------------------------------------------

@freezed
class VithiStep with _$VithiStep {
  const factory VithiStep({
    // Số thứ tự sát-na (1-based, Javana đánh số 1–7 bên trong)
    required int stepNumber,

    // Vai trò của sát-na này
    required VithiStepRole role,

    // Tên Pāḷi
    required String namePali,

    // Tên tiếng Việt
    required String nameVietnamese,

    // Mô tả ngắn phận sự
    required String description,

    // Danh sách Citta IDs có thể sanh lên tại sát-na này
    @Default([]) List<String> allowedCittaIds,

    // Số lần lặp lại (-1 = vô số, vd: Bhavaṅga-sota)
    @Default(1) int repeatCount,

    // Sát-na này có thể vắng mặt không (vd: Tadārammaṇa)
    @Default(false) bool isOptional,

    // Ghi chú
    String? doctrinalNote,
  }) = _VithiStep;

  factory VithiStep.fromJson(Map<String, dynamic> json) =>
      _$VithiStepFromJson(json);
}

// ---------------------------------------------------------------------------
// Main Model — 1 object = 1 loại Lộ Trình Tâm
// ---------------------------------------------------------------------------

@freezed
class VithiModel with _$VithiModel {
  const factory VithiModel({
    // ID định danh, vd: VT_NGU_MON_RATLON, VT_Y_MON, VT_VITHIMUTTA
    required String id,

    // Tên Pāḷi của loại lộ trình
    required String namePali,

    // Tên tiếng Việt đầy đủ
    required String nameVietnamese,

    // Tên ngắn hiển thị trong UI
    required String nameShort,

    // Loại cửa
    required VithiDvara dvara,

    // Loại lộ chi tiết
    required VithiType vithiType,

    // Mô tả tổng quan
    required String descriptionVi,

    // Tổng số sát-na định danh trong lộ
    required int totalSteps,

    // Danh sách sát-na theo thứ tự
    required List<VithiStep> steps,

    // Điều kiện để lộ này phát sinh
    String? arisingCondition,

    // Ý nghĩa / kết quả của lộ này
    String? significance,

    // Ghi chú giáo lý
    String? doctrinalNote,

    // Số thứ tự sắp xếp (cho UI)
    @Default(0) int orderIndex,
  }) = _VithiModel;

  factory VithiModel.fromJson(Map<String, dynamic> json) =>
      _$VithiModelFromJson(json);
}
