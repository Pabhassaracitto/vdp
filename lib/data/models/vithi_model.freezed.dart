// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vithi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VithiStep _$VithiStepFromJson(Map<String, dynamic> json) {
  return _VithiStep.fromJson(json);
}

/// @nodoc
mixin _$VithiStep {
// Số thứ tự sát-na (1-based, Javana đánh số 1–7 bên trong)
  int get stepNumber =>
      throw _privateConstructorUsedError; // Vai trò của sát-na này
  VithiStepRole get role => throw _privateConstructorUsedError; // Tên Pāḷi
  String get namePali => throw _privateConstructorUsedError; // Tên tiếng Việt
  String get nameVietnamese =>
      throw _privateConstructorUsedError; // Mô tả ngắn phận sự
  String get description =>
      throw _privateConstructorUsedError; // Danh sách Citta IDs có thể sanh lên tại sát-na này
  List<String> get allowedCittaIds =>
      throw _privateConstructorUsedError; // Số lần lặp lại (-1 = vô số, vd: Bhavaṅga-sota)
  int get repeatCount =>
      throw _privateConstructorUsedError; // Sát-na này có thể vắng mặt không (vd: Tadārammaṇa)
  bool get isOptional => throw _privateConstructorUsedError; // Ghi chú
  String? get doctrinalNote => throw _privateConstructorUsedError;

  /// Serializes this VithiStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VithiStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VithiStepCopyWith<VithiStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VithiStepCopyWith<$Res> {
  factory $VithiStepCopyWith(VithiStep value, $Res Function(VithiStep) then) =
      _$VithiStepCopyWithImpl<$Res, VithiStep>;
  @useResult
  $Res call(
      {int stepNumber,
      VithiStepRole role,
      String namePali,
      String nameVietnamese,
      String description,
      List<String> allowedCittaIds,
      int repeatCount,
      bool isOptional,
      String? doctrinalNote});
}

/// @nodoc
class _$VithiStepCopyWithImpl<$Res, $Val extends VithiStep>
    implements $VithiStepCopyWith<$Res> {
  _$VithiStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VithiStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepNumber = null,
    Object? role = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? description = null,
    Object? allowedCittaIds = null,
    Object? repeatCount = null,
    Object? isOptional = null,
    Object? doctrinalNote = freezed,
  }) {
    return _then(_value.copyWith(
      stepNumber: null == stepNumber
          ? _value.stepNumber
          : stepNumber // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as VithiStepRole,
      namePali: null == namePali
          ? _value.namePali
          : namePali // ignore: cast_nullable_to_non_nullable
              as String,
      nameVietnamese: null == nameVietnamese
          ? _value.nameVietnamese
          : nameVietnamese // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      allowedCittaIds: null == allowedCittaIds
          ? _value.allowedCittaIds
          : allowedCittaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      repeatCount: null == repeatCount
          ? _value.repeatCount
          : repeatCount // ignore: cast_nullable_to_non_nullable
              as int,
      isOptional: null == isOptional
          ? _value.isOptional
          : isOptional // ignore: cast_nullable_to_non_nullable
              as bool,
      doctrinalNote: freezed == doctrinalNote
          ? _value.doctrinalNote
          : doctrinalNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VithiStepImplCopyWith<$Res>
    implements $VithiStepCopyWith<$Res> {
  factory _$$VithiStepImplCopyWith(
          _$VithiStepImpl value, $Res Function(_$VithiStepImpl) then) =
      __$$VithiStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int stepNumber,
      VithiStepRole role,
      String namePali,
      String nameVietnamese,
      String description,
      List<String> allowedCittaIds,
      int repeatCount,
      bool isOptional,
      String? doctrinalNote});
}

/// @nodoc
class __$$VithiStepImplCopyWithImpl<$Res>
    extends _$VithiStepCopyWithImpl<$Res, _$VithiStepImpl>
    implements _$$VithiStepImplCopyWith<$Res> {
  __$$VithiStepImplCopyWithImpl(
      _$VithiStepImpl _value, $Res Function(_$VithiStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of VithiStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepNumber = null,
    Object? role = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? description = null,
    Object? allowedCittaIds = null,
    Object? repeatCount = null,
    Object? isOptional = null,
    Object? doctrinalNote = freezed,
  }) {
    return _then(_$VithiStepImpl(
      stepNumber: null == stepNumber
          ? _value.stepNumber
          : stepNumber // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as VithiStepRole,
      namePali: null == namePali
          ? _value.namePali
          : namePali // ignore: cast_nullable_to_non_nullable
              as String,
      nameVietnamese: null == nameVietnamese
          ? _value.nameVietnamese
          : nameVietnamese // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      allowedCittaIds: null == allowedCittaIds
          ? _value._allowedCittaIds
          : allowedCittaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      repeatCount: null == repeatCount
          ? _value.repeatCount
          : repeatCount // ignore: cast_nullable_to_non_nullable
              as int,
      isOptional: null == isOptional
          ? _value.isOptional
          : isOptional // ignore: cast_nullable_to_non_nullable
              as bool,
      doctrinalNote: freezed == doctrinalNote
          ? _value.doctrinalNote
          : doctrinalNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VithiStepImpl implements _VithiStep {
  const _$VithiStepImpl(
      {required this.stepNumber,
      required this.role,
      required this.namePali,
      required this.nameVietnamese,
      required this.description,
      final List<String> allowedCittaIds = const [],
      this.repeatCount = 1,
      this.isOptional = false,
      this.doctrinalNote})
      : _allowedCittaIds = allowedCittaIds;

  factory _$VithiStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$VithiStepImplFromJson(json);

// Số thứ tự sát-na (1-based, Javana đánh số 1–7 bên trong)
  @override
  final int stepNumber;
// Vai trò của sát-na này
  @override
  final VithiStepRole role;
// Tên Pāḷi
  @override
  final String namePali;
// Tên tiếng Việt
  @override
  final String nameVietnamese;
// Mô tả ngắn phận sự
  @override
  final String description;
// Danh sách Citta IDs có thể sanh lên tại sát-na này
  final List<String> _allowedCittaIds;
// Danh sách Citta IDs có thể sanh lên tại sát-na này
  @override
  @JsonKey()
  List<String> get allowedCittaIds {
    if (_allowedCittaIds is EqualUnmodifiableListView) return _allowedCittaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedCittaIds);
  }

// Số lần lặp lại (-1 = vô số, vd: Bhavaṅga-sota)
  @override
  @JsonKey()
  final int repeatCount;
// Sát-na này có thể vắng mặt không (vd: Tadārammaṇa)
  @override
  @JsonKey()
  final bool isOptional;
// Ghi chú
  @override
  final String? doctrinalNote;

  @override
  String toString() {
    return 'VithiStep(stepNumber: $stepNumber, role: $role, namePali: $namePali, nameVietnamese: $nameVietnamese, description: $description, allowedCittaIds: $allowedCittaIds, repeatCount: $repeatCount, isOptional: $isOptional, doctrinalNote: $doctrinalNote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VithiStepImpl &&
            (identical(other.stepNumber, stepNumber) ||
                other.stepNumber == stepNumber) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.namePali, namePali) ||
                other.namePali == namePali) &&
            (identical(other.nameVietnamese, nameVietnamese) ||
                other.nameVietnamese == nameVietnamese) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._allowedCittaIds, _allowedCittaIds) &&
            (identical(other.repeatCount, repeatCount) ||
                other.repeatCount == repeatCount) &&
            (identical(other.isOptional, isOptional) ||
                other.isOptional == isOptional) &&
            (identical(other.doctrinalNote, doctrinalNote) ||
                other.doctrinalNote == doctrinalNote));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stepNumber,
      role,
      namePali,
      nameVietnamese,
      description,
      const DeepCollectionEquality().hash(_allowedCittaIds),
      repeatCount,
      isOptional,
      doctrinalNote);

  /// Create a copy of VithiStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VithiStepImplCopyWith<_$VithiStepImpl> get copyWith =>
      __$$VithiStepImplCopyWithImpl<_$VithiStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VithiStepImplToJson(
      this,
    );
  }
}

abstract class _VithiStep implements VithiStep {
  const factory _VithiStep(
      {required final int stepNumber,
      required final VithiStepRole role,
      required final String namePali,
      required final String nameVietnamese,
      required final String description,
      final List<String> allowedCittaIds,
      final int repeatCount,
      final bool isOptional,
      final String? doctrinalNote}) = _$VithiStepImpl;

  factory _VithiStep.fromJson(Map<String, dynamic> json) =
      _$VithiStepImpl.fromJson;

// Số thứ tự sát-na (1-based, Javana đánh số 1–7 bên trong)
  @override
  int get stepNumber; // Vai trò của sát-na này
  @override
  VithiStepRole get role; // Tên Pāḷi
  @override
  String get namePali; // Tên tiếng Việt
  @override
  String get nameVietnamese; // Mô tả ngắn phận sự
  @override
  String get description; // Danh sách Citta IDs có thể sanh lên tại sát-na này
  @override
  List<String>
      get allowedCittaIds; // Số lần lặp lại (-1 = vô số, vd: Bhavaṅga-sota)
  @override
  int get repeatCount; // Sát-na này có thể vắng mặt không (vd: Tadārammaṇa)
  @override
  bool get isOptional; // Ghi chú
  @override
  String? get doctrinalNote;

  /// Create a copy of VithiStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VithiStepImplCopyWith<_$VithiStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VithiModel _$VithiModelFromJson(Map<String, dynamic> json) {
  return _VithiModel.fromJson(json);
}

/// @nodoc
mixin _$VithiModel {
// ID định danh, vd: VT_NGU_MON_RATLON, VT_Y_MON, VT_VITHIMUTTA
  String get id =>
      throw _privateConstructorUsedError; // Tên Pāḷi của loại lộ trình
  String get namePali =>
      throw _privateConstructorUsedError; // Tên tiếng Việt đầy đủ
  String get nameVietnamese =>
      throw _privateConstructorUsedError; // Tên ngắn hiển thị trong UI
  String get nameShort => throw _privateConstructorUsedError; // Loại cửa
  VithiDvara get dvara =>
      throw _privateConstructorUsedError; // Loại lộ chi tiết
  VithiType get vithiType =>
      throw _privateConstructorUsedError; // Mô tả tổng quan
  String get descriptionVi =>
      throw _privateConstructorUsedError; // Tổng số sát-na định danh trong lộ
  int get totalSteps =>
      throw _privateConstructorUsedError; // Danh sách sát-na theo thứ tự
  List<VithiStep> get steps =>
      throw _privateConstructorUsedError; // Điều kiện để lộ này phát sinh
  String? get arisingCondition =>
      throw _privateConstructorUsedError; // Ý nghĩa / kết quả của lộ này
  String? get significance =>
      throw _privateConstructorUsedError; // Ghi chú giáo lý
  String? get doctrinalNote =>
      throw _privateConstructorUsedError; // Số thứ tự sắp xếp (cho UI)
  int get orderIndex => throw _privateConstructorUsedError;

  /// Serializes this VithiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VithiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VithiModelCopyWith<VithiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VithiModelCopyWith<$Res> {
  factory $VithiModelCopyWith(
          VithiModel value, $Res Function(VithiModel) then) =
      _$VithiModelCopyWithImpl<$Res, VithiModel>;
  @useResult
  $Res call(
      {String id,
      String namePali,
      String nameVietnamese,
      String nameShort,
      VithiDvara dvara,
      VithiType vithiType,
      String descriptionVi,
      int totalSteps,
      List<VithiStep> steps,
      String? arisingCondition,
      String? significance,
      String? doctrinalNote,
      int orderIndex});
}

/// @nodoc
class _$VithiModelCopyWithImpl<$Res, $Val extends VithiModel>
    implements $VithiModelCopyWith<$Res> {
  _$VithiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VithiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? nameShort = null,
    Object? dvara = null,
    Object? vithiType = null,
    Object? descriptionVi = null,
    Object? totalSteps = null,
    Object? steps = null,
    Object? arisingCondition = freezed,
    Object? significance = freezed,
    Object? doctrinalNote = freezed,
    Object? orderIndex = null,
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
      dvara: null == dvara
          ? _value.dvara
          : dvara // ignore: cast_nullable_to_non_nullable
              as VithiDvara,
      vithiType: null == vithiType
          ? _value.vithiType
          : vithiType // ignore: cast_nullable_to_non_nullable
              as VithiType,
      descriptionVi: null == descriptionVi
          ? _value.descriptionVi
          : descriptionVi // ignore: cast_nullable_to_non_nullable
              as String,
      totalSteps: null == totalSteps
          ? _value.totalSteps
          : totalSteps // ignore: cast_nullable_to_non_nullable
              as int,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<VithiStep>,
      arisingCondition: freezed == arisingCondition
          ? _value.arisingCondition
          : arisingCondition // ignore: cast_nullable_to_non_nullable
              as String?,
      significance: freezed == significance
          ? _value.significance
          : significance // ignore: cast_nullable_to_non_nullable
              as String?,
      doctrinalNote: freezed == doctrinalNote
          ? _value.doctrinalNote
          : doctrinalNote // ignore: cast_nullable_to_non_nullable
              as String?,
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VithiModelImplCopyWith<$Res>
    implements $VithiModelCopyWith<$Res> {
  factory _$$VithiModelImplCopyWith(
          _$VithiModelImpl value, $Res Function(_$VithiModelImpl) then) =
      __$$VithiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String namePali,
      String nameVietnamese,
      String nameShort,
      VithiDvara dvara,
      VithiType vithiType,
      String descriptionVi,
      int totalSteps,
      List<VithiStep> steps,
      String? arisingCondition,
      String? significance,
      String? doctrinalNote,
      int orderIndex});
}

/// @nodoc
class __$$VithiModelImplCopyWithImpl<$Res>
    extends _$VithiModelCopyWithImpl<$Res, _$VithiModelImpl>
    implements _$$VithiModelImplCopyWith<$Res> {
  __$$VithiModelImplCopyWithImpl(
      _$VithiModelImpl _value, $Res Function(_$VithiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of VithiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? nameShort = null,
    Object? dvara = null,
    Object? vithiType = null,
    Object? descriptionVi = null,
    Object? totalSteps = null,
    Object? steps = null,
    Object? arisingCondition = freezed,
    Object? significance = freezed,
    Object? doctrinalNote = freezed,
    Object? orderIndex = null,
  }) {
    return _then(_$VithiModelImpl(
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
      dvara: null == dvara
          ? _value.dvara
          : dvara // ignore: cast_nullable_to_non_nullable
              as VithiDvara,
      vithiType: null == vithiType
          ? _value.vithiType
          : vithiType // ignore: cast_nullable_to_non_nullable
              as VithiType,
      descriptionVi: null == descriptionVi
          ? _value.descriptionVi
          : descriptionVi // ignore: cast_nullable_to_non_nullable
              as String,
      totalSteps: null == totalSteps
          ? _value.totalSteps
          : totalSteps // ignore: cast_nullable_to_non_nullable
              as int,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<VithiStep>,
      arisingCondition: freezed == arisingCondition
          ? _value.arisingCondition
          : arisingCondition // ignore: cast_nullable_to_non_nullable
              as String?,
      significance: freezed == significance
          ? _value.significance
          : significance // ignore: cast_nullable_to_non_nullable
              as String?,
      doctrinalNote: freezed == doctrinalNote
          ? _value.doctrinalNote
          : doctrinalNote // ignore: cast_nullable_to_non_nullable
              as String?,
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VithiModelImpl implements _VithiModel {
  const _$VithiModelImpl(
      {required this.id,
      required this.namePali,
      required this.nameVietnamese,
      required this.nameShort,
      required this.dvara,
      required this.vithiType,
      required this.descriptionVi,
      required this.totalSteps,
      required final List<VithiStep> steps,
      this.arisingCondition,
      this.significance,
      this.doctrinalNote,
      this.orderIndex = 0})
      : _steps = steps;

  factory _$VithiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VithiModelImplFromJson(json);

// ID định danh, vd: VT_NGU_MON_RATLON, VT_Y_MON, VT_VITHIMUTTA
  @override
  final String id;
// Tên Pāḷi của loại lộ trình
  @override
  final String namePali;
// Tên tiếng Việt đầy đủ
  @override
  final String nameVietnamese;
// Tên ngắn hiển thị trong UI
  @override
  final String nameShort;
// Loại cửa
  @override
  final VithiDvara dvara;
// Loại lộ chi tiết
  @override
  final VithiType vithiType;
// Mô tả tổng quan
  @override
  final String descriptionVi;
// Tổng số sát-na định danh trong lộ
  @override
  final int totalSteps;
// Danh sách sát-na theo thứ tự
  final List<VithiStep> _steps;
// Danh sách sát-na theo thứ tự
  @override
  List<VithiStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

// Điều kiện để lộ này phát sinh
  @override
  final String? arisingCondition;
// Ý nghĩa / kết quả của lộ này
  @override
  final String? significance;
// Ghi chú giáo lý
  @override
  final String? doctrinalNote;
// Số thứ tự sắp xếp (cho UI)
  @override
  @JsonKey()
  final int orderIndex;

  @override
  String toString() {
    return 'VithiModel(id: $id, namePali: $namePali, nameVietnamese: $nameVietnamese, nameShort: $nameShort, dvara: $dvara, vithiType: $vithiType, descriptionVi: $descriptionVi, totalSteps: $totalSteps, steps: $steps, arisingCondition: $arisingCondition, significance: $significance, doctrinalNote: $doctrinalNote, orderIndex: $orderIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VithiModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namePali, namePali) ||
                other.namePali == namePali) &&
            (identical(other.nameVietnamese, nameVietnamese) ||
                other.nameVietnamese == nameVietnamese) &&
            (identical(other.nameShort, nameShort) ||
                other.nameShort == nameShort) &&
            (identical(other.dvara, dvara) || other.dvara == dvara) &&
            (identical(other.vithiType, vithiType) ||
                other.vithiType == vithiType) &&
            (identical(other.descriptionVi, descriptionVi) ||
                other.descriptionVi == descriptionVi) &&
            (identical(other.totalSteps, totalSteps) ||
                other.totalSteps == totalSteps) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.arisingCondition, arisingCondition) ||
                other.arisingCondition == arisingCondition) &&
            (identical(other.significance, significance) ||
                other.significance == significance) &&
            (identical(other.doctrinalNote, doctrinalNote) ||
                other.doctrinalNote == doctrinalNote) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      namePali,
      nameVietnamese,
      nameShort,
      dvara,
      vithiType,
      descriptionVi,
      totalSteps,
      const DeepCollectionEquality().hash(_steps),
      arisingCondition,
      significance,
      doctrinalNote,
      orderIndex);

  /// Create a copy of VithiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VithiModelImplCopyWith<_$VithiModelImpl> get copyWith =>
      __$$VithiModelImplCopyWithImpl<_$VithiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VithiModelImplToJson(
      this,
    );
  }
}

abstract class _VithiModel implements VithiModel {
  const factory _VithiModel(
      {required final String id,
      required final String namePali,
      required final String nameVietnamese,
      required final String nameShort,
      required final VithiDvara dvara,
      required final VithiType vithiType,
      required final String descriptionVi,
      required final int totalSteps,
      required final List<VithiStep> steps,
      final String? arisingCondition,
      final String? significance,
      final String? doctrinalNote,
      final int orderIndex}) = _$VithiModelImpl;

  factory _VithiModel.fromJson(Map<String, dynamic> json) =
      _$VithiModelImpl.fromJson;

// ID định danh, vd: VT_NGU_MON_RATLON, VT_Y_MON, VT_VITHIMUTTA
  @override
  String get id; // Tên Pāḷi của loại lộ trình
  @override
  String get namePali; // Tên tiếng Việt đầy đủ
  @override
  String get nameVietnamese; // Tên ngắn hiển thị trong UI
  @override
  String get nameShort; // Loại cửa
  @override
  VithiDvara get dvara; // Loại lộ chi tiết
  @override
  VithiType get vithiType; // Mô tả tổng quan
  @override
  String get descriptionVi; // Tổng số sát-na định danh trong lộ
  @override
  int get totalSteps; // Danh sách sát-na theo thứ tự
  @override
  List<VithiStep> get steps; // Điều kiện để lộ này phát sinh
  @override
  String? get arisingCondition; // Ý nghĩa / kết quả của lộ này
  @override
  String? get significance; // Ghi chú giáo lý
  @override
  String? get doctrinalNote; // Số thứ tự sắp xếp (cho UI)
  @override
  int get orderIndex;

  /// Create a copy of VithiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VithiModelImplCopyWith<_$VithiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
