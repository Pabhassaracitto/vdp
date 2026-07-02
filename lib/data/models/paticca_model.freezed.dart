// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paticca_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaticcaLink _$PaticcaLinkFromJson(Map<String, dynamic> json) {
  return _PaticcaLink.fromJson(json);
}

/// @nodoc
mixin _$PaticcaLink {
// ID của chi đóng vai Nhân
  String get causeId =>
      throw _privateConstructorUsedError; // ID của chi đóng vai Quả
  String get effectId =>
      throw _privateConstructorUsedError; // Loại quan hệ duyên sinh
  PaticcaRelationType get relationType =>
      throw _privateConstructorUsedError; // Giải thích tiếng Việt
  String get explanation =>
      throw _privateConstructorUsedError; // Bản Pāḷi gốc (công thức Nhân Duyên)
  String? get explanationPali => throw _privateConstructorUsedError;

  /// Serializes this PaticcaLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaticcaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaticcaLinkCopyWith<PaticcaLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaticcaLinkCopyWith<$Res> {
  factory $PaticcaLinkCopyWith(
          PaticcaLink value, $Res Function(PaticcaLink) then) =
      _$PaticcaLinkCopyWithImpl<$Res, PaticcaLink>;
  @useResult
  $Res call(
      {String causeId,
      String effectId,
      PaticcaRelationType relationType,
      String explanation,
      String? explanationPali});
}

/// @nodoc
class _$PaticcaLinkCopyWithImpl<$Res, $Val extends PaticcaLink>
    implements $PaticcaLinkCopyWith<$Res> {
  _$PaticcaLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaticcaLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? causeId = null,
    Object? effectId = null,
    Object? relationType = null,
    Object? explanation = null,
    Object? explanationPali = freezed,
  }) {
    return _then(_value.copyWith(
      causeId: null == causeId
          ? _value.causeId
          : causeId // ignore: cast_nullable_to_non_nullable
              as String,
      effectId: null == effectId
          ? _value.effectId
          : effectId // ignore: cast_nullable_to_non_nullable
              as String,
      relationType: null == relationType
          ? _value.relationType
          : relationType // ignore: cast_nullable_to_non_nullable
              as PaticcaRelationType,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      explanationPali: freezed == explanationPali
          ? _value.explanationPali
          : explanationPali // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaticcaLinkImplCopyWith<$Res>
    implements $PaticcaLinkCopyWith<$Res> {
  factory _$$PaticcaLinkImplCopyWith(
          _$PaticcaLinkImpl value, $Res Function(_$PaticcaLinkImpl) then) =
      __$$PaticcaLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String causeId,
      String effectId,
      PaticcaRelationType relationType,
      String explanation,
      String? explanationPali});
}

/// @nodoc
class __$$PaticcaLinkImplCopyWithImpl<$Res>
    extends _$PaticcaLinkCopyWithImpl<$Res, _$PaticcaLinkImpl>
    implements _$$PaticcaLinkImplCopyWith<$Res> {
  __$$PaticcaLinkImplCopyWithImpl(
      _$PaticcaLinkImpl _value, $Res Function(_$PaticcaLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaticcaLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? causeId = null,
    Object? effectId = null,
    Object? relationType = null,
    Object? explanation = null,
    Object? explanationPali = freezed,
  }) {
    return _then(_$PaticcaLinkImpl(
      causeId: null == causeId
          ? _value.causeId
          : causeId // ignore: cast_nullable_to_non_nullable
              as String,
      effectId: null == effectId
          ? _value.effectId
          : effectId // ignore: cast_nullable_to_non_nullable
              as String,
      relationType: null == relationType
          ? _value.relationType
          : relationType // ignore: cast_nullable_to_non_nullable
              as PaticcaRelationType,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      explanationPali: freezed == explanationPali
          ? _value.explanationPali
          : explanationPali // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaticcaLinkImpl implements _PaticcaLink {
  const _$PaticcaLinkImpl(
      {required this.causeId,
      required this.effectId,
      required this.relationType,
      this.explanation = '',
      this.explanationPali});

  factory _$PaticcaLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaticcaLinkImplFromJson(json);

// ID của chi đóng vai Nhân
  @override
  final String causeId;
// ID của chi đóng vai Quả
  @override
  final String effectId;
// Loại quan hệ duyên sinh
  @override
  final PaticcaRelationType relationType;
// Giải thích tiếng Việt
  @override
  @JsonKey()
  final String explanation;
// Bản Pāḷi gốc (công thức Nhân Duyên)
  @override
  final String? explanationPali;

  @override
  String toString() {
    return 'PaticcaLink(causeId: $causeId, effectId: $effectId, relationType: $relationType, explanation: $explanation, explanationPali: $explanationPali)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaticcaLinkImpl &&
            (identical(other.causeId, causeId) || other.causeId == causeId) &&
            (identical(other.effectId, effectId) ||
                other.effectId == effectId) &&
            (identical(other.relationType, relationType) ||
                other.relationType == relationType) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.explanationPali, explanationPali) ||
                other.explanationPali == explanationPali));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, causeId, effectId, relationType,
      explanation, explanationPali);

  /// Create a copy of PaticcaLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaticcaLinkImplCopyWith<_$PaticcaLinkImpl> get copyWith =>
      __$$PaticcaLinkImplCopyWithImpl<_$PaticcaLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaticcaLinkImplToJson(
      this,
    );
  }
}

abstract class _PaticcaLink implements PaticcaLink {
  const factory _PaticcaLink(
      {required final String causeId,
      required final String effectId,
      required final PaticcaRelationType relationType,
      final String explanation,
      final String? explanationPali}) = _$PaticcaLinkImpl;

  factory _PaticcaLink.fromJson(Map<String, dynamic> json) =
      _$PaticcaLinkImpl.fromJson;

// ID của chi đóng vai Nhân
  @override
  String get causeId; // ID của chi đóng vai Quả
  @override
  String get effectId; // Loại quan hệ duyên sinh
  @override
  PaticcaRelationType get relationType; // Giải thích tiếng Việt
  @override
  String get explanation; // Bản Pāḷi gốc (công thức Nhân Duyên)
  @override
  String? get explanationPali;

  /// Create a copy of PaticcaLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaticcaLinkImplCopyWith<_$PaticcaLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaticcaModel _$PaticcaModelFromJson(Map<String, dynamic> json) {
  return _PaticcaModel.fromJson(json);
}

/// @nodoc
mixin _$PaticcaModel {
// ID định danh, format: PD_01 → PD_12
  String get id =>
      throw _privateConstructorUsedError; // Tên Pāḷi (vd: "Avijjā", "Saṅkhārā")
  String get namePali =>
      throw _privateConstructorUsedError; // Tên tiếng Việt (vd: "Vô Minh", "Hành")
  String get nameVietnamese =>
      throw _privateConstructorUsedError; // Tên viết tắt hiển thị trong sơ đồ vòng tròn
  String get nameShort =>
      throw _privateConstructorUsedError; // Thứ tự trong vòng 12 chi (1–12)
  int get order =>
      throw _privateConstructorUsedError; // Thuộc vòng Phiền Não / Nghiệp / Quả
  PaticcaVatta get vatta =>
      throw _privateConstructorUsedError; // Thuộc kiếp nào
  PaticcaKiep get kiep =>
      throw _privateConstructorUsedError; // ID chi đứng trước (nhân trực tiếp) — null nếu là chi đầu (Vô Minh)
  String? get causeId =>
      throw _privateConstructorUsedError; // ID chi đứng sau (quả trực tiếp) — null nếu là chi cuối (Lão Tử)
  String? get effectId =>
      throw _privateConstructorUsedError; // Mô tả tiếng Việt đầy đủ
  String get descriptionVi =>
      throw _privateConstructorUsedError; // Tứ Nghĩa (4 aspects) — theo chuẩn cetasika_model.dart
  String? get trangThai =>
      throw _privateConstructorUsedError; // Đặc tướng / Lakkhaṇa
  String? get phanSu => throw _privateConstructorUsedError; // Phận sự / Rasa
  String? get thanhTuu =>
      throw _privateConstructorUsedError; // Thành tựu / Paccupaṭṭhāna
  String? get nhanGan =>
      throw _privateConstructorUsedError; // Nhân gần / Padaṭṭhāna
// Liên kết nhân-quả chi tiết (thường chỉ 1 link xuôi)
  List<PaticcaLink> get links =>
      throw _privateConstructorUsedError; // Citta IDs liên quan đến chi này
  List<String> get relatedCittaIds =>
      throw _privateConstructorUsedError; // Cetasika IDs liên quan
  List<String> get relatedCetasikaIds =>
      throw _privateConstructorUsedError; // Ví dụ cụ thể
  List<String> get examples =>
      throw _privateConstructorUsedError; // Ghi chú giáo lý
  String? get doctrinalNote => throw _privateConstructorUsedError;

  /// Serializes this PaticcaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaticcaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaticcaModelCopyWith<PaticcaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaticcaModelCopyWith<$Res> {
  factory $PaticcaModelCopyWith(
          PaticcaModel value, $Res Function(PaticcaModel) then) =
      _$PaticcaModelCopyWithImpl<$Res, PaticcaModel>;
  @useResult
  $Res call(
      {String id,
      String namePali,
      String nameVietnamese,
      String nameShort,
      int order,
      PaticcaVatta vatta,
      PaticcaKiep kiep,
      String? causeId,
      String? effectId,
      String descriptionVi,
      String? trangThai,
      String? phanSu,
      String? thanhTuu,
      String? nhanGan,
      List<PaticcaLink> links,
      List<String> relatedCittaIds,
      List<String> relatedCetasikaIds,
      List<String> examples,
      String? doctrinalNote});
}

/// @nodoc
class _$PaticcaModelCopyWithImpl<$Res, $Val extends PaticcaModel>
    implements $PaticcaModelCopyWith<$Res> {
  _$PaticcaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaticcaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? nameShort = null,
    Object? order = null,
    Object? vatta = null,
    Object? kiep = null,
    Object? causeId = freezed,
    Object? effectId = freezed,
    Object? descriptionVi = null,
    Object? trangThai = freezed,
    Object? phanSu = freezed,
    Object? thanhTuu = freezed,
    Object? nhanGan = freezed,
    Object? links = null,
    Object? relatedCittaIds = null,
    Object? relatedCetasikaIds = null,
    Object? examples = null,
    Object? doctrinalNote = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namePali: null == namePali
          ? _value.namePali
          : namePali // ignore: cast_nullable_to_non_nullable
              as String,
      nameVietnamese: null == nameVietnamese
          ? _value.nameVietnamese
          : nameVietnamese // ignore: cast_nullable_to_non_nullable
              as String,
      nameShort: null == nameShort
          ? _value.nameShort
          : nameShort // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      vatta: null == vatta
          ? _value.vatta
          : vatta // ignore: cast_nullable_to_non_nullable
              as PaticcaVatta,
      kiep: null == kiep
          ? _value.kiep
          : kiep // ignore: cast_nullable_to_non_nullable
              as PaticcaKiep,
      causeId: freezed == causeId
          ? _value.causeId
          : causeId // ignore: cast_nullable_to_non_nullable
              as String?,
      effectId: freezed == effectId
          ? _value.effectId
          : effectId // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionVi: null == descriptionVi
          ? _value.descriptionVi
          : descriptionVi // ignore: cast_nullable_to_non_nullable
              as String,
      trangThai: freezed == trangThai
          ? _value.trangThai
          : trangThai // ignore: cast_nullable_to_non_nullable
              as String?,
      phanSu: freezed == phanSu
          ? _value.phanSu
          : phanSu // ignore: cast_nullable_to_non_nullable
              as String?,
      thanhTuu: freezed == thanhTuu
          ? _value.thanhTuu
          : thanhTuu // ignore: cast_nullable_to_non_nullable
              as String?,
      nhanGan: freezed == nhanGan
          ? _value.nhanGan
          : nhanGan // ignore: cast_nullable_to_non_nullable
              as String?,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<PaticcaLink>,
      relatedCittaIds: null == relatedCittaIds
          ? _value.relatedCittaIds
          : relatedCittaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedCetasikaIds: null == relatedCetasikaIds
          ? _value.relatedCetasikaIds
          : relatedCetasikaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      examples: null == examples
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<String>,
      doctrinalNote: freezed == doctrinalNote
          ? _value.doctrinalNote
          : doctrinalNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaticcaModelImplCopyWith<$Res>
    implements $PaticcaModelCopyWith<$Res> {
  factory _$$PaticcaModelImplCopyWith(
          _$PaticcaModelImpl value, $Res Function(_$PaticcaModelImpl) then) =
      __$$PaticcaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String namePali,
      String nameVietnamese,
      String nameShort,
      int order,
      PaticcaVatta vatta,
      PaticcaKiep kiep,
      String? causeId,
      String? effectId,
      String descriptionVi,
      String? trangThai,
      String? phanSu,
      String? thanhTuu,
      String? nhanGan,
      List<PaticcaLink> links,
      List<String> relatedCittaIds,
      List<String> relatedCetasikaIds,
      List<String> examples,
      String? doctrinalNote});
}

/// @nodoc
class __$$PaticcaModelImplCopyWithImpl<$Res>
    extends _$PaticcaModelCopyWithImpl<$Res, _$PaticcaModelImpl>
    implements _$$PaticcaModelImplCopyWith<$Res> {
  __$$PaticcaModelImplCopyWithImpl(
      _$PaticcaModelImpl _value, $Res Function(_$PaticcaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaticcaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? nameShort = null,
    Object? order = null,
    Object? vatta = null,
    Object? kiep = null,
    Object? causeId = freezed,
    Object? effectId = freezed,
    Object? descriptionVi = null,
    Object? trangThai = freezed,
    Object? phanSu = freezed,
    Object? thanhTuu = freezed,
    Object? nhanGan = freezed,
    Object? links = null,
    Object? relatedCittaIds = null,
    Object? relatedCetasikaIds = null,
    Object? examples = null,
    Object? doctrinalNote = freezed,
  }) {
    return _then(_$PaticcaModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      namePali: null == namePali
          ? _value.namePali
          : namePali // ignore: cast_nullable_to_non_nullable
              as String,
      nameVietnamese: null == nameVietnamese
          ? _value.nameVietnamese
          : nameVietnamese // ignore: cast_nullable_to_non_nullable
              as String,
      nameShort: null == nameShort
          ? _value.nameShort
          : nameShort // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      vatta: null == vatta
          ? _value.vatta
          : vatta // ignore: cast_nullable_to_non_nullable
              as PaticcaVatta,
      kiep: null == kiep
          ? _value.kiep
          : kiep // ignore: cast_nullable_to_non_nullable
              as PaticcaKiep,
      causeId: freezed == causeId
          ? _value.causeId
          : causeId // ignore: cast_nullable_to_non_nullable
              as String?,
      effectId: freezed == effectId
          ? _value.effectId
          : effectId // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionVi: null == descriptionVi
          ? _value.descriptionVi
          : descriptionVi // ignore: cast_nullable_to_non_nullable
              as String,
      trangThai: freezed == trangThai
          ? _value.trangThai
          : trangThai // ignore: cast_nullable_to_non_nullable
              as String?,
      phanSu: freezed == phanSu
          ? _value.phanSu
          : phanSu // ignore: cast_nullable_to_non_nullable
              as String?,
      thanhTuu: freezed == thanhTuu
          ? _value.thanhTuu
          : thanhTuu // ignore: cast_nullable_to_non_nullable
              as String?,
      nhanGan: freezed == nhanGan
          ? _value.nhanGan
          : nhanGan // ignore: cast_nullable_to_non_nullable
              as String?,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<PaticcaLink>,
      relatedCittaIds: null == relatedCittaIds
          ? _value._relatedCittaIds
          : relatedCittaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedCetasikaIds: null == relatedCetasikaIds
          ? _value._relatedCetasikaIds
          : relatedCetasikaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      examples: null == examples
          ? _value._examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<String>,
      doctrinalNote: freezed == doctrinalNote
          ? _value.doctrinalNote
          : doctrinalNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaticcaModelImpl implements _PaticcaModel {
  const _$PaticcaModelImpl(
      {required this.id,
      required this.namePali,
      required this.nameVietnamese,
      required this.nameShort,
      required this.order,
      required this.vatta,
      required this.kiep,
      required this.causeId,
      required this.effectId,
      required this.descriptionVi,
      this.trangThai,
      this.phanSu,
      this.thanhTuu,
      this.nhanGan,
      final List<PaticcaLink> links = const [],
      final List<String> relatedCittaIds = const [],
      final List<String> relatedCetasikaIds = const [],
      final List<String> examples = const [],
      this.doctrinalNote})
      : _links = links,
        _relatedCittaIds = relatedCittaIds,
        _relatedCetasikaIds = relatedCetasikaIds,
        _examples = examples;

  factory _$PaticcaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaticcaModelImplFromJson(json);

// ID định danh, format: PD_01 → PD_12
  @override
  final String id;
// Tên Pāḷi (vd: "Avijjā", "Saṅkhārā")
  @override
  final String namePali;
// Tên tiếng Việt (vd: "Vô Minh", "Hành")
  @override
  final String nameVietnamese;
// Tên viết tắt hiển thị trong sơ đồ vòng tròn
  @override
  final String nameShort;
// Thứ tự trong vòng 12 chi (1–12)
  @override
  final int order;
// Thuộc vòng Phiền Não / Nghiệp / Quả
  @override
  final PaticcaVatta vatta;
// Thuộc kiếp nào
  @override
  final PaticcaKiep kiep;
// ID chi đứng trước (nhân trực tiếp) — null nếu là chi đầu (Vô Minh)
  @override
  final String? causeId;
// ID chi đứng sau (quả trực tiếp) — null nếu là chi cuối (Lão Tử)
  @override
  final String? effectId;
// Mô tả tiếng Việt đầy đủ
  @override
  final String descriptionVi;
// Tứ Nghĩa (4 aspects) — theo chuẩn cetasika_model.dart
  @override
  final String? trangThai;
// Đặc tướng / Lakkhaṇa
  @override
  final String? phanSu;
// Phận sự / Rasa
  @override
  final String? thanhTuu;
// Thành tựu / Paccupaṭṭhāna
  @override
  final String? nhanGan;
// Nhân gần / Padaṭṭhāna
// Liên kết nhân-quả chi tiết (thường chỉ 1 link xuôi)
  final List<PaticcaLink> _links;
// Nhân gần / Padaṭṭhāna
// Liên kết nhân-quả chi tiết (thường chỉ 1 link xuôi)
  @override
  @JsonKey()
  List<PaticcaLink> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

// Citta IDs liên quan đến chi này
  final List<String> _relatedCittaIds;
// Citta IDs liên quan đến chi này
  @override
  @JsonKey()
  List<String> get relatedCittaIds {
    if (_relatedCittaIds is EqualUnmodifiableListView) return _relatedCittaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedCittaIds);
  }

// Cetasika IDs liên quan
  final List<String> _relatedCetasikaIds;
// Cetasika IDs liên quan
  @override
  @JsonKey()
  List<String> get relatedCetasikaIds {
    if (_relatedCetasikaIds is EqualUnmodifiableListView)
      return _relatedCetasikaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedCetasikaIds);
  }

// Ví dụ cụ thể
  final List<String> _examples;
// Ví dụ cụ thể
  @override
  @JsonKey()
  List<String> get examples {
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examples);
  }

// Ghi chú giáo lý
  @override
  final String? doctrinalNote;

  @override
  String toString() {
    return 'PaticcaModel(id: $id, namePali: $namePali, nameVietnamese: $nameVietnamese, nameShort: $nameShort, order: $order, vatta: $vatta, kiep: $kiep, causeId: $causeId, effectId: $effectId, descriptionVi: $descriptionVi, trangThai: $trangThai, phanSu: $phanSu, thanhTuu: $thanhTuu, nhanGan: $nhanGan, links: $links, relatedCittaIds: $relatedCittaIds, relatedCetasikaIds: $relatedCetasikaIds, examples: $examples, doctrinalNote: $doctrinalNote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaticcaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namePali, namePali) ||
                other.namePali == namePali) &&
            (identical(other.nameVietnamese, nameVietnamese) ||
                other.nameVietnamese == nameVietnamese) &&
            (identical(other.nameShort, nameShort) ||
                other.nameShort == nameShort) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.vatta, vatta) || other.vatta == vatta) &&
            (identical(other.kiep, kiep) || other.kiep == kiep) &&
            (identical(other.causeId, causeId) || other.causeId == causeId) &&
            (identical(other.effectId, effectId) ||
                other.effectId == effectId) &&
            (identical(other.descriptionVi, descriptionVi) ||
                other.descriptionVi == descriptionVi) &&
            (identical(other.trangThai, trangThai) ||
                other.trangThai == trangThai) &&
            (identical(other.phanSu, phanSu) || other.phanSu == phanSu) &&
            (identical(other.thanhTuu, thanhTuu) ||
                other.thanhTuu == thanhTuu) &&
            (identical(other.nhanGan, nhanGan) || other.nhanGan == nhanGan) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            const DeepCollectionEquality()
                .equals(other._relatedCittaIds, _relatedCittaIds) &&
            const DeepCollectionEquality()
                .equals(other._relatedCetasikaIds, _relatedCetasikaIds) &&
            const DeepCollectionEquality().equals(other._examples, _examples) &&
            (identical(other.doctrinalNote, doctrinalNote) ||
                other.doctrinalNote == doctrinalNote));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        namePali,
        nameVietnamese,
        nameShort,
        order,
        vatta,
        kiep,
        causeId,
        effectId,
        descriptionVi,
        trangThai,
        phanSu,
        thanhTuu,
        nhanGan,
        const DeepCollectionEquality().hash(_links),
        const DeepCollectionEquality().hash(_relatedCittaIds),
        const DeepCollectionEquality().hash(_relatedCetasikaIds),
        const DeepCollectionEquality().hash(_examples),
        doctrinalNote
      ]);

  /// Create a copy of PaticcaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaticcaModelImplCopyWith<_$PaticcaModelImpl> get copyWith =>
      __$$PaticcaModelImplCopyWithImpl<_$PaticcaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaticcaModelImplToJson(
      this,
    );
  }
}

abstract class _PaticcaModel implements PaticcaModel {
  const factory _PaticcaModel(
      {required final String id,
      required final String namePali,
      required final String nameVietnamese,
      required final String nameShort,
      required final int order,
      required final PaticcaVatta vatta,
      required final PaticcaKiep kiep,
      required final String? causeId,
      required final String? effectId,
      required final String descriptionVi,
      final String? trangThai,
      final String? phanSu,
      final String? thanhTuu,
      final String? nhanGan,
      final List<PaticcaLink> links,
      final List<String> relatedCittaIds,
      final List<String> relatedCetasikaIds,
      final List<String> examples,
      final String? doctrinalNote}) = _$PaticcaModelImpl;

  factory _PaticcaModel.fromJson(Map<String, dynamic> json) =
      _$PaticcaModelImpl.fromJson;

// ID định danh, format: PD_01 → PD_12
  @override
  String get id; // Tên Pāḷi (vd: "Avijjā", "Saṅkhārā")
  @override
  String get namePali; // Tên tiếng Việt (vd: "Vô Minh", "Hành")
  @override
  String get nameVietnamese; // Tên viết tắt hiển thị trong sơ đồ vòng tròn
  @override
  String get nameShort; // Thứ tự trong vòng 12 chi (1–12)
  @override
  int get order; // Thuộc vòng Phiền Não / Nghiệp / Quả
  @override
  PaticcaVatta get vatta; // Thuộc kiếp nào
  @override
  PaticcaKiep
      get kiep; // ID chi đứng trước (nhân trực tiếp) — null nếu là chi đầu (Vô Minh)
  @override
  String?
      get causeId; // ID chi đứng sau (quả trực tiếp) — null nếu là chi cuối (Lão Tử)
  @override
  String? get effectId; // Mô tả tiếng Việt đầy đủ
  @override
  String
      get descriptionVi; // Tứ Nghĩa (4 aspects) — theo chuẩn cetasika_model.dart
  @override
  String? get trangThai; // Đặc tướng / Lakkhaṇa
  @override
  String? get phanSu; // Phận sự / Rasa
  @override
  String? get thanhTuu; // Thành tựu / Paccupaṭṭhāna
  @override
  String? get nhanGan; // Nhân gần / Padaṭṭhāna
// Liên kết nhân-quả chi tiết (thường chỉ 1 link xuôi)
  @override
  List<PaticcaLink> get links; // Citta IDs liên quan đến chi này
  @override
  List<String> get relatedCittaIds; // Cetasika IDs liên quan
  @override
  List<String> get relatedCetasikaIds; // Ví dụ cụ thể
  @override
  List<String> get examples; // Ghi chú giáo lý
  @override
  String? get doctrinalNote;

  /// Create a copy of PaticcaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaticcaModelImplCopyWith<_$PaticcaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
