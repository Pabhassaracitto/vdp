// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kamma_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KammaModel _$KammaModelFromJson(Map<String, dynamic> json) {
  return _KammaModel.fromJson(json);
}

/// @nodoc
mixin _$KammaModel {
// ID định danh, format: KM_T_01 (Thời gian), KM_P_01 (Phận sự),
//                       KM_U_01 (Ưu tiên), KM_Q_01 (Quả)
  String get id =>
      throw _privateConstructorUsedError; // Tên Pāḷi (có dấu macron)
  String get namePali =>
      throw _privateConstructorUsedError; // Tên tiếng Việt đầy đủ
  String get nameVietnamese =>
      throw _privateConstructorUsedError; // Tên viết tắt hiển thị
  String get nameShort =>
      throw _privateConstructorUsedError; // Nhóm phân loại — chỉ 1 trong 4 nhóm có giá trị, 3 còn lại null
  KammaByTime? get byTime => throw _privateConstructorUsedError;
  KammaByFunction? get byFunction => throw _privateConstructorUsedError;
  KammaByPriority? get byPriority => throw _privateConstructorUsedError;
  KammaByResult? get byResult =>
      throw _privateConstructorUsedError; // Số thứ tự trong nhóm của nó (1-based)
  int get orderIndex =>
      throw _privateConstructorUsedError; // Mô tả tiếng Việt (trích từ giáo trình King Milanda A)
  String get descriptionVi =>
      throw _privateConstructorUsedError; // Ví dụ minh hoạ
  List<String> get examples =>
      throw _privateConstructorUsedError; // Citta IDs liên quan (tâm nào tạo nghiệp này)
  List<String> get relatedCittaIds =>
      throw _privateConstructorUsedError; // Ghi chú giáo lý
  String? get doctrinalNote => throw _privateConstructorUsedError;

  /// Serializes this KammaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KammaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KammaModelCopyWith<KammaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KammaModelCopyWith<$Res> {
  factory $KammaModelCopyWith(
          KammaModel value, $Res Function(KammaModel) then) =
      _$KammaModelCopyWithImpl<$Res, KammaModel>;
  @useResult
  $Res call(
      {String id,
      String namePali,
      String nameVietnamese,
      String nameShort,
      KammaByTime? byTime,
      KammaByFunction? byFunction,
      KammaByPriority? byPriority,
      KammaByResult? byResult,
      int orderIndex,
      String descriptionVi,
      List<String> examples,
      List<String> relatedCittaIds,
      String? doctrinalNote});
}

/// @nodoc
class _$KammaModelCopyWithImpl<$Res, $Val extends KammaModel>
    implements $KammaModelCopyWith<$Res> {
  _$KammaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KammaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? nameShort = null,
    Object? byTime = freezed,
    Object? byFunction = freezed,
    Object? byPriority = freezed,
    Object? byResult = freezed,
    Object? orderIndex = null,
    Object? descriptionVi = null,
    Object? examples = null,
    Object? relatedCittaIds = null,
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
      byTime: freezed == byTime
          ? _value.byTime
          : byTime // ignore: cast_nullable_to_non_nullable
              as KammaByTime?,
      byFunction: freezed == byFunction
          ? _value.byFunction
          : byFunction // ignore: cast_nullable_to_non_nullable
              as KammaByFunction?,
      byPriority: freezed == byPriority
          ? _value.byPriority
          : byPriority // ignore: cast_nullable_to_non_nullable
              as KammaByPriority?,
      byResult: freezed == byResult
          ? _value.byResult
          : byResult // ignore: cast_nullable_to_non_nullable
              as KammaByResult?,
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      descriptionVi: null == descriptionVi
          ? _value.descriptionVi
          : descriptionVi // ignore: cast_nullable_to_non_nullable
              as String,
      examples: null == examples
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedCittaIds: null == relatedCittaIds
          ? _value.relatedCittaIds
          : relatedCittaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      doctrinalNote: freezed == doctrinalNote
          ? _value.doctrinalNote
          : doctrinalNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KammaModelImplCopyWith<$Res>
    implements $KammaModelCopyWith<$Res> {
  factory _$$KammaModelImplCopyWith(
          _$KammaModelImpl value, $Res Function(_$KammaModelImpl) then) =
      __$$KammaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String namePali,
      String nameVietnamese,
      String nameShort,
      KammaByTime? byTime,
      KammaByFunction? byFunction,
      KammaByPriority? byPriority,
      KammaByResult? byResult,
      int orderIndex,
      String descriptionVi,
      List<String> examples,
      List<String> relatedCittaIds,
      String? doctrinalNote});
}

/// @nodoc
class __$$KammaModelImplCopyWithImpl<$Res>
    extends _$KammaModelCopyWithImpl<$Res, _$KammaModelImpl>
    implements _$$KammaModelImplCopyWith<$Res> {
  __$$KammaModelImplCopyWithImpl(
      _$KammaModelImpl _value, $Res Function(_$KammaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of KammaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? nameShort = null,
    Object? byTime = freezed,
    Object? byFunction = freezed,
    Object? byPriority = freezed,
    Object? byResult = freezed,
    Object? orderIndex = null,
    Object? descriptionVi = null,
    Object? examples = null,
    Object? relatedCittaIds = null,
    Object? doctrinalNote = freezed,
  }) {
    return _then(_$KammaModelImpl(
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
      byTime: freezed == byTime
          ? _value.byTime
          : byTime // ignore: cast_nullable_to_non_nullable
              as KammaByTime?,
      byFunction: freezed == byFunction
          ? _value.byFunction
          : byFunction // ignore: cast_nullable_to_non_nullable
              as KammaByFunction?,
      byPriority: freezed == byPriority
          ? _value.byPriority
          : byPriority // ignore: cast_nullable_to_non_nullable
              as KammaByPriority?,
      byResult: freezed == byResult
          ? _value.byResult
          : byResult // ignore: cast_nullable_to_non_nullable
              as KammaByResult?,
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      descriptionVi: null == descriptionVi
          ? _value.descriptionVi
          : descriptionVi // ignore: cast_nullable_to_non_nullable
              as String,
      examples: null == examples
          ? _value._examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relatedCittaIds: null == relatedCittaIds
          ? _value._relatedCittaIds
          : relatedCittaIds // ignore: cast_nullable_to_non_nullable
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
class _$KammaModelImpl implements _KammaModel {
  const _$KammaModelImpl(
      {required this.id,
      required this.namePali,
      required this.nameVietnamese,
      required this.nameShort,
      required this.byTime,
      required this.byFunction,
      required this.byPriority,
      required this.byResult,
      required this.orderIndex,
      required this.descriptionVi,
      final List<String> examples = const [],
      final List<String> relatedCittaIds = const [],
      this.doctrinalNote})
      : _examples = examples,
        _relatedCittaIds = relatedCittaIds;

  factory _$KammaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KammaModelImplFromJson(json);

// ID định danh, format: KM_T_01 (Thời gian), KM_P_01 (Phận sự),
//                       KM_U_01 (Ưu tiên), KM_Q_01 (Quả)
  @override
  final String id;
// Tên Pāḷi (có dấu macron)
  @override
  final String namePali;
// Tên tiếng Việt đầy đủ
  @override
  final String nameVietnamese;
// Tên viết tắt hiển thị
  @override
  final String nameShort;
// Nhóm phân loại — chỉ 1 trong 4 nhóm có giá trị, 3 còn lại null
  @override
  final KammaByTime? byTime;
  @override
  final KammaByFunction? byFunction;
  @override
  final KammaByPriority? byPriority;
  @override
  final KammaByResult? byResult;
// Số thứ tự trong nhóm của nó (1-based)
  @override
  final int orderIndex;
// Mô tả tiếng Việt (trích từ giáo trình King Milanda A)
  @override
  final String descriptionVi;
// Ví dụ minh hoạ
  final List<String> _examples;
// Ví dụ minh hoạ
  @override
  @JsonKey()
  List<String> get examples {
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_examples);
  }

// Citta IDs liên quan (tâm nào tạo nghiệp này)
  final List<String> _relatedCittaIds;
// Citta IDs liên quan (tâm nào tạo nghiệp này)
  @override
  @JsonKey()
  List<String> get relatedCittaIds {
    if (_relatedCittaIds is EqualUnmodifiableListView) return _relatedCittaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedCittaIds);
  }

// Ghi chú giáo lý
  @override
  final String? doctrinalNote;

  @override
  String toString() {
    return 'KammaModel(id: $id, namePali: $namePali, nameVietnamese: $nameVietnamese, nameShort: $nameShort, byTime: $byTime, byFunction: $byFunction, byPriority: $byPriority, byResult: $byResult, orderIndex: $orderIndex, descriptionVi: $descriptionVi, examples: $examples, relatedCittaIds: $relatedCittaIds, doctrinalNote: $doctrinalNote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KammaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namePali, namePali) ||
                other.namePali == namePali) &&
            (identical(other.nameVietnamese, nameVietnamese) ||
                other.nameVietnamese == nameVietnamese) &&
            (identical(other.nameShort, nameShort) ||
                other.nameShort == nameShort) &&
            (identical(other.byTime, byTime) || other.byTime == byTime) &&
            (identical(other.byFunction, byFunction) ||
                other.byFunction == byFunction) &&
            (identical(other.byPriority, byPriority) ||
                other.byPriority == byPriority) &&
            (identical(other.byResult, byResult) ||
                other.byResult == byResult) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.descriptionVi, descriptionVi) ||
                other.descriptionVi == descriptionVi) &&
            const DeepCollectionEquality().equals(other._examples, _examples) &&
            const DeepCollectionEquality()
                .equals(other._relatedCittaIds, _relatedCittaIds) &&
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
      byTime,
      byFunction,
      byPriority,
      byResult,
      orderIndex,
      descriptionVi,
      const DeepCollectionEquality().hash(_examples),
      const DeepCollectionEquality().hash(_relatedCittaIds),
      doctrinalNote);

  /// Create a copy of KammaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KammaModelImplCopyWith<_$KammaModelImpl> get copyWith =>
      __$$KammaModelImplCopyWithImpl<_$KammaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KammaModelImplToJson(
      this,
    );
  }
}

abstract class _KammaModel implements KammaModel {
  const factory _KammaModel(
      {required final String id,
      required final String namePali,
      required final String nameVietnamese,
      required final String nameShort,
      required final KammaByTime? byTime,
      required final KammaByFunction? byFunction,
      required final KammaByPriority? byPriority,
      required final KammaByResult? byResult,
      required final int orderIndex,
      required final String descriptionVi,
      final List<String> examples,
      final List<String> relatedCittaIds,
      final String? doctrinalNote}) = _$KammaModelImpl;

  factory _KammaModel.fromJson(Map<String, dynamic> json) =
      _$KammaModelImpl.fromJson;

// ID định danh, format: KM_T_01 (Thời gian), KM_P_01 (Phận sự),
//                       KM_U_01 (Ưu tiên), KM_Q_01 (Quả)
  @override
  String get id; // Tên Pāḷi (có dấu macron)
  @override
  String get namePali; // Tên tiếng Việt đầy đủ
  @override
  String get nameVietnamese; // Tên viết tắt hiển thị
  @override
  String
      get nameShort; // Nhóm phân loại — chỉ 1 trong 4 nhóm có giá trị, 3 còn lại null
  @override
  KammaByTime? get byTime;
  @override
  KammaByFunction? get byFunction;
  @override
  KammaByPriority? get byPriority;
  @override
  KammaByResult? get byResult; // Số thứ tự trong nhóm của nó (1-based)
  @override
  int get orderIndex; // Mô tả tiếng Việt (trích từ giáo trình King Milanda A)
  @override
  String get descriptionVi; // Ví dụ minh hoạ
  @override
  List<String> get examples; // Citta IDs liên quan (tâm nào tạo nghiệp này)
  @override
  List<String> get relatedCittaIds; // Ghi chú giáo lý
  @override
  String? get doctrinalNote;

  /// Create a copy of KammaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KammaModelImplCopyWith<_$KammaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
