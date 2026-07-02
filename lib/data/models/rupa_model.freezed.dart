// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rupa_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RupaModel _$RupaModelFromJson(Map<String, dynamic> json) {
  return _RupaModel.fromJson(json);
}

/// @nodoc
mixin _$RupaModel {
// ID định danh, format: RP_001 → RP_028
  String get id =>
      throw _privateConstructorUsedError; // Tên Pāḷi (có dấu macron)
  String get namePali =>
      throw _privateConstructorUsedError; // Tên tiếng Việt đầy đủ
  String get nameVietnamese =>
      throw _privateConstructorUsedError; // Tên viết tắt hiển thị trong UI / chip
  String get nameShort =>
      throw _privateConstructorUsedError; // Đại Hiển hay Y Đại Sinh
  RupaType get type => throw _privateConstructorUsedError; // Nhóm con chi tiết
  RupaSubGroup get subGroup =>
      throw _privateConstructorUsedError; // Số thứ tự truyền thống Abhidhamma (1–28)
  int get traditionalOrder =>
      throw _privateConstructorUsedError; // Các nguồn nhân sanh khởi (có thể nhiều nhân)
  List<RupaCause> get causes =>
      throw _privateConstructorUsedError; // Mô tả tiếng Việt
  String get descriptionVi =>
      throw _privateConstructorUsedError; // Mô tả Pāḷi gốc
  String get descriptionPali =>
      throw _privateConstructorUsedError; // Tứ Nghĩa (4 aspects) — theo chuẩn cetasika_model.dart
  String? get trangThai =>
      throw _privateConstructorUsedError; // Đặc tướng / Lakkhaṇa
  String? get phanSu => throw _privateConstructorUsedError; // Phận sự / Rasa
  String? get thanhTuu =>
      throw _privateConstructorUsedError; // Thành tựu / Paccupaṭṭhāna
  String? get nhanGan =>
      throw _privateConstructorUsedError; // Nhân gần / Padaṭṭhāna
// Sắc này có mặt ở cõi nào — giá trị: 'kamavacara' | 'rupavacara' | 'all'
  List<String> get presentInBhumi =>
      throw _privateConstructorUsedError; // Ghi chú giáo lý
  String? get doctrinalNote => throw _privateConstructorUsedError;

  /// Serializes this RupaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RupaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RupaModelCopyWith<RupaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RupaModelCopyWith<$Res> {
  factory $RupaModelCopyWith(RupaModel value, $Res Function(RupaModel) then) =
      _$RupaModelCopyWithImpl<$Res, RupaModel>;
  @useResult
  $Res call(
      {String id,
      String namePali,
      String nameVietnamese,
      String nameShort,
      RupaType type,
      RupaSubGroup subGroup,
      int traditionalOrder,
      List<RupaCause> causes,
      String descriptionVi,
      String descriptionPali,
      String? trangThai,
      String? phanSu,
      String? thanhTuu,
      String? nhanGan,
      List<String> presentInBhumi,
      String? doctrinalNote});
}

/// @nodoc
class _$RupaModelCopyWithImpl<$Res, $Val extends RupaModel>
    implements $RupaModelCopyWith<$Res> {
  _$RupaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RupaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? nameShort = null,
    Object? type = null,
    Object? subGroup = null,
    Object? traditionalOrder = null,
    Object? causes = null,
    Object? descriptionVi = null,
    Object? descriptionPali = null,
    Object? trangThai = freezed,
    Object? phanSu = freezed,
    Object? thanhTuu = freezed,
    Object? nhanGan = freezed,
    Object? presentInBhumi = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RupaType,
      subGroup: null == subGroup
          ? _value.subGroup
          : subGroup // ignore: cast_nullable_to_non_nullable
              as RupaSubGroup,
      traditionalOrder: null == traditionalOrder
          ? _value.traditionalOrder
          : traditionalOrder // ignore: cast_nullable_to_non_nullable
              as int,
      causes: null == causes
          ? _value.causes
          : causes // ignore: cast_nullable_to_non_nullable
              as List<RupaCause>,
      descriptionVi: null == descriptionVi
          ? _value.descriptionVi
          : descriptionVi // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionPali: null == descriptionPali
          ? _value.descriptionPali
          : descriptionPali // ignore: cast_nullable_to_non_nullable
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
      presentInBhumi: null == presentInBhumi
          ? _value.presentInBhumi
          : presentInBhumi // ignore: cast_nullable_to_non_nullable
              as List<String>,
      doctrinalNote: freezed == doctrinalNote
          ? _value.doctrinalNote
          : doctrinalNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RupaModelImplCopyWith<$Res>
    implements $RupaModelCopyWith<$Res> {
  factory _$$RupaModelImplCopyWith(
          _$RupaModelImpl value, $Res Function(_$RupaModelImpl) then) =
      __$$RupaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String namePali,
      String nameVietnamese,
      String nameShort,
      RupaType type,
      RupaSubGroup subGroup,
      int traditionalOrder,
      List<RupaCause> causes,
      String descriptionVi,
      String descriptionPali,
      String? trangThai,
      String? phanSu,
      String? thanhTuu,
      String? nhanGan,
      List<String> presentInBhumi,
      String? doctrinalNote});
}

/// @nodoc
class __$$RupaModelImplCopyWithImpl<$Res>
    extends _$RupaModelCopyWithImpl<$Res, _$RupaModelImpl>
    implements _$$RupaModelImplCopyWith<$Res> {
  __$$RupaModelImplCopyWithImpl(
      _$RupaModelImpl _value, $Res Function(_$RupaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RupaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? nameShort = null,
    Object? type = null,
    Object? subGroup = null,
    Object? traditionalOrder = null,
    Object? causes = null,
    Object? descriptionVi = null,
    Object? descriptionPali = null,
    Object? trangThai = freezed,
    Object? phanSu = freezed,
    Object? thanhTuu = freezed,
    Object? nhanGan = freezed,
    Object? presentInBhumi = null,
    Object? doctrinalNote = freezed,
  }) {
    return _then(_$RupaModelImpl(
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RupaType,
      subGroup: null == subGroup
          ? _value.subGroup
          : subGroup // ignore: cast_nullable_to_non_nullable
              as RupaSubGroup,
      traditionalOrder: null == traditionalOrder
          ? _value.traditionalOrder
          : traditionalOrder // ignore: cast_nullable_to_non_nullable
              as int,
      causes: null == causes
          ? _value._causes
          : causes // ignore: cast_nullable_to_non_nullable
              as List<RupaCause>,
      descriptionVi: null == descriptionVi
          ? _value.descriptionVi
          : descriptionVi // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionPali: null == descriptionPali
          ? _value.descriptionPali
          : descriptionPali // ignore: cast_nullable_to_non_nullable
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
      presentInBhumi: null == presentInBhumi
          ? _value._presentInBhumi
          : presentInBhumi // ignore: cast_nullable_to_non_nullable
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
class _$RupaModelImpl implements _RupaModel {
  const _$RupaModelImpl(
      {required this.id,
      required this.namePali,
      required this.nameVietnamese,
      required this.nameShort,
      required this.type,
      required this.subGroup,
      required this.traditionalOrder,
      required final List<RupaCause> causes,
      required this.descriptionVi,
      this.descriptionPali = '',
      this.trangThai,
      this.phanSu,
      this.thanhTuu,
      this.nhanGan,
      final List<String> presentInBhumi = const ['all'],
      this.doctrinalNote})
      : _causes = causes,
        _presentInBhumi = presentInBhumi;

  factory _$RupaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RupaModelImplFromJson(json);

// ID định danh, format: RP_001 → RP_028
  @override
  final String id;
// Tên Pāḷi (có dấu macron)
  @override
  final String namePali;
// Tên tiếng Việt đầy đủ
  @override
  final String nameVietnamese;
// Tên viết tắt hiển thị trong UI / chip
  @override
  final String nameShort;
// Đại Hiển hay Y Đại Sinh
  @override
  final RupaType type;
// Nhóm con chi tiết
  @override
  final RupaSubGroup subGroup;
// Số thứ tự truyền thống Abhidhamma (1–28)
  @override
  final int traditionalOrder;
// Các nguồn nhân sanh khởi (có thể nhiều nhân)
  final List<RupaCause> _causes;
// Các nguồn nhân sanh khởi (có thể nhiều nhân)
  @override
  List<RupaCause> get causes {
    if (_causes is EqualUnmodifiableListView) return _causes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_causes);
  }

// Mô tả tiếng Việt
  @override
  final String descriptionVi;
// Mô tả Pāḷi gốc
  @override
  @JsonKey()
  final String descriptionPali;
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
// Sắc này có mặt ở cõi nào — giá trị: 'kamavacara' | 'rupavacara' | 'all'
  final List<String> _presentInBhumi;
// Nhân gần / Padaṭṭhāna
// Sắc này có mặt ở cõi nào — giá trị: 'kamavacara' | 'rupavacara' | 'all'
  @override
  @JsonKey()
  List<String> get presentInBhumi {
    if (_presentInBhumi is EqualUnmodifiableListView) return _presentInBhumi;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_presentInBhumi);
  }

// Ghi chú giáo lý
  @override
  final String? doctrinalNote;

  @override
  String toString() {
    return 'RupaModel(id: $id, namePali: $namePali, nameVietnamese: $nameVietnamese, nameShort: $nameShort, type: $type, subGroup: $subGroup, traditionalOrder: $traditionalOrder, causes: $causes, descriptionVi: $descriptionVi, descriptionPali: $descriptionPali, trangThai: $trangThai, phanSu: $phanSu, thanhTuu: $thanhTuu, nhanGan: $nhanGan, presentInBhumi: $presentInBhumi, doctrinalNote: $doctrinalNote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RupaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namePali, namePali) ||
                other.namePali == namePali) &&
            (identical(other.nameVietnamese, nameVietnamese) ||
                other.nameVietnamese == nameVietnamese) &&
            (identical(other.nameShort, nameShort) ||
                other.nameShort == nameShort) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.subGroup, subGroup) ||
                other.subGroup == subGroup) &&
            (identical(other.traditionalOrder, traditionalOrder) ||
                other.traditionalOrder == traditionalOrder) &&
            const DeepCollectionEquality().equals(other._causes, _causes) &&
            (identical(other.descriptionVi, descriptionVi) ||
                other.descriptionVi == descriptionVi) &&
            (identical(other.descriptionPali, descriptionPali) ||
                other.descriptionPali == descriptionPali) &&
            (identical(other.trangThai, trangThai) ||
                other.trangThai == trangThai) &&
            (identical(other.phanSu, phanSu) || other.phanSu == phanSu) &&
            (identical(other.thanhTuu, thanhTuu) ||
                other.thanhTuu == thanhTuu) &&
            (identical(other.nhanGan, nhanGan) || other.nhanGan == nhanGan) &&
            const DeepCollectionEquality()
                .equals(other._presentInBhumi, _presentInBhumi) &&
            (identical(other.doctrinalNote, doctrinalNote) ||
                other.doctrinalNote == doctrinalNote));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      namePali,
      nameVietnamese,
      nameShort,
      type,
      subGroup,
      traditionalOrder,
      const DeepCollectionEquality().hash(_causes),
      descriptionVi,
      descriptionPali,
      trangThai,
      phanSu,
      thanhTuu,
      nhanGan,
      const DeepCollectionEquality().hash(_presentInBhumi),
      doctrinalNote);

  /// Create a copy of RupaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RupaModelImplCopyWith<_$RupaModelImpl> get copyWith =>
      __$$RupaModelImplCopyWithImpl<_$RupaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RupaModelImplToJson(
      this,
    );
  }
}

abstract class _RupaModel implements RupaModel {
  const factory _RupaModel(
      {required final String id,
      required final String namePali,
      required final String nameVietnamese,
      required final String nameShort,
      required final RupaType type,
      required final RupaSubGroup subGroup,
      required final int traditionalOrder,
      required final List<RupaCause> causes,
      required final String descriptionVi,
      final String descriptionPali,
      final String? trangThai,
      final String? phanSu,
      final String? thanhTuu,
      final String? nhanGan,
      final List<String> presentInBhumi,
      final String? doctrinalNote}) = _$RupaModelImpl;

  factory _RupaModel.fromJson(Map<String, dynamic> json) =
      _$RupaModelImpl.fromJson;

// ID định danh, format: RP_001 → RP_028
  @override
  String get id; // Tên Pāḷi (có dấu macron)
  @override
  String get namePali; // Tên tiếng Việt đầy đủ
  @override
  String get nameVietnamese; // Tên viết tắt hiển thị trong UI / chip
  @override
  String get nameShort; // Đại Hiển hay Y Đại Sinh
  @override
  RupaType get type; // Nhóm con chi tiết
  @override
  RupaSubGroup get subGroup; // Số thứ tự truyền thống Abhidhamma (1–28)
  @override
  int get traditionalOrder; // Các nguồn nhân sanh khởi (có thể nhiều nhân)
  @override
  List<RupaCause> get causes; // Mô tả tiếng Việt
  @override
  String get descriptionVi; // Mô tả Pāḷi gốc
  @override
  String
      get descriptionPali; // Tứ Nghĩa (4 aspects) — theo chuẩn cetasika_model.dart
  @override
  String? get trangThai; // Đặc tướng / Lakkhaṇa
  @override
  String? get phanSu; // Phận sự / Rasa
  @override
  String? get thanhTuu; // Thành tựu / Paccupaṭṭhāna
  @override
  String? get nhanGan; // Nhân gần / Padaṭṭhāna
// Sắc này có mặt ở cõi nào — giá trị: 'kamavacara' | 'rupavacara' | 'all'
  @override
  List<String> get presentInBhumi; // Ghi chú giáo lý
  @override
  String? get doctrinalNote;

  /// Create a copy of RupaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RupaModelImplCopyWith<_$RupaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
