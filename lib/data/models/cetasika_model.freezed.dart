// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cetasika_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConflictRule _$ConflictRuleFromJson(Map<String, dynamic> json) {
  return _ConflictRule.fromJson(json);
}

/// @nodoc
mixin _$ConflictRule {
  String get ruleId => throw _privateConstructorUsedError;
  ConflictType get type => throw _privateConstructorUsedError;
  List<String> get conflictingIds =>
      throw _privateConstructorUsedError; // Danh sách Tâm Sở xung đột
  String get explanation =>
      throw _privateConstructorUsedError; // Giải thích tiếng Việt
  String? get explanationPali => throw _privateConstructorUsedError;

  /// Serializes this ConflictRule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConflictRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConflictRuleCopyWith<ConflictRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConflictRuleCopyWith<$Res> {
  factory $ConflictRuleCopyWith(
          ConflictRule value, $Res Function(ConflictRule) then) =
      _$ConflictRuleCopyWithImpl<$Res, ConflictRule>;
  @useResult
  $Res call(
      {String ruleId,
      ConflictType type,
      List<String> conflictingIds,
      String explanation,
      String? explanationPali});
}

/// @nodoc
class _$ConflictRuleCopyWithImpl<$Res, $Val extends ConflictRule>
    implements $ConflictRuleCopyWith<$Res> {
  _$ConflictRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConflictRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ruleId = null,
    Object? type = null,
    Object? conflictingIds = null,
    Object? explanation = null,
    Object? explanationPali = freezed,
  }) {
    return _then(_value.copyWith(
      ruleId: null == ruleId
          ? _value.ruleId
          : ruleId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConflictType,
      conflictingIds: null == conflictingIds
          ? _value.conflictingIds
          : conflictingIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$ConflictRuleImplCopyWith<$Res>
    implements $ConflictRuleCopyWith<$Res> {
  factory _$$ConflictRuleImplCopyWith(
          _$ConflictRuleImpl value, $Res Function(_$ConflictRuleImpl) then) =
      __$$ConflictRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ruleId,
      ConflictType type,
      List<String> conflictingIds,
      String explanation,
      String? explanationPali});
}

/// @nodoc
class __$$ConflictRuleImplCopyWithImpl<$Res>
    extends _$ConflictRuleCopyWithImpl<$Res, _$ConflictRuleImpl>
    implements _$$ConflictRuleImplCopyWith<$Res> {
  __$$ConflictRuleImplCopyWithImpl(
      _$ConflictRuleImpl _value, $Res Function(_$ConflictRuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConflictRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ruleId = null,
    Object? type = null,
    Object? conflictingIds = null,
    Object? explanation = null,
    Object? explanationPali = freezed,
  }) {
    return _then(_$ConflictRuleImpl(
      ruleId: null == ruleId
          ? _value.ruleId
          : ruleId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConflictType,
      conflictingIds: null == conflictingIds
          ? _value._conflictingIds
          : conflictingIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$ConflictRuleImpl implements _ConflictRule {
  const _$ConflictRuleImpl(
      {required this.ruleId,
      required this.type,
      required final List<String> conflictingIds,
      required this.explanation,
      this.explanationPali})
      : _conflictingIds = conflictingIds;

  factory _$ConflictRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConflictRuleImplFromJson(json);

  @override
  final String ruleId;
  @override
  final ConflictType type;
  final List<String> _conflictingIds;
  @override
  List<String> get conflictingIds {
    if (_conflictingIds is EqualUnmodifiableListView) return _conflictingIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conflictingIds);
  }

// Danh sách Tâm Sở xung đột
  @override
  final String explanation;
// Giải thích tiếng Việt
  @override
  final String? explanationPali;

  @override
  String toString() {
    return 'ConflictRule(ruleId: $ruleId, type: $type, conflictingIds: $conflictingIds, explanation: $explanation, explanationPali: $explanationPali)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConflictRuleImpl &&
            (identical(other.ruleId, ruleId) || other.ruleId == ruleId) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._conflictingIds, _conflictingIds) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.explanationPali, explanationPali) ||
                other.explanationPali == explanationPali));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ruleId,
      type,
      const DeepCollectionEquality().hash(_conflictingIds),
      explanation,
      explanationPali);

  /// Create a copy of ConflictRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConflictRuleImplCopyWith<_$ConflictRuleImpl> get copyWith =>
      __$$ConflictRuleImplCopyWithImpl<_$ConflictRuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConflictRuleImplToJson(
      this,
    );
  }
}

abstract class _ConflictRule implements ConflictRule {
  const factory _ConflictRule(
      {required final String ruleId,
      required final ConflictType type,
      required final List<String> conflictingIds,
      required final String explanation,
      final String? explanationPali}) = _$ConflictRuleImpl;

  factory _ConflictRule.fromJson(Map<String, dynamic> json) =
      _$ConflictRuleImpl.fromJson;

  @override
  String get ruleId;
  @override
  ConflictType get type;
  @override
  List<String> get conflictingIds; // Danh sách Tâm Sở xung đột
  @override
  String get explanation; // Giải thích tiếng Việt
  @override
  String? get explanationPali;

  /// Create a copy of ConflictRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConflictRuleImplCopyWith<_$ConflictRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CetasikaModel _$CetasikaModelFromJson(Map<String, dynamic> json) {
  return _CetasikaModel.fromJson(json);
}

/// @nodoc
mixin _$CetasikaModel {
  String get id => throw _privateConstructorUsedError;
  String get namePali => throw _privateConstructorUsedError;
  String get nameVietnamese => throw _privateConstructorUsedError;
  String get nameShort =>
      throw _privateConstructorUsedError; // Tên viết tắt cho hiển thị Matrix
  CetasikaGroup get group => throw _privateConstructorUsedError;
  AkusalaSubGroup? get akusalaSubGroup => throw _privateConstructorUsedError;
  SobhanaSubGroup? get sobhanaSubGroup =>
      throw _privateConstructorUsedError; // Số thứ tự truyền thống
  int get traditionalOrder => throw _privateConstructorUsedError; // IPA phát âm
  String? get ipaTranscription =>
      throw _privateConstructorUsedError; // Audio file path (trong assets)
  String? get audioPronunciation =>
      throw _privateConstructorUsedError; // Giải thích
  String get descriptionVi => throw _privateConstructorUsedError;
  String? get descriptionPali =>
      throw _privateConstructorUsedError; // Danh sách quy tắc xung đột liên quan
  List<ConflictRule> get conflictRules =>
      throw _privateConstructorUsedError; // Icon/Symbol cho dual encoding
  String get symbol => throw _privateConstructorUsedError; // Unicode symbol
  int get colorCode => throw _privateConstructorUsedError;

  /// Serializes this CetasikaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CetasikaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CetasikaModelCopyWith<CetasikaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CetasikaModelCopyWith<$Res> {
  factory $CetasikaModelCopyWith(
          CetasikaModel value, $Res Function(CetasikaModel) then) =
      _$CetasikaModelCopyWithImpl<$Res, CetasikaModel>;
  @useResult
  $Res call(
      {String id,
      String namePali,
      String nameVietnamese,
      String nameShort,
      CetasikaGroup group,
      AkusalaSubGroup? akusalaSubGroup,
      SobhanaSubGroup? sobhanaSubGroup,
      int traditionalOrder,
      String? ipaTranscription,
      String? audioPronunciation,
      String descriptionVi,
      String? descriptionPali,
      List<ConflictRule> conflictRules,
      String symbol,
      int colorCode});
}

/// @nodoc
class _$CetasikaModelCopyWithImpl<$Res, $Val extends CetasikaModel>
    implements $CetasikaModelCopyWith<$Res> {
  _$CetasikaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CetasikaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? nameShort = null,
    Object? group = null,
    Object? akusalaSubGroup = freezed,
    Object? sobhanaSubGroup = freezed,
    Object? traditionalOrder = null,
    Object? ipaTranscription = freezed,
    Object? audioPronunciation = freezed,
    Object? descriptionVi = null,
    Object? descriptionPali = freezed,
    Object? conflictRules = null,
    Object? symbol = null,
    Object? colorCode = null,
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
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as CetasikaGroup,
      akusalaSubGroup: freezed == akusalaSubGroup
          ? _value.akusalaSubGroup
          : akusalaSubGroup // ignore: cast_nullable_to_non_nullable
              as AkusalaSubGroup?,
      sobhanaSubGroup: freezed == sobhanaSubGroup
          ? _value.sobhanaSubGroup
          : sobhanaSubGroup // ignore: cast_nullable_to_non_nullable
              as SobhanaSubGroup?,
      traditionalOrder: null == traditionalOrder
          ? _value.traditionalOrder
          : traditionalOrder // ignore: cast_nullable_to_non_nullable
              as int,
      ipaTranscription: freezed == ipaTranscription
          ? _value.ipaTranscription
          : ipaTranscription // ignore: cast_nullable_to_non_nullable
              as String?,
      audioPronunciation: freezed == audioPronunciation
          ? _value.audioPronunciation
          : audioPronunciation // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionVi: null == descriptionVi
          ? _value.descriptionVi
          : descriptionVi // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionPali: freezed == descriptionPali
          ? _value.descriptionPali
          : descriptionPali // ignore: cast_nullable_to_non_nullable
              as String?,
      conflictRules: null == conflictRules
          ? _value.conflictRules
          : conflictRules // ignore: cast_nullable_to_non_nullable
              as List<ConflictRule>,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CetasikaModelImplCopyWith<$Res>
    implements $CetasikaModelCopyWith<$Res> {
  factory _$$CetasikaModelImplCopyWith(
          _$CetasikaModelImpl value, $Res Function(_$CetasikaModelImpl) then) =
      __$$CetasikaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String namePali,
      String nameVietnamese,
      String nameShort,
      CetasikaGroup group,
      AkusalaSubGroup? akusalaSubGroup,
      SobhanaSubGroup? sobhanaSubGroup,
      int traditionalOrder,
      String? ipaTranscription,
      String? audioPronunciation,
      String descriptionVi,
      String? descriptionPali,
      List<ConflictRule> conflictRules,
      String symbol,
      int colorCode});
}

/// @nodoc
class __$$CetasikaModelImplCopyWithImpl<$Res>
    extends _$CetasikaModelCopyWithImpl<$Res, _$CetasikaModelImpl>
    implements _$$CetasikaModelImplCopyWith<$Res> {
  __$$CetasikaModelImplCopyWithImpl(
      _$CetasikaModelImpl _value, $Res Function(_$CetasikaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CetasikaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? nameShort = null,
    Object? group = null,
    Object? akusalaSubGroup = freezed,
    Object? sobhanaSubGroup = freezed,
    Object? traditionalOrder = null,
    Object? ipaTranscription = freezed,
    Object? audioPronunciation = freezed,
    Object? descriptionVi = null,
    Object? descriptionPali = freezed,
    Object? conflictRules = null,
    Object? symbol = null,
    Object? colorCode = null,
  }) {
    return _then(_$CetasikaModelImpl(
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
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as CetasikaGroup,
      akusalaSubGroup: freezed == akusalaSubGroup
          ? _value.akusalaSubGroup
          : akusalaSubGroup // ignore: cast_nullable_to_non_nullable
              as AkusalaSubGroup?,
      sobhanaSubGroup: freezed == sobhanaSubGroup
          ? _value.sobhanaSubGroup
          : sobhanaSubGroup // ignore: cast_nullable_to_non_nullable
              as SobhanaSubGroup?,
      traditionalOrder: null == traditionalOrder
          ? _value.traditionalOrder
          : traditionalOrder // ignore: cast_nullable_to_non_nullable
              as int,
      ipaTranscription: freezed == ipaTranscription
          ? _value.ipaTranscription
          : ipaTranscription // ignore: cast_nullable_to_non_nullable
              as String?,
      audioPronunciation: freezed == audioPronunciation
          ? _value.audioPronunciation
          : audioPronunciation // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionVi: null == descriptionVi
          ? _value.descriptionVi
          : descriptionVi // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionPali: freezed == descriptionPali
          ? _value.descriptionPali
          : descriptionPali // ignore: cast_nullable_to_non_nullable
              as String?,
      conflictRules: null == conflictRules
          ? _value._conflictRules
          : conflictRules // ignore: cast_nullable_to_non_nullable
              as List<ConflictRule>,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      colorCode: null == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CetasikaModelImpl implements _CetasikaModel {
  const _$CetasikaModelImpl(
      {required this.id,
      required this.namePali,
      required this.nameVietnamese,
      required this.nameShort,
      required this.group,
      this.akusalaSubGroup,
      this.sobhanaSubGroup,
      required this.traditionalOrder,
      this.ipaTranscription,
      this.audioPronunciation,
      required this.descriptionVi,
      this.descriptionPali,
      final List<ConflictRule> conflictRules = const [],
      required this.symbol,
      required this.colorCode})
      : _conflictRules = conflictRules;

  factory _$CetasikaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CetasikaModelImplFromJson(json);

  @override
  final String id;
  @override
  final String namePali;
  @override
  final String nameVietnamese;
  @override
  final String nameShort;
// Tên viết tắt cho hiển thị Matrix
  @override
  final CetasikaGroup group;
  @override
  final AkusalaSubGroup? akusalaSubGroup;
  @override
  final SobhanaSubGroup? sobhanaSubGroup;
// Số thứ tự truyền thống
  @override
  final int traditionalOrder;
// IPA phát âm
  @override
  final String? ipaTranscription;
// Audio file path (trong assets)
  @override
  final String? audioPronunciation;
// Giải thích
  @override
  final String descriptionVi;
  @override
  final String? descriptionPali;
// Danh sách quy tắc xung đột liên quan
  final List<ConflictRule> _conflictRules;
// Danh sách quy tắc xung đột liên quan
  @override
  @JsonKey()
  List<ConflictRule> get conflictRules {
    if (_conflictRules is EqualUnmodifiableListView) return _conflictRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conflictRules);
  }

// Icon/Symbol cho dual encoding
  @override
  final String symbol;
// Unicode symbol
  @override
  final int colorCode;

  @override
  String toString() {
    return 'CetasikaModel(id: $id, namePali: $namePali, nameVietnamese: $nameVietnamese, nameShort: $nameShort, group: $group, akusalaSubGroup: $akusalaSubGroup, sobhanaSubGroup: $sobhanaSubGroup, traditionalOrder: $traditionalOrder, ipaTranscription: $ipaTranscription, audioPronunciation: $audioPronunciation, descriptionVi: $descriptionVi, descriptionPali: $descriptionPali, conflictRules: $conflictRules, symbol: $symbol, colorCode: $colorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CetasikaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namePali, namePali) ||
                other.namePali == namePali) &&
            (identical(other.nameVietnamese, nameVietnamese) ||
                other.nameVietnamese == nameVietnamese) &&
            (identical(other.nameShort, nameShort) ||
                other.nameShort == nameShort) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.akusalaSubGroup, akusalaSubGroup) ||
                other.akusalaSubGroup == akusalaSubGroup) &&
            (identical(other.sobhanaSubGroup, sobhanaSubGroup) ||
                other.sobhanaSubGroup == sobhanaSubGroup) &&
            (identical(other.traditionalOrder, traditionalOrder) ||
                other.traditionalOrder == traditionalOrder) &&
            (identical(other.ipaTranscription, ipaTranscription) ||
                other.ipaTranscription == ipaTranscription) &&
            (identical(other.audioPronunciation, audioPronunciation) ||
                other.audioPronunciation == audioPronunciation) &&
            (identical(other.descriptionVi, descriptionVi) ||
                other.descriptionVi == descriptionVi) &&
            (identical(other.descriptionPali, descriptionPali) ||
                other.descriptionPali == descriptionPali) &&
            const DeepCollectionEquality()
                .equals(other._conflictRules, _conflictRules) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      namePali,
      nameVietnamese,
      nameShort,
      group,
      akusalaSubGroup,
      sobhanaSubGroup,
      traditionalOrder,
      ipaTranscription,
      audioPronunciation,
      descriptionVi,
      descriptionPali,
      const DeepCollectionEquality().hash(_conflictRules),
      symbol,
      colorCode);

  /// Create a copy of CetasikaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CetasikaModelImplCopyWith<_$CetasikaModelImpl> get copyWith =>
      __$$CetasikaModelImplCopyWithImpl<_$CetasikaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CetasikaModelImplToJson(
      this,
    );
  }
}

abstract class _CetasikaModel implements CetasikaModel {
  const factory _CetasikaModel(
      {required final String id,
      required final String namePali,
      required final String nameVietnamese,
      required final String nameShort,
      required final CetasikaGroup group,
      final AkusalaSubGroup? akusalaSubGroup,
      final SobhanaSubGroup? sobhanaSubGroup,
      required final int traditionalOrder,
      final String? ipaTranscription,
      final String? audioPronunciation,
      required final String descriptionVi,
      final String? descriptionPali,
      final List<ConflictRule> conflictRules,
      required final String symbol,
      required final int colorCode}) = _$CetasikaModelImpl;

  factory _CetasikaModel.fromJson(Map<String, dynamic> json) =
      _$CetasikaModelImpl.fromJson;

  @override
  String get id;
  @override
  String get namePali;
  @override
  String get nameVietnamese;
  @override
  String get nameShort; // Tên viết tắt cho hiển thị Matrix
  @override
  CetasikaGroup get group;
  @override
  AkusalaSubGroup? get akusalaSubGroup;
  @override
  SobhanaSubGroup? get sobhanaSubGroup; // Số thứ tự truyền thống
  @override
  int get traditionalOrder; // IPA phát âm
  @override
  String? get ipaTranscription; // Audio file path (trong assets)
  @override
  String? get audioPronunciation; // Giải thích
  @override
  String get descriptionVi;
  @override
  String? get descriptionPali; // Danh sách quy tắc xung đột liên quan
  @override
  List<ConflictRule> get conflictRules; // Icon/Symbol cho dual encoding
  @override
  String get symbol; // Unicode symbol
  @override
  int get colorCode;

  /// Create a copy of CetasikaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CetasikaModelImplCopyWith<_$CetasikaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
