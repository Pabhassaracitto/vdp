// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paticca_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaticcaFlowchartState {
  /// Node đang được chọn (null = chưa chọn)
  String? get selectedNodeId => throw _privateConstructorUsedError;

  /// Hướng highlight chain
  ChainDirection get chainDirection => throw _privateConstructorUsedError;

  /// Danh sách node ID đang được highlight
  List<String> get highlightedNodeIds => throw _privateConstructorUsedError;

  /// Tab nội bộ đang hiển thị
  PaticcaViewTab get activeTab => throw _privateConstructorUsedError;

  /// Filter theo vatta (null = tất cả)
  PaticcaVatta? get filterVatta => throw _privateConstructorUsedError;

  /// Filter theo kiep (null = tất cả)
  PaticcaKiep? get filterKiep => throw _privateConstructorUsedError;

  /// Phase C: animation đang chạy không
  bool get isAnimating => throw _privateConstructorUsedError;

  /// Create a copy of PaticcaFlowchartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaticcaFlowchartStateCopyWith<PaticcaFlowchartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaticcaFlowchartStateCopyWith<$Res> {
  factory $PaticcaFlowchartStateCopyWith(PaticcaFlowchartState value,
          $Res Function(PaticcaFlowchartState) then) =
      _$PaticcaFlowchartStateCopyWithImpl<$Res, PaticcaFlowchartState>;
  @useResult
  $Res call(
      {String? selectedNodeId,
      ChainDirection chainDirection,
      List<String> highlightedNodeIds,
      PaticcaViewTab activeTab,
      PaticcaVatta? filterVatta,
      PaticcaKiep? filterKiep,
      bool isAnimating});
}

/// @nodoc
class _$PaticcaFlowchartStateCopyWithImpl<$Res,
        $Val extends PaticcaFlowchartState>
    implements $PaticcaFlowchartStateCopyWith<$Res> {
  _$PaticcaFlowchartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaticcaFlowchartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedNodeId = freezed,
    Object? chainDirection = null,
    Object? highlightedNodeIds = null,
    Object? activeTab = null,
    Object? filterVatta = freezed,
    Object? filterKiep = freezed,
    Object? isAnimating = null,
  }) {
    return _then(_value.copyWith(
      selectedNodeId: freezed == selectedNodeId
          ? _value.selectedNodeId
          : selectedNodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      chainDirection: null == chainDirection
          ? _value.chainDirection
          : chainDirection // ignore: cast_nullable_to_non_nullable
              as ChainDirection,
      highlightedNodeIds: null == highlightedNodeIds
          ? _value.highlightedNodeIds
          : highlightedNodeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activeTab: null == activeTab
          ? _value.activeTab
          : activeTab // ignore: cast_nullable_to_non_nullable
              as PaticcaViewTab,
      filterVatta: freezed == filterVatta
          ? _value.filterVatta
          : filterVatta // ignore: cast_nullable_to_non_nullable
              as PaticcaVatta?,
      filterKiep: freezed == filterKiep
          ? _value.filterKiep
          : filterKiep // ignore: cast_nullable_to_non_nullable
              as PaticcaKiep?,
      isAnimating: null == isAnimating
          ? _value.isAnimating
          : isAnimating // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaticcaFlowchartStateImplCopyWith<$Res>
    implements $PaticcaFlowchartStateCopyWith<$Res> {
  factory _$$PaticcaFlowchartStateImplCopyWith(
          _$PaticcaFlowchartStateImpl value,
          $Res Function(_$PaticcaFlowchartStateImpl) then) =
      __$$PaticcaFlowchartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? selectedNodeId,
      ChainDirection chainDirection,
      List<String> highlightedNodeIds,
      PaticcaViewTab activeTab,
      PaticcaVatta? filterVatta,
      PaticcaKiep? filterKiep,
      bool isAnimating});
}

/// @nodoc
class __$$PaticcaFlowchartStateImplCopyWithImpl<$Res>
    extends _$PaticcaFlowchartStateCopyWithImpl<$Res,
        _$PaticcaFlowchartStateImpl>
    implements _$$PaticcaFlowchartStateImplCopyWith<$Res> {
  __$$PaticcaFlowchartStateImplCopyWithImpl(_$PaticcaFlowchartStateImpl _value,
      $Res Function(_$PaticcaFlowchartStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaticcaFlowchartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedNodeId = freezed,
    Object? chainDirection = null,
    Object? highlightedNodeIds = null,
    Object? activeTab = null,
    Object? filterVatta = freezed,
    Object? filterKiep = freezed,
    Object? isAnimating = null,
  }) {
    return _then(_$PaticcaFlowchartStateImpl(
      selectedNodeId: freezed == selectedNodeId
          ? _value.selectedNodeId
          : selectedNodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      chainDirection: null == chainDirection
          ? _value.chainDirection
          : chainDirection // ignore: cast_nullable_to_non_nullable
              as ChainDirection,
      highlightedNodeIds: null == highlightedNodeIds
          ? _value._highlightedNodeIds
          : highlightedNodeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activeTab: null == activeTab
          ? _value.activeTab
          : activeTab // ignore: cast_nullable_to_non_nullable
              as PaticcaViewTab,
      filterVatta: freezed == filterVatta
          ? _value.filterVatta
          : filterVatta // ignore: cast_nullable_to_non_nullable
              as PaticcaVatta?,
      filterKiep: freezed == filterKiep
          ? _value.filterKiep
          : filterKiep // ignore: cast_nullable_to_non_nullable
              as PaticcaKiep?,
      isAnimating: null == isAnimating
          ? _value.isAnimating
          : isAnimating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PaticcaFlowchartStateImpl implements _PaticcaFlowchartState {
  const _$PaticcaFlowchartStateImpl(
      {this.selectedNodeId = null,
      this.chainDirection = ChainDirection.none,
      final List<String> highlightedNodeIds = const [],
      this.activeTab = PaticcaViewTab.list,
      this.filterVatta = null,
      this.filterKiep = null,
      this.isAnimating = false})
      : _highlightedNodeIds = highlightedNodeIds;

  /// Node đang được chọn (null = chưa chọn)
  @override
  @JsonKey()
  final String? selectedNodeId;

  /// Hướng highlight chain
  @override
  @JsonKey()
  final ChainDirection chainDirection;

  /// Danh sách node ID đang được highlight
  final List<String> _highlightedNodeIds;

  /// Danh sách node ID đang được highlight
  @override
  @JsonKey()
  List<String> get highlightedNodeIds {
    if (_highlightedNodeIds is EqualUnmodifiableListView)
      return _highlightedNodeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlightedNodeIds);
  }

  /// Tab nội bộ đang hiển thị
  @override
  @JsonKey()
  final PaticcaViewTab activeTab;

  /// Filter theo vatta (null = tất cả)
  @override
  @JsonKey()
  final PaticcaVatta? filterVatta;

  /// Filter theo kiep (null = tất cả)
  @override
  @JsonKey()
  final PaticcaKiep? filterKiep;

  /// Phase C: animation đang chạy không
  @override
  @JsonKey()
  final bool isAnimating;

  @override
  String toString() {
    return 'PaticcaFlowchartState(selectedNodeId: $selectedNodeId, chainDirection: $chainDirection, highlightedNodeIds: $highlightedNodeIds, activeTab: $activeTab, filterVatta: $filterVatta, filterKiep: $filterKiep, isAnimating: $isAnimating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaticcaFlowchartStateImpl &&
            (identical(other.selectedNodeId, selectedNodeId) ||
                other.selectedNodeId == selectedNodeId) &&
            (identical(other.chainDirection, chainDirection) ||
                other.chainDirection == chainDirection) &&
            const DeepCollectionEquality()
                .equals(other._highlightedNodeIds, _highlightedNodeIds) &&
            (identical(other.activeTab, activeTab) ||
                other.activeTab == activeTab) &&
            (identical(other.filterVatta, filterVatta) ||
                other.filterVatta == filterVatta) &&
            (identical(other.filterKiep, filterKiep) ||
                other.filterKiep == filterKiep) &&
            (identical(other.isAnimating, isAnimating) ||
                other.isAnimating == isAnimating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedNodeId,
      chainDirection,
      const DeepCollectionEquality().hash(_highlightedNodeIds),
      activeTab,
      filterVatta,
      filterKiep,
      isAnimating);

  /// Create a copy of PaticcaFlowchartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaticcaFlowchartStateImplCopyWith<_$PaticcaFlowchartStateImpl>
      get copyWith => __$$PaticcaFlowchartStateImplCopyWithImpl<
          _$PaticcaFlowchartStateImpl>(this, _$identity);
}

abstract class _PaticcaFlowchartState implements PaticcaFlowchartState {
  const factory _PaticcaFlowchartState(
      {final String? selectedNodeId,
      final ChainDirection chainDirection,
      final List<String> highlightedNodeIds,
      final PaticcaViewTab activeTab,
      final PaticcaVatta? filterVatta,
      final PaticcaKiep? filterKiep,
      final bool isAnimating}) = _$PaticcaFlowchartStateImpl;

  /// Node đang được chọn (null = chưa chọn)
  @override
  String? get selectedNodeId;

  /// Hướng highlight chain
  @override
  ChainDirection get chainDirection;

  /// Danh sách node ID đang được highlight
  @override
  List<String> get highlightedNodeIds;

  /// Tab nội bộ đang hiển thị
  @override
  PaticcaViewTab get activeTab;

  /// Filter theo vatta (null = tất cả)
  @override
  PaticcaVatta? get filterVatta;

  /// Filter theo kiep (null = tất cả)
  @override
  PaticcaKiep? get filterKiep;

  /// Phase C: animation đang chạy không
  @override
  bool get isAnimating;

  /// Create a copy of PaticcaFlowchartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaticcaFlowchartStateImplCopyWith<_$PaticcaFlowchartStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
