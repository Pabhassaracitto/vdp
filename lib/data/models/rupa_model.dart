// lib/data/models/rupa_model.dart
// Model cho 28 Sắc Pháp (Material Phenomena / Rūpa)

import 'package:freezed_annotation/freezed_annotation.dart';

part 'rupa_model.freezed.dart';
part 'rupa_model.g.dart';

// ---------------------------------------------------------------------------
// Enums — tất cả đều có @JsonValue() theo chuẩn dự án
// ---------------------------------------------------------------------------

/// Nguồn gốc sanh khởi của Sắc Pháp (Tứ Thực).
enum RupaCause {
  @JsonValue('kamma')
  kamma, // Nghiệp sanh sắc
  @JsonValue('citta')
  citta, // Tâm sanh sắc
  @JsonValue('utu')
  utu, // Thời tiết sanh sắc (Hỏa Đại)
  @JsonValue('ahara')
  ahara, // Vật thực sanh sắc (Ojā)
  @JsonValue('none')
  none, // Không do nhân đặc biệt (dùng cho sắc tướng)
}

/// Phân loại Sắc: Đại Hiển hay Y Đại Sinh.
enum RupaType {
  @JsonValue('maha_bhuta')
  mahaBhuta, // Tứ Đại Hiển (4 sắc căn bản)
  @JsonValue('upada')
  upada, // Y Đại Sinh (24 sắc phụ thuộc)
}

/// Nhóm con của sắc Y Đại Sinh.
enum RupaSubGroup {
  @JsonValue('pasada')
  pasada, // Thần kinh (Pasāda) — 5 căn
  @JsonValue('gocara')
  gocara, // Cảnh (Gocara) — 4 sắc cảnh
  @JsonValue('bhava')
  bhava, // Phái tính (Bhāva) — 2 sắc
  @JsonValue('hadaya')
  hadaya, // Ý vật (Hadaya) — 1 sắc
  @JsonValue('jivita')
  jivita, // Mạng căn (Jīvita) — 1 sắc
  @JsonValue('ahara')
  ahara, // Vật thực (Ojā) — 1 sắc
  @JsonValue('akasa')
  akasa, // Hư không (Ākāsa) — 1 sắc
  @JsonValue('vinnatti')
  vinnatti, // Biểu tri (Viññatti) — 2 sắc
  @JsonValue('vikara')
  vikara, // Biến hoá (Vikāra) — 3 sắc
  @JsonValue('lakkhana')
  lakkhana, // Tướng (Lakkhaṇa) — 4 sắc
  @JsonValue('none')
  none, // Không áp dụng (Tứ Đại Hiển)
}

// ---------------------------------------------------------------------------
// Main Model
// ---------------------------------------------------------------------------

@freezed
class RupaModel with _$RupaModel {
  const factory RupaModel({
    // ID định danh, format: RP_001 → RP_028
    required String id,

    // Tên Pāḷi (có dấu macron)
    required String namePali,

    // Tên tiếng Việt đầy đủ
    required String nameVietnamese,

    // Tên viết tắt hiển thị trong UI / chip
    required String nameShort,

    // Đại Hiển hay Y Đại Sinh
    required RupaType type,

    // Nhóm con chi tiết
    required RupaSubGroup subGroup,

    // Số thứ tự truyền thống Abhidhamma (1–28)
    required int traditionalOrder,

    // Các nguồn nhân sanh khởi (có thể nhiều nhân)
    required List<RupaCause> causes,

    // Mô tả tiếng Việt
    required String descriptionVi,

    // Mô tả Pāḷi gốc
    @Default('') String descriptionPali,

    // Tứ Nghĩa (4 aspects) — theo chuẩn cetasika_model.dart
    String? trangThai, // Đặc tướng / Lakkhaṇa
    String? phanSu, // Phận sự / Rasa
    String? thanhTuu, // Thành tựu / Paccupaṭṭhāna
    String? nhanGan, // Nhân gần / Padaṭṭhāna

    // Sắc này có mặt ở cõi nào — giá trị: 'kamavacara' | 'rupavacara' | 'all'
    @Default(['all']) List<String> presentInBhumi,

    // Ghi chú giáo lý
    String? doctrinalNote,
  }) = _RupaModel;

  factory RupaModel.fromJson(Map<String, dynamic> json) =>
      _$RupaModelFromJson(json);
}
