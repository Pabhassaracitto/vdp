// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'citta_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CetasikaAssociation _$CetasikaAssociationFromJson(Map<String, dynamic> json) {
  return _CetasikaAssociation.fromJson(json);
}

/// @nodoc
mixin _$CetasikaAssociation {
  String get cetasikaId => throw _privateConstructorUsedError;
  AssociationType get type => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this CetasikaAssociation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CetasikaAssociation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CetasikaAssociationCopyWith<CetasikaAssociation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CetasikaAssociationCopyWith<$Res> {
  factory $CetasikaAssociationCopyWith(
          CetasikaAssociation value, $Res Function(CetasikaAssociation) then) =
      _$CetasikaAssociationCopyWithImpl<$Res, CetasikaAssociation>;
  @useResult
  $Res call({String cetasikaId, AssociationType type, String? note});
}

/// @nodoc
class _$CetasikaAssociationCopyWithImpl<$Res, $Val extends CetasikaAssociation>
    implements $CetasikaAssociationCopyWith<$Res> {
  _$CetasikaAssociationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CetasikaAssociation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cetasikaId = null,
    Object? type = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      cetasikaId: null == cetasikaId
          ? _value.cetasikaId
          : cetasikaId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AssociationType,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CetasikaAssociationImplCopyWith<$Res>
    implements $CetasikaAssociationCopyWith<$Res> {
  factory _$$CetasikaAssociationImplCopyWith(_$CetasikaAssociationImpl value,
          $Res Function(_$CetasikaAssociationImpl) then) =
      __$$CetasikaAssociationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cetasikaId, AssociationType type, String? note});
}

/// @nodoc
class __$$CetasikaAssociationImplCopyWithImpl<$Res>
    extends _$CetasikaAssociationCopyWithImpl<$Res, _$CetasikaAssociationImpl>
    implements _$$CetasikaAssociationImplCopyWith<$Res> {
  __$$CetasikaAssociationImplCopyWithImpl(_$CetasikaAssociationImpl _value,
      $Res Function(_$CetasikaAssociationImpl) _then)
      : super(_value, _then);

  /// Create a copy of CetasikaAssociation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cetasikaId = null,
    Object? type = null,
    Object? note = freezed,
  }) {
    return _then(_$CetasikaAssociationImpl(
      cetasikaId: null == cetasikaId
          ? _value.cetasikaId
          : cetasikaId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AssociationType,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CetasikaAssociationImpl implements _CetasikaAssociation {
  const _$CetasikaAssociationImpl(
      {required this.cetasikaId, required this.type, this.note});

  factory _$CetasikaAssociationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CetasikaAssociationImplFromJson(json);

  @override
  final String cetasikaId;
  @override
  final AssociationType type;
  @override
  final String? note;

  @override
  String toString() {
    return 'CetasikaAssociation(cetasikaId: $cetasikaId, type: $type, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CetasikaAssociationImpl &&
            (identical(other.cetasikaId, cetasikaId) ||
                other.cetasikaId == cetasikaId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cetasikaId, type, note);

  /// Create a copy of CetasikaAssociation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CetasikaAssociationImplCopyWith<_$CetasikaAssociationImpl> get copyWith =>
      __$$CetasikaAssociationImplCopyWithImpl<_$CetasikaAssociationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CetasikaAssociationImplToJson(
      this,
    );
  }
}

abstract class _CetasikaAssociation implements CetasikaAssociation {
  const factory _CetasikaAssociation(
      {required final String cetasikaId,
      required final AssociationType type,
      final String? note}) = _$CetasikaAssociationImpl;

  factory _CetasikaAssociation.fromJson(Map<String, dynamic> json) =
      _$CetasikaAssociationImpl.fromJson;

  @override
  String get cetasikaId;
  @override
  AssociationType get type;
  @override
  String? get note;

  /// Create a copy of CetasikaAssociation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CetasikaAssociationImplCopyWith<_$CetasikaAssociationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VatthurSaca _$VatthurSacaFromJson(Map<String, dynamic> json) {
  return _VatthurSaca.fromJson(json);
}

/// @nodoc
mixin _$VatthurSaca {
  String get vattuId =>
      throw _privateConstructorUsedError; // Vật chất căn cứ (vatthu)
  List<String>? get rupaSampayutta => throw _privateConstructorUsedError;

  /// Serializes this VatthurSaca to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VatthurSaca
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VatthurSacaCopyWith<VatthurSaca> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VatthurSacaCopyWith<$Res> {
  factory $VatthurSacaCopyWith(
          VatthurSaca value, $Res Function(VatthurSaca) then) =
      _$VatthurSacaCopyWithImpl<$Res, VatthurSaca>;
  @useResult
  $Res call({String vattuId, List<String>? rupaSampayutta});
}

/// @nodoc
class _$VatthurSacaCopyWithImpl<$Res, $Val extends VatthurSaca>
    implements $VatthurSacaCopyWith<$Res> {
  _$VatthurSacaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VatthurSaca
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vattuId = null,
    Object? rupaSampayutta = freezed,
  }) {
    return _then(_value.copyWith(
      vattuId: null == vattuId
          ? _value.vattuId
          : vattuId // ignore: cast_nullable_to_non_nullable
              as String,
      rupaSampayutta: freezed == rupaSampayutta
          ? _value.rupaSampayutta
          : rupaSampayutta // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VatthurSacaImplCopyWith<$Res>
    implements $VatthurSacaCopyWith<$Res> {
  factory _$$VatthurSacaImplCopyWith(
          _$VatthurSacaImpl value, $Res Function(_$VatthurSacaImpl) then) =
      __$$VatthurSacaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String vattuId, List<String>? rupaSampayutta});
}

/// @nodoc
class __$$VatthurSacaImplCopyWithImpl<$Res>
    extends _$VatthurSacaCopyWithImpl<$Res, _$VatthurSacaImpl>
    implements _$$VatthurSacaImplCopyWith<$Res> {
  __$$VatthurSacaImplCopyWithImpl(
      _$VatthurSacaImpl _value, $Res Function(_$VatthurSacaImpl) _then)
      : super(_value, _then);

  /// Create a copy of VatthurSaca
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vattuId = null,
    Object? rupaSampayutta = freezed,
  }) {
    return _then(_$VatthurSacaImpl(
      vattuId: null == vattuId
          ? _value.vattuId
          : vattuId // ignore: cast_nullable_to_non_nullable
              as String,
      rupaSampayutta: freezed == rupaSampayutta
          ? _value._rupaSampayutta
          : rupaSampayutta // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VatthurSacaImpl implements _VatthurSaca {
  const _$VatthurSacaImpl(
      {required this.vattuId, final List<String>? rupaSampayutta})
      : _rupaSampayutta = rupaSampayutta;

  factory _$VatthurSacaImpl.fromJson(Map<String, dynamic> json) =>
      _$$VatthurSacaImplFromJson(json);

  @override
  final String vattuId;
// Vật chất căn cứ (vatthu)
  final List<String>? _rupaSampayutta;
// Vật chất căn cứ (vatthu)
  @override
  List<String>? get rupaSampayutta {
    final value = _rupaSampayutta;
    if (value == null) return null;
    if (_rupaSampayutta is EqualUnmodifiableListView) return _rupaSampayutta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VatthurSaca(vattuId: $vattuId, rupaSampayutta: $rupaSampayutta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VatthurSacaImpl &&
            (identical(other.vattuId, vattuId) || other.vattuId == vattuId) &&
            const DeepCollectionEquality()
                .equals(other._rupaSampayutta, _rupaSampayutta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, vattuId,
      const DeepCollectionEquality().hash(_rupaSampayutta));

  /// Create a copy of VatthurSaca
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VatthurSacaImplCopyWith<_$VatthurSacaImpl> get copyWith =>
      __$$VatthurSacaImplCopyWithImpl<_$VatthurSacaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VatthurSacaImplToJson(
      this,
    );
  }
}

abstract class _VatthurSaca implements VatthurSaca {
  const factory _VatthurSaca(
      {required final String vattuId,
      final List<String>? rupaSampayutta}) = _$VatthurSacaImpl;

  factory _VatthurSaca.fromJson(Map<String, dynamic> json) =
      _$VatthurSacaImpl.fromJson;

  @override
  String get vattuId; // Vật chất căn cứ (vatthu)
  @override
  List<String>? get rupaSampayutta;

  /// Create a copy of VatthurSaca
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VatthurSacaImplCopyWith<_$VatthurSacaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CittaModel _$CittaModelFromJson(Map<String, dynamic> json) {
  return _CittaModel.fromJson(json);
}

/// @nodoc
mixin _$CittaModel {
  String get id => throw _privateConstructorUsedError;
  String get namePali => throw _privateConstructorUsedError;
  String get nameVietnamese => throw _privateConstructorUsedError;
  BhumiGroup get bhumiGroup => throw _privateConstructorUsedError;
  CittaFunction get function => throw _privateConstructorUsedError;
  Vedana get vedana => throw _privateConstructorUsedError;
  List<CetasikaAssociation> get cetasikaAssociations =>
      throw _privateConstructorUsedError; // Liên kết Nghiệp (N-M)
  List<String> get kammaLinks =>
      throw _privateConstructorUsedError; // Vật chất liên quan
  VatthurSaca? get vatthurSaca =>
      throw _privateConstructorUsedError; // Module thuộc về (Study Graph)
  String get moduleId =>
      throw _privateConstructorUsedError; // Số thứ tự trong nhóm
  int get orderIndex => throw _privateConstructorUsedError; // Ghi chú giáo lý
  String? get doctrinalNote =>
      throw _privateConstructorUsedError; // Ví dụ thực tế
  List<String>? get examples => throw _privateConstructorUsedError;

  /// Serializes this CittaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CittaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CittaModelCopyWith<CittaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CittaModelCopyWith<$Res> {
  factory $CittaModelCopyWith(
          CittaModel value, $Res Function(CittaModel) then) =
      _$CittaModelCopyWithImpl<$Res, CittaModel>;
  @useResult
  $Res call(
      {String id,
      String namePali,
      String nameVietnamese,
      BhumiGroup bhumiGroup,
      CittaFunction function,
      Vedana vedana,
      List<CetasikaAssociation> cetasikaAssociations,
      List<String> kammaLinks,
      VatthurSaca? vatthurSaca,
      String moduleId,
      int orderIndex,
      String? doctrinalNote,
      List<String>? examples});

  $VatthurSacaCopyWith<$Res>? get vatthurSaca;
}

/// @nodoc
class _$CittaModelCopyWithImpl<$Res, $Val extends CittaModel>
    implements $CittaModelCopyWith<$Res> {
  _$CittaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CittaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? bhumiGroup = null,
    Object? function = null,
    Object? vedana = null,
    Object? cetasikaAssociations = null,
    Object? kammaLinks = null,
    Object? vatthurSaca = freezed,
    Object? moduleId = null,
    Object? orderIndex = null,
    Object? doctrinalNote = freezed,
    Object? examples = freezed,
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
      bhumiGroup: null == bhumiGroup
          ? _value.bhumiGroup
          : bhumiGroup // ignore: cast_nullable_to_non_nullable
              as BhumiGroup,
      function: null == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as CittaFunction,
      vedana: null == vedana
          ? _value.vedana
          : vedana // ignore: cast_nullable_to_non_nullable
              as Vedana,
      cetasikaAssociations: null == cetasikaAssociations
          ? _value.cetasikaAssociations
          : cetasikaAssociations // ignore: cast_nullable_to_non_nullable
              as List<CetasikaAssociation>,
      kammaLinks: null == kammaLinks
          ? _value.kammaLinks
          : kammaLinks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vatthurSaca: freezed == vatthurSaca
          ? _value.vatthurSaca
          : vatthurSaca // ignore: cast_nullable_to_non_nullable
              as VatthurSaca?,
      moduleId: null == moduleId
          ? _value.moduleId
          : moduleId // ignore: cast_nullable_to_non_nullable
              as String,
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      doctrinalNote: freezed == doctrinalNote
          ? _value.doctrinalNote
          : doctrinalNote // ignore: cast_nullable_to_non_nullable
              as String?,
      examples: freezed == examples
          ? _value.examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  /// Create a copy of CittaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VatthurSacaCopyWith<$Res>? get vatthurSaca {
    if (_value.vatthurSaca == null) {
      return null;
    }

    return $VatthurSacaCopyWith<$Res>(_value.vatthurSaca!, (value) {
      return _then(_value.copyWith(vatthurSaca: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CittaModelImplCopyWith<$Res>
    implements $CittaModelCopyWith<$Res> {
  factory _$$CittaModelImplCopyWith(
          _$CittaModelImpl value, $Res Function(_$CittaModelImpl) then) =
      __$$CittaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String namePali,
      String nameVietnamese,
      BhumiGroup bhumiGroup,
      CittaFunction function,
      Vedana vedana,
      List<CetasikaAssociation> cetasikaAssociations,
      List<String> kammaLinks,
      VatthurSaca? vatthurSaca,
      String moduleId,
      int orderIndex,
      String? doctrinalNote,
      List<String>? examples});

  @override
  $VatthurSacaCopyWith<$Res>? get vatthurSaca;
}

/// @nodoc
class __$$CittaModelImplCopyWithImpl<$Res>
    extends _$CittaModelCopyWithImpl<$Res, _$CittaModelImpl>
    implements _$$CittaModelImplCopyWith<$Res> {
  __$$CittaModelImplCopyWithImpl(
      _$CittaModelImpl _value, $Res Function(_$CittaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CittaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namePali = null,
    Object? nameVietnamese = null,
    Object? bhumiGroup = null,
    Object? function = null,
    Object? vedana = null,
    Object? cetasikaAssociations = null,
    Object? kammaLinks = null,
    Object? vatthurSaca = freezed,
    Object? moduleId = null,
    Object? orderIndex = null,
    Object? doctrinalNote = freezed,
    Object? examples = freezed,
  }) {
    return _then(_$CittaModelImpl(
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
      bhumiGroup: null == bhumiGroup
          ? _value.bhumiGroup
          : bhumiGroup // ignore: cast_nullable_to_non_nullable
              as BhumiGroup,
      function: null == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as CittaFunction,
      vedana: null == vedana
          ? _value.vedana
          : vedana // ignore: cast_nullable_to_non_nullable
              as Vedana,
      cetasikaAssociations: null == cetasikaAssociations
          ? _value._cetasikaAssociations
          : cetasikaAssociations // ignore: cast_nullable_to_non_nullable
              as List<CetasikaAssociation>,
      kammaLinks: null == kammaLinks
          ? _value._kammaLinks
          : kammaLinks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vatthurSaca: freezed == vatthurSaca
          ? _value.vatthurSaca
          : vatthurSaca // ignore: cast_nullable_to_non_nullable
              as VatthurSaca?,
      moduleId: null == moduleId
          ? _value.moduleId
          : moduleId // ignore: cast_nullable_to_non_nullable
              as String,
      orderIndex: null == orderIndex
          ? _value.orderIndex
          : orderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      doctrinalNote: freezed == doctrinalNote
          ? _value.doctrinalNote
          : doctrinalNote // ignore: cast_nullable_to_non_nullable
              as String?,
      examples: freezed == examples
          ? _value._examples
          : examples // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CittaModelImpl implements _CittaModel {
  const _$CittaModelImpl(
      {required this.id,
      required this.namePali,
      required this.nameVietnamese,
      required this.bhumiGroup,
      required this.function,
      required this.vedana,
      required final List<CetasikaAssociation> cetasikaAssociations,
      final List<String> kammaLinks = const [],
      this.vatthurSaca,
      required this.moduleId,
      required this.orderIndex,
      this.doctrinalNote,
      final List<String>? examples})
      : _cetasikaAssociations = cetasikaAssociations,
        _kammaLinks = kammaLinks,
        _examples = examples;

  factory _$CittaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CittaModelImplFromJson(json);

  @override
  final String id;
  @override
  final String namePali;
  @override
  final String nameVietnamese;
  @override
  final BhumiGroup bhumiGroup;
  @override
  final CittaFunction function;
  @override
  final Vedana vedana;
  final List<CetasikaAssociation> _cetasikaAssociations;
  @override
  List<CetasikaAssociation> get cetasikaAssociations {
    if (_cetasikaAssociations is EqualUnmodifiableListView)
      return _cetasikaAssociations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cetasikaAssociations);
  }

// Liên kết Nghiệp (N-M)
  final List<String> _kammaLinks;
// Liên kết Nghiệp (N-M)
  @override
  @JsonKey()
  List<String> get kammaLinks {
    if (_kammaLinks is EqualUnmodifiableListView) return _kammaLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kammaLinks);
  }

// Vật chất liên quan
  @override
  final VatthurSaca? vatthurSaca;
// Module thuộc về (Study Graph)
  @override
  final String moduleId;
// Số thứ tự trong nhóm
  @override
  final int orderIndex;
// Ghi chú giáo lý
  @override
  final String? doctrinalNote;
// Ví dụ thực tế
  final List<String>? _examples;
// Ví dụ thực tế
  @override
  List<String>? get examples {
    final value = _examples;
    if (value == null) return null;
    if (_examples is EqualUnmodifiableListView) return _examples;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CittaModel(id: $id, namePali: $namePali, nameVietnamese: $nameVietnamese, bhumiGroup: $bhumiGroup, function: $function, vedana: $vedana, cetasikaAssociations: $cetasikaAssociations, kammaLinks: $kammaLinks, vatthurSaca: $vatthurSaca, moduleId: $moduleId, orderIndex: $orderIndex, doctrinalNote: $doctrinalNote, examples: $examples)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CittaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namePali, namePali) ||
                other.namePali == namePali) &&
            (identical(other.nameVietnamese, nameVietnamese) ||
                other.nameVietnamese == nameVietnamese) &&
            (identical(other.bhumiGroup, bhumiGroup) ||
                other.bhumiGroup == bhumiGroup) &&
            (identical(other.function, function) ||
                other.function == function) &&
            (identical(other.vedana, vedana) || other.vedana == vedana) &&
            const DeepCollectionEquality()
                .equals(other._cetasikaAssociations, _cetasikaAssociations) &&
            const DeepCollectionEquality()
                .equals(other._kammaLinks, _kammaLinks) &&
            (identical(other.vatthurSaca, vatthurSaca) ||
                other.vatthurSaca == vatthurSaca) &&
            (identical(other.moduleId, moduleId) ||
                other.moduleId == moduleId) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.doctrinalNote, doctrinalNote) ||
                other.doctrinalNote == doctrinalNote) &&
            const DeepCollectionEquality().equals(other._examples, _examples));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      namePali,
      nameVietnamese,
      bhumiGroup,
      function,
      vedana,
      const DeepCollectionEquality().hash(_cetasikaAssociations),
      const DeepCollectionEquality().hash(_kammaLinks),
      vatthurSaca,
      moduleId,
      orderIndex,
      doctrinalNote,
      const DeepCollectionEquality().hash(_examples));

  /// Create a copy of CittaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CittaModelImplCopyWith<_$CittaModelImpl> get copyWith =>
      __$$CittaModelImplCopyWithImpl<_$CittaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CittaModelImplToJson(
      this,
    );
  }
}

abstract class _CittaModel implements CittaModel {
  const factory _CittaModel(
      {required final String id,
      required final String namePali,
      required final String nameVietnamese,
      required final BhumiGroup bhumiGroup,
      required final CittaFunction function,
      required final Vedana vedana,
      required final List<CetasikaAssociation> cetasikaAssociations,
      final List<String> kammaLinks,
      final VatthurSaca? vatthurSaca,
      required final String moduleId,
      required final int orderIndex,
      final String? doctrinalNote,
      final List<String>? examples}) = _$CittaModelImpl;

  factory _CittaModel.fromJson(Map<String, dynamic> json) =
      _$CittaModelImpl.fromJson;

  @override
  String get id;
  @override
  String get namePali;
  @override
  String get nameVietnamese;
  @override
  BhumiGroup get bhumiGroup;
  @override
  CittaFunction get function;
  @override
  Vedana get vedana;
  @override
  List<CetasikaAssociation> get cetasikaAssociations; // Liên kết Nghiệp (N-M)
  @override
  List<String> get kammaLinks; // Vật chất liên quan
  @override
  VatthurSaca? get vatthurSaca; // Module thuộc về (Study Graph)
  @override
  String get moduleId; // Số thứ tự trong nhóm
  @override
  int get orderIndex; // Ghi chú giáo lý
  @override
  String? get doctrinalNote; // Ví dụ thực tế
  @override
  List<String>? get examples;

  /// Create a copy of CittaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CittaModelImplCopyWith<_$CittaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
