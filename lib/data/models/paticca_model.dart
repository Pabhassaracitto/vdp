// lib/data/models/paticca_model.dart
// Model cho 12 chi Thập Nhị Nhân Duyên (Paṭicca-samuppāda)

import 'package:freezed_annotation/freezed_annotation.dart';

part 'paticca_model.freezed.dart';
part 'paticca_model.g.dart';

// ---------------------------------------------------------------------------
// Enums — tất cả có @JsonValue() theo chuẩn dự án
// ---------------------------------------------------------------------------

/// Loại quan hệ nhân-duyên giữa 2 chi liên tiếp.
enum PaticcaRelationType {
  @JsonValue('avijja_sankhara')       avijjaSankhara,       // Vô Minh → Hành
  @JsonValue('sankhara_vinnana')      sankharaVinnana,      // Hành → Thức
  @JsonValue('vinnana_namarupa')      vinnanaNamarupa,      // Thức → Danh Sắc
  @JsonValue('namarupa_salayatana')   namarupaSalayatana,   // Danh Sắc → Lục Nhập
  @JsonValue('salayatana_phassa')     salayatanaPhassa,     // Lục Nhập → Xúc
  @JsonValue('phassa_vedana')         phassaVedana,         // Xúc → Thọ
  @JsonValue('vedana_tanha')          vedanaTanha,          // Thọ → Ái
  @JsonValue('tanha_upadana')         tanhaUpadana,         // Ái → Thủ
  @JsonValue('upadana_bhava')         upadanaBhava,         // Thủ → Hữu
  @JsonValue('bhava_jati')            bhavaJati,            // Hữu → Sanh
  @JsonValue('jati_jaramarana')       jatiJaramarana,       // Sanh → Lão Tử
}

/// Vòng tròn Luân Hồi mà chi này thuộc về (Vatta).
enum PaticcaVatta {
  @JsonValue('kilesa') kilesa, // Vòng Phiền Não: Vô Minh, Ái, Thủ
  @JsonValue('kamma')  kamma,  // Vòng Nghiệp: Hành, Hữu
  @JsonValue('vipaka') vipaka, // Vòng Quả: Thức, Danh Sắc, Lục Nhập, Xúc, Thọ, Sanh, Lão Tử
}

/// Chi này thuộc về kiếp nào trong mô hình 3 kiếp.
enum PaticcaKiep {
  @JsonValue('past')    past,    // Quá Khứ (nhân kiếp trước: chi 1–2)
  @JsonValue('present') present, // Hiện Tại (quả + nhân kiếp này: chi 3–10)
  @JsonValue('future')  future,  // Tương Lai (quả kiếp sau: chi 11–12)
}

// ---------------------------------------------------------------------------
// Sub-model: Liên kết nhân-quả chi tiết giữa 2 chi
// ---------------------------------------------------------------------------

@freezed
class PaticcaLink with _$PaticcaLink {
  const factory PaticcaLink({
    // ID của chi đóng vai Nhân
    required String causeId,

    // ID của chi đóng vai Quả
    required String effectId,

    // Loại quan hệ duyên sinh
    required PaticcaRelationType relationType,

    // Giải thích tiếng Việt
    @Default('') String explanation,

    // Bản Pāḷi gốc (công thức Nhân Duyên)
    String? explanationPali,
  }) = _PaticcaLink;

  factory PaticcaLink.fromJson(Map<String, dynamic> json) =>
      _$PaticcaLinkFromJson(json);
}

// ---------------------------------------------------------------------------
// Main Model — 1 object = 1 chi trong 12 chi Nhân Duyên
// ---------------------------------------------------------------------------

@freezed
class PaticcaModel with _$PaticcaModel {
  const factory PaticcaModel({
    // ID định danh, format: PD_01 → PD_12
    required String id,

    // Tên Pāḷi (vd: "Avijjā", "Saṅkhārā")
    required String namePali,

    // Tên tiếng Việt (vd: "Vô Minh", "Hành")
    required String nameVietnamese,

    // Tên viết tắt hiển thị trong sơ đồ vòng tròn
    required String nameShort,

    // Thứ tự trong vòng 12 chi (1–12)
    required int order,

    // Thuộc vòng Phiền Não / Nghiệp / Quả
    required PaticcaVatta vatta,

    // Thuộc kiếp nào
    required PaticcaKiep kiep,

    // ID chi đứng trước (nhân trực tiếp) — null nếu là chi đầu (Vô Minh)
    required String? causeId,

    // ID chi đứng sau (quả trực tiếp) — null nếu là chi cuối (Lão Tử)
    required String? effectId,

    // Mô tả tiếng Việt đầy đủ
    required String descriptionVi,

    // Tứ Nghĩa (4 aspects) — theo chuẩn cetasika_model.dart
    String? trangThai,  // Đặc tướng / Lakkhaṇa
    String? phanSu,     // Phận sự / Rasa
    String? thanhTuu,   // Thành tựu / Paccupaṭṭhāna
    String? nhanGan,    // Nhân gần / Padaṭṭhāna

    // Liên kết nhân-quả chi tiết (thường chỉ 1 link xuôi)
    @Default([]) List<PaticcaLink> links,

    // Citta IDs liên quan đến chi này
    @Default([]) List<String> relatedCittaIds,

    // Cetasika IDs liên quan
    @Default([]) List<String> relatedCetasikaIds,

    // Ví dụ cụ thể
    @Default([]) List<String> examples,

    // Ghi chú giáo lý
    String? doctrinalNote,
  }) = _PaticcaModel;

  factory PaticcaModel.fromJson(Map<String, dynamic> json) =>
      _$PaticcaModelFromJson(json);
}
