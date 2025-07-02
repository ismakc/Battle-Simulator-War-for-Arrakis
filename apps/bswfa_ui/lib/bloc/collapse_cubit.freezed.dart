// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collapse_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CollapseState {

 bool get collapsed;
/// Create a copy of CollapseState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollapseStateCopyWith<CollapseState> get copyWith => _$CollapseStateCopyWithImpl<CollapseState>(this as CollapseState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollapseState&&(identical(other.collapsed, collapsed) || other.collapsed == collapsed));
}


@override
int get hashCode => Object.hash(runtimeType,collapsed);

@override
String toString() {
  return 'CollapseState(collapsed: $collapsed)';
}


}

/// @nodoc
abstract mixin class $CollapseStateCopyWith<$Res>  {
  factory $CollapseStateCopyWith(CollapseState value, $Res Function(CollapseState) _then) = _$CollapseStateCopyWithImpl;
@useResult
$Res call({
 bool collapsed
});




}
/// @nodoc
class _$CollapseStateCopyWithImpl<$Res>
    implements $CollapseStateCopyWith<$Res> {
  _$CollapseStateCopyWithImpl(this._self, this._then);

  final CollapseState _self;
  final $Res Function(CollapseState) _then;

/// Create a copy of CollapseState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? collapsed = null,}) {
  return _then(_self.copyWith(
collapsed: null == collapsed ? _self.collapsed : collapsed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _CollapseState implements CollapseState {
  const _CollapseState({this.collapsed = false});
  

@override@JsonKey() final  bool collapsed;

/// Create a copy of CollapseState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollapseStateCopyWith<_CollapseState> get copyWith => __$CollapseStateCopyWithImpl<_CollapseState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollapseState&&(identical(other.collapsed, collapsed) || other.collapsed == collapsed));
}


@override
int get hashCode => Object.hash(runtimeType,collapsed);

@override
String toString() {
  return 'CollapseState(collapsed: $collapsed)';
}


}

/// @nodoc
abstract mixin class _$CollapseStateCopyWith<$Res> implements $CollapseStateCopyWith<$Res> {
  factory _$CollapseStateCopyWith(_CollapseState value, $Res Function(_CollapseState) _then) = __$CollapseStateCopyWithImpl;
@override @useResult
$Res call({
 bool collapsed
});




}
/// @nodoc
class __$CollapseStateCopyWithImpl<$Res>
    implements _$CollapseStateCopyWith<$Res> {
  __$CollapseStateCopyWithImpl(this._self, this._then);

  final _CollapseState _self;
  final $Res Function(_CollapseState) _then;

/// Create a copy of CollapseState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? collapsed = null,}) {
  return _then(_CollapseState(
collapsed: null == collapsed ? _self.collapsed : collapsed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
