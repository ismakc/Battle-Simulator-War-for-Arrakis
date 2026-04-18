// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'legion_resolution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LegionResolution {

 List<LegionChange> get changes;
/// Create a copy of LegionResolution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LegionResolutionCopyWith<LegionResolution> get copyWith => _$LegionResolutionCopyWithImpl<LegionResolution>(this as LegionResolution, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LegionResolution&&const DeepCollectionEquality().equals(other.changes, changes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(changes));

@override
String toString() {
  return 'LegionResolution(changes: $changes)';
}


}

/// @nodoc
abstract mixin class $LegionResolutionCopyWith<$Res>  {
  factory $LegionResolutionCopyWith(LegionResolution value, $Res Function(LegionResolution) _then) = _$LegionResolutionCopyWithImpl;
@useResult
$Res call({
 List<LegionChange> changes
});




}
/// @nodoc
class _$LegionResolutionCopyWithImpl<$Res>
    implements $LegionResolutionCopyWith<$Res> {
  _$LegionResolutionCopyWithImpl(this._self, this._then);

  final LegionResolution _self;
  final $Res Function(LegionResolution) _then;

/// Create a copy of LegionResolution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? changes = null,}) {
  return _then(_self.copyWith(
changes: null == changes ? _self.changes : changes // ignore: cast_nullable_to_non_nullable
as List<LegionChange>,
  ));
}

}


/// Adds pattern-matching-related methods to [LegionResolution].
extension LegionResolutionPatterns on LegionResolution {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LegionResolution value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LegionResolution() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LegionResolution value)  $default,){
final _that = this;
switch (_that) {
case _LegionResolution():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LegionResolution value)?  $default,){
final _that = this;
switch (_that) {
case _LegionResolution() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LegionChange> changes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LegionResolution() when $default != null:
return $default(_that.changes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LegionChange> changes)  $default,) {final _that = this;
switch (_that) {
case _LegionResolution():
return $default(_that.changes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LegionChange> changes)?  $default,) {final _that = this;
switch (_that) {
case _LegionResolution() when $default != null:
return $default(_that.changes);case _:
  return null;

}
}

}

/// @nodoc


class _LegionResolution extends LegionResolution {
  const _LegionResolution({final  List<LegionChange> changes = const <LegionChange>[]}): _changes = changes,super._();
  

 final  List<LegionChange> _changes;
@override@JsonKey() List<LegionChange> get changes {
  if (_changes is EqualUnmodifiableListView) return _changes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_changes);
}


/// Create a copy of LegionResolution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LegionResolutionCopyWith<_LegionResolution> get copyWith => __$LegionResolutionCopyWithImpl<_LegionResolution>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LegionResolution&&const DeepCollectionEquality().equals(other._changes, _changes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_changes));

@override
String toString() {
  return 'LegionResolution(changes: $changes)';
}


}

/// @nodoc
abstract mixin class _$LegionResolutionCopyWith<$Res> implements $LegionResolutionCopyWith<$Res> {
  factory _$LegionResolutionCopyWith(_LegionResolution value, $Res Function(_LegionResolution) _then) = __$LegionResolutionCopyWithImpl;
@override @useResult
$Res call({
 List<LegionChange> changes
});




}
/// @nodoc
class __$LegionResolutionCopyWithImpl<$Res>
    implements _$LegionResolutionCopyWith<$Res> {
  __$LegionResolutionCopyWithImpl(this._self, this._then);

  final _LegionResolution _self;
  final $Res Function(_LegionResolution) _then;

/// Create a copy of LegionResolution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? changes = null,}) {
  return _then(_LegionResolution(
changes: null == changes ? _self._changes : changes // ignore: cast_nullable_to_non_nullable
as List<LegionChange>,
  ));
}


}

// dart format on
