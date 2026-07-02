// lib/data/models/kamma_model.dart
// Model cho các loại Nghiệp (Kamma) — 12 loại chính theo 3 tiêu chí
// (Thời gian × 4, Phận sự × 4, Ưu tiên × 4)

import 'package:freezed_annotation/freezed_annotation.dart';

part 'kamma_model.freezed.dart';
part 'kamma_model.g.dart';

// ---------------------------------------------------------------------------
// Enums — tất cả có @JsonValue() theo chuẩn dự án
// ---------------------------------------------------------------------------

/// Phân loại Nghiệp theo THỜI GIAN cho quả (Pāka-kāla).
enum KammaByTime {
  @JsonValue('ditthadhammavedaniya') ditthadhammavedaniya, // Hiện báo nghiệp
  @JsonValue('upapajjavedaniya')     upapajjavedaniya,     // Hậu báo nghiệp
  @JsonValue('aparapariyavedaniya')  aparapariyavedaniya,  // Hậu hậu báo nghiệp
  @JsonValue('ahosi')                ahosi,                // Vô hiệu nghiệp
}

/// Phân loại Nghiệp theo PHẬN SỰ (Kicca).
enum KammaByFunction {
  @JsonValue('janaka')         janaka,         // Sanh nghiệp (tạo quả tục sinh)
  @JsonValue('upatthambhaka')  upatthambhaka,  // Bổ trợ nghiệp
  @JsonValue('upapilaka')      upapilaka,      // Cản trở nghiệp
  @JsonValue('upaghataka')     upaghataka,     // Đoạn đứt nghiệp
}

/// Phân loại Nghiệp theo THỨ TỰ ƯU TIÊN cho quả tục sinh (Pāka-ṭhāna).
enum KammaByPriority {
  @JsonValue('garuka')  garuka,  // Trọng nghiệp (thiền chứng / ngũ nghịch)
  @JsonValue('asanna')  asanna,  // Cận tử nghiệp
  @JsonValue('acinna')  acinna,  // Thường nghiệp / Tích luỹ nghiệp
  @JsonValue('katatta') katatta, // Dồn tích nghiệp (tất cả nghiệp còn lại)
}

/// Phân loại Nghiệp theo CHỖ CHO QUẢ (Bhūmi).
enum KammaByResult {
  @JsonValue('akusala')       akusala,       // Cho quả 4 cảnh khổ
  @JsonValue('kusala_duggati') kusalaDuggati, // Cho quả cõi người & chư thiên DG
  @JsonValue('kusala_uggata')  kusalaUggata,  // Cho quả cõi Đáo Đại (SG / VSG)
  @JsonValue('lokuttara')     lokuttara,     // Cho quả Niết Bàn (Đạo + Quả)
}

// ---------------------------------------------------------------------------
// Main Model
// ---------------------------------------------------------------------------

@freezed
class KammaModel with _$KammaModel {
  const factory KammaModel({
    // ID định danh, format: KM_T_01 (Thời gian), KM_P_01 (Phận sự),
    //                       KM_U_01 (Ưu tiên), KM_Q_01 (Quả)
    required String id,

    // Tên Pāḷi (có dấu macron)
    required String namePali,

    // Tên tiếng Việt đầy đủ
    required String nameVietnamese,

    // Tên viết tắt hiển thị
    required String nameShort,

    // Nhóm phân loại — chỉ 1 trong 4 nhóm có giá trị, 3 còn lại null
    required KammaByTime? byTime,
    required KammaByFunction? byFunction,
    required KammaByPriority? byPriority,
    required KammaByResult? byResult,

    // Số thứ tự trong nhóm của nó (1-based)
    required int orderIndex,

    // Mô tả tiếng Việt (trích từ giáo trình King Milanda A)
    required String descriptionVi,

    // Ví dụ minh hoạ
    @Default([]) List<String> examples,

    // Citta IDs liên quan (tâm nào tạo nghiệp này)
    @Default([]) List<String> relatedCittaIds,

    // Ghi chú giáo lý
    String? doctrinalNote,
  }) = _KammaModel;

  factory KammaModel.fromJson(Map<String, dynamic> json) =>
      _$KammaModelFromJson(json);
}
