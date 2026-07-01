// lib/data/models/cetasika_model.dart
// Model cho 52 Tâm Sở (Mental Factors / Cetasika)

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cetasika_model.freezed.dart';
part 'cetasika_model.g.dart';

/// Nhóm Tâm Sở chính
enum CetasikaGroup {
  @JsonValue('sabbacittasadharana')
  sabbacittasadharana, // 7 Tâm Sở Biến Hành
  @JsonValue('pakinnaka')
  pakinnaka, // 6 Tâm Sở Biệt Cảnh
  @JsonValue('akusala')
  akusala, // 14 Tâm Sở Bất Thiện
  @JsonValue('sobhana')
  sobhana, // 25 Tâm Sở Tịnh Hảo
}

/// Nhóm Tâm Sở Bất Thiện (phân chi tiết)
enum AkusalaSubGroup {
  @JsonValue('moha_group')
  mohaGroup, // Si phần (4): Si, Vô Tàm, Vô Quý, Phóng Dật
  @JsonValue('lobha_group')
  lobhaGroup, // Tham phần (3): Tham, Tà Kiến, Ngã Mạn
  @JsonValue('dosa_group')
  dosaGroup, // Sân phần (4): Sân, Tật, Lận, Hối
  @JsonValue('thina_group')
  thinaGroup, // Hôn Trầm phần (2): Hôn Trầm, Thụy Miên
  @JsonValue('vicikiccha')
  vicikiccha, // Hoài Nghi (1)
}

/// Nhóm Tâm Sở Tịnh Hảo (phân chi tiết)
enum SobhanaSubGroup {
  @JsonValue('sobhana_sadharana')
  sobhanaSadharana, // 19 Tịnh Hảo Biến Hành
  @JsonValue('viriya_group')
  viriyaGroup, // 3 Giới Phần
  @JsonValue('appamanna')
  appamanna, // 2 Vô Lượng Phần
  @JsonValue('panna')
  panna, // 1 Tuệ Phần
}

/// Quy tắc xung đột giữa các Tâm Sở
@freezed
class ConflictRule with _$ConflictRule {
  const factory ConflictRule({
    required String ruleId,
    required ConflictType type,
    required List<String> conflictingIds, // Danh sách Tâm Sở xung đột
    required String explanation, // Giải thích tiếng Việt
    String? explanationPali, // Giải thích tiếng Pali
  }) = _ConflictRule;

  factory ConflictRule.fromJson(Map<String, dynamic> json) =>
      _$ConflictRuleFromJson(json);
}

enum ConflictType {
  @JsonValue('pair')
  pair, // Cặp đôi (Tham ↔ Vô Tham)
  @JsonValue('triple')
  triple, // Bộ 3 (Tham + Sân + Tà Kiến)
  @JsonValue('bhumi')
  bhumi, // Bhumi (Tâm Siêu Thế + Sở Dục giới)
  @JsonValue('causal')
  causal, // Duyên xung đột (Vô Minh + Trí Tuệ)
}

@freezed
class CetasikaModel with _$CetasikaModel {
  const factory CetasikaModel({
    required String id,
    required String namePali,
    required String nameVietnamese,
    required String nameShort, // Tên viết tắt cho hiển thị Matrix
    required CetasikaGroup group,
    AkusalaSubGroup? akusalaSubGroup,
    SobhanaSubGroup? sobhanaSubGroup,

    // Số thứ tự truyền thống
    required int traditionalOrder,

    // IPA phát âm
    String? ipaTranscription,

    // Audio file path (trong assets)
    String? audioPronunciation,

    // Giải thích
    required String descriptionVi,
    String? descriptionPali,

    // Tứ Nghĩa (4 aspects)
    String? trangThai, // Đặc tướng (Lakkhaṇa)
    String? phanSu, // Phận sự (Rasa)
    String? thanhTuu, // Thành tựu (Paccupaṭṭhāna)
    String? nhanGan, // Nhân gần (Padaṭṭhāna)

    // Danh sách quy tắc xung đột liên quan
    @Default([]) List<ConflictRule> conflictRules,

    // Icon/Symbol cho dual encoding
    required String symbol, // Unicode symbol
    required int colorCode, // Hex color value
  }) = _CetasikaModel;

  factory CetasikaModel.fromJson(Map<String, dynamic> json) =>
      _$CetasikaModelFromJson(json);
}
