// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collapse_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CollapseState {
  bool get collapsed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CollapseStateCopyWith<CollapseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollapseStateCopyWith<$Res> {
  factory $CollapseStateCopyWith(
          CollapseState value, $Res Function(CollapseState) then) =
      _$CollapseStateCopyWithImpl<$Res, CollapseState>;
  @useResult
  $Res call({bool collapsed});
}

/// @nodoc
class _$CollapseStateCopyWithImpl<$Res, $Val extends CollapseState>
    implements $CollapseStateCopyWith<$Res> {
  _$CollapseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collapsed = null,
  }) {
    return _then(_value.copyWith(
      collapsed: null == collapsed
          ? _value.collapsed
          : collapsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollapseStateImplCopyWith<$Res>
    implements $CollapseStateCopyWith<$Res> {
  factory _$$CollapseStateImplCopyWith(
          _$CollapseStateImpl value, $Res Function(_$CollapseStateImpl) then) =
      __$$CollapseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool collapsed});
}

/// @nodoc
class __$$CollapseStateImplCopyWithImpl<$Res>
    extends _$CollapseStateCopyWithImpl<$Res, _$CollapseStateImpl>
    implements _$$CollapseStateImplCopyWith<$Res> {
  __$$CollapseStateImplCopyWithImpl(
      _$CollapseStateImpl _value, $Res Function(_$CollapseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collapsed = null,
  }) {
    return _then(_$CollapseStateImpl(
      collapsed: null == collapsed
          ? _value.collapsed
          : collapsed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CollapseStateImpl implements _CollapseState {
  const _$CollapseStateImpl({this.collapsed = false});

  @override
  @JsonKey()
  final bool collapsed;

  @override
  String toString() {
    return 'CollapseState(collapsed: $collapsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollapseStateImpl &&
            (identical(other.collapsed, collapsed) ||
                other.collapsed == collapsed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collapsed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollapseStateImplCopyWith<_$CollapseStateImpl> get copyWith =>
      __$$CollapseStateImplCopyWithImpl<_$CollapseStateImpl>(this, _$identity);
}

abstract class _CollapseState implements CollapseState {
  const factory _CollapseState({final bool collapsed}) = _$CollapseStateImpl;

  @override
  bool get collapsed;
  @override
  @JsonKey(ignore: true)
  _$$CollapseStateImplCopyWith<_$CollapseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
