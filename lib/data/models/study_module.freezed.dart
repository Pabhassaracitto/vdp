// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_module.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudyModule _$StudyModuleFromJson(Map<String, dynamic> json) {
  return _StudyModule.fromJson(json);
}

/// @nodoc
mixin _$StudyModule {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get titlePali => throw _privateConstructorUsedError;
  String get description =>
      throw _privateConstructorUsedError; // Prerequisite modules (edges trong Study Graph)
  List<String> get prerequisiteIds =>
      throw _privateConstructorUsedError; // Danh sách Tâm liên quan
  List<String> get cittaIds =>
      throw _privateConstructorUsedError; // Danh sách Tâm Sở liên quan
  List<String> get cetasikaIds =>
      throw _privateConstructorUsedError; // Thứ tự khuyến nghị
  int get recommendedOrder =>
      throw _privateConstructorUsedError; // Màu sắc cho UI
  int get colorCode => throw _privateConstructorUsedError; // Icon
  String get icon =>
      throw _privateConstructorUsedError; // Có phải bắt buộc không
  bool get isRequired => throw _privateConstructorUsedError; // Phase (1/2/3)
  int get phase => throw _privateConstructorUsedError;

  /// Serializes this StudyModule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudyModule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudyModuleCopyWith<StudyModule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudyModuleCopyWith<$Res> {
  factory $StudyModuleCopyWith(
          StudyModule value, $Res Function(StudyModule) then) =
      _$StudyModuleCopyWithImpl<$Res, StudyModule>;
  @useResult
  $Res call(
      {String id,
      String title,
      String titlePali,
      String description,
      List<String> prerequisiteIds,
      List<String> cittaIds,
      List<String> cetasikaIds,
      int recommendedOrder,
      int colorCode,
      String icon,
      bool isRequired,
      int phase});
}

/// @nodoc
class _$StudyModuleCopyWithImpl<$Res, $Val extends StudyModule>
    implements $StudyModuleCopyWith<$Res> {
  _$StudyModuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudyModule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? titlePali = null,
    Object? description = null,
    Object? prerequisiteIds = null,
    Object? cittaIds = null,
    Object? cetasikaIds = null,
    Object? recommendedOrder = null,
    Object? colorCode = null,
    Object? icon = null,
    Object? isRequired = null,
    Object? phase = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titlePali: null == titlePali
          ? _value.titlePali
          : titlePali // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      prerequisiteIds: null == prerequisiteIds
          ? _value.prerequisiteIds
          : prerequisiteIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cittaIds: null == cittaIds
          ? _value.cittaIds
          : cittaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cetasikaIds: null == cetasikaIds
          ? _value.cetasikaIds
          : cetasikaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recommendedOrder: null == recommendedOrder
          ? _value.recommendedOrder
          : recommendedOrder // ignore: cast_nullable_to_non_nullable
              as int,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudyModuleImplCopyWith<$Res>
    implements $StudyModuleCopyWith<$Res> {
  factory _$$StudyModuleImplCopyWith(
          _$StudyModuleImpl value, $Res Function(_$StudyModuleImpl) then) =
      __$$StudyModuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String titlePali,
      String description,
      List<String> prerequisiteIds,
      List<String> cittaIds,
      List<String> cetasikaIds,
      int recommendedOrder,
      int colorCode,
      String icon,
      bool isRequired,
      int phase});
}

/// @nodoc
class __$$StudyModuleImplCopyWithImpl<$Res>
    extends _$StudyModuleCopyWithImpl<$Res, _$StudyModuleImpl>
    implements _$$StudyModuleImplCopyWith<$Res> {
  __$$StudyModuleImplCopyWithImpl(
      _$StudyModuleImpl _value, $Res Function(_$StudyModuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of StudyModule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? titlePali = null,
    Object? description = null,
    Object? prerequisiteIds = null,
    Object? cittaIds = null,
    Object? cetasikaIds = null,
    Object? recommendedOrder = null,
    Object? colorCode = null,
    Object? icon = null,
    Object? isRequired = null,
    Object? phase = null,
  }) {
    return _then(_$StudyModuleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titlePali: null == titlePali
          ? _value.titlePali
          : titlePali // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      prerequisiteIds: null == prerequisiteIds
          ? _value._prerequisiteIds
          : prerequisiteIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cittaIds: null == cittaIds
          ? _value._cittaIds
          : cittaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cetasikaIds: null == cetasikaIds
          ? _value._cetasikaIds
          : cetasikaIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recommendedOrder: null == recommendedOrder
          ? _value.recommendedOrder
          : recommendedOrder // ignore: cast_nullable_to_non_nullable
              as int,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      isRequired: null == isRequired
          ? _value.isRequired
          : isRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudyModuleImpl implements _StudyModule {
  const _$StudyModuleImpl(
      {required this.id,
      required this.title,
      required this.titlePali,
      required this.description,
      final List<String> prerequisiteIds = const [],
      final List<String> cittaIds = const [],
      final List<String> cetasikaIds = const [],
      required this.recommendedOrder,
      required this.colorCode,
      required this.icon,
      this.isRequired = false,
      this.phase = 1})
      : _prerequisiteIds = prerequisiteIds,
        _cittaIds = cittaIds,
        _cetasikaIds = cetasikaIds;

  factory _$StudyModuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudyModuleImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String titlePali;
  @override
  final String description;
// Prerequisite modules (edges trong Study Graph)
  final List<String> _prerequisiteIds;
// Prerequisite modules (edges trong Study Graph)
  @override
  @JsonKey()
  List<String> get prerequisiteIds {
    if (_prerequisiteIds is EqualUnmodifiableListView) return _prerequisiteIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prerequisiteIds);
  }

// Danh sách Tâm liên quan
  final List<String> _cittaIds;
// Danh sách Tâm liên quan
  @override
  @JsonKey()
  List<String> get cittaIds {
    if (_cittaIds is EqualUnmodifiableListView) return _cittaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cittaIds);
  }

// Danh sách Tâm Sở liên quan
  final List<String> _cetasikaIds;
// Danh sách Tâm Sở liên quan
  @override
  @JsonKey()
  List<String> get cetasikaIds {
    if (_cetasikaIds is EqualUnmodifiableListView) return _cetasikaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cetasikaIds);
  }

// Thứ tự khuyến nghị
  @override
  final int recommendedOrder;
// Màu sắc cho UI
  @override
  final int colorCode;
// Icon
  @override
  final String icon;
// Có phải bắt buộc không
  @override
  @JsonKey()
  final bool isRequired;
// Phase (1/2/3)
  @override
  @JsonKey()
  final int phase;

  @override
  String toString() {
    return 'StudyModule(id: $id, title: $title, titlePali: $titlePali, description: $description, prerequisiteIds: $prerequisiteIds, cittaIds: $cittaIds, cetasikaIds: $cetasikaIds, recommendedOrder: $recommendedOrder, colorCode: $colorCode, icon: $icon, isRequired: $isRequired, phase: $phase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudyModuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titlePali, titlePali) ||
                other.titlePali == titlePali) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._prerequisiteIds, _prerequisiteIds) &&
            const DeepCollectionEquality().equals(other._cittaIds, _cittaIds) &&
            const DeepCollectionEquality()
                .equals(other._cetasikaIds, _cetasikaIds) &&
            (identical(other.recommendedOrder, recommendedOrder) ||
                other.recommendedOrder == recommendedOrder) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.phase, phase) || other.phase == phase));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      titlePali,
      description,
      const DeepCollectionEquality().hash(_prerequisiteIds),
      const DeepCollectionEquality().hash(_cittaIds),
      const DeepCollectionEquality().hash(_cetasikaIds),
      recommendedOrder,
      colorCode,
      icon,
      isRequired,
      phase);

  /// Create a copy of StudyModule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudyModuleImplCopyWith<_$StudyModuleImpl> get copyWith =>
      __$$StudyModuleImplCopyWithImpl<_$StudyModuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudyModuleImplToJson(
      this,
    );
  }
}

abstract class _StudyModule implements StudyModule {
  const factory _StudyModule(
      {required final String id,
      required final String title,
      required final String titlePali,
      required final String description,
      final List<String> prerequisiteIds,
      final List<String> cittaIds,
      final List<String> cetasikaIds,
      required final int recommendedOrder,
      required final int colorCode,
      required final String icon,
      final bool isRequired,
      final int phase}) = _$StudyModuleImpl;

  factory _StudyModule.fromJson(Map<String, dynamic> json) =
      _$StudyModuleImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get titlePali;
  @override
  String get description; // Prerequisite modules (edges trong Study Graph)
  @override
  List<String> get prerequisiteIds; // Danh sách Tâm liên quan
  @override
  List<String> get cittaIds; // Danh sách Tâm Sở liên quan
  @override
  List<String> get cetasikaIds; // Thứ tự khuyến nghị
  @override
  int get recommendedOrder; // Màu sắc cho UI
  @override
  int get colorCode; // Icon
  @override
  String get icon; // Có phải bắt buộc không
  @override
  bool get isRequired; // Phase (1/2/3)
  @override
  int get phase;

  /// Create a copy of StudyModule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudyModuleImplCopyWith<_$StudyModuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
