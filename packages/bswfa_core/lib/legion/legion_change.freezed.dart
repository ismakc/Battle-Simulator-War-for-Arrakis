// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'legion_change.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LegionChange {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LegionChange);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LegionChange()';
}


}

/// @nodoc
class $LegionChangeCopyWith<$Res>  {
$LegionChangeCopyWith(LegionChange _, $Res Function(LegionChange) __);
}


/// Adds pattern-matching-related methods to [LegionChange].
extension LegionChangePatterns on LegionChange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RemoveGenericLeader value)?  removeGenericLeader,TResult Function( RemoveRegularUnit value)?  removeRegularUnit,TResult Function( DowngradeEliteUnit value)?  downgradeEliteUnit,TResult Function( DowngradeSpecialEliteUnit value)?  downgradeSpecialEliteUnit,TResult Function( RemoveNamedLeader value)?  removeNamedLeader,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RemoveGenericLeader() when removeGenericLeader != null:
return removeGenericLeader(_that);case RemoveRegularUnit() when removeRegularUnit != null:
return removeRegularUnit(_that);case DowngradeEliteUnit() when downgradeEliteUnit != null:
return downgradeEliteUnit(_that);case DowngradeSpecialEliteUnit() when downgradeSpecialEliteUnit != null:
return downgradeSpecialEliteUnit(_that);case RemoveNamedLeader() when removeNamedLeader != null:
return removeNamedLeader(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RemoveGenericLeader value)  removeGenericLeader,required TResult Function( RemoveRegularUnit value)  removeRegularUnit,required TResult Function( DowngradeEliteUnit value)  downgradeEliteUnit,required TResult Function( DowngradeSpecialEliteUnit value)  downgradeSpecialEliteUnit,required TResult Function( RemoveNamedLeader value)  removeNamedLeader,}){
final _that = this;
switch (_that) {
case RemoveGenericLeader():
return removeGenericLeader(_that);case RemoveRegularUnit():
return removeRegularUnit(_that);case DowngradeEliteUnit():
return downgradeEliteUnit(_that);case DowngradeSpecialEliteUnit():
return downgradeSpecialEliteUnit(_that);case RemoveNamedLeader():
return removeNamedLeader(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RemoveGenericLeader value)?  removeGenericLeader,TResult? Function( RemoveRegularUnit value)?  removeRegularUnit,TResult? Function( DowngradeEliteUnit value)?  downgradeEliteUnit,TResult? Function( DowngradeSpecialEliteUnit value)?  downgradeSpecialEliteUnit,TResult? Function( RemoveNamedLeader value)?  removeNamedLeader,}){
final _that = this;
switch (_that) {
case RemoveGenericLeader() when removeGenericLeader != null:
return removeGenericLeader(_that);case RemoveRegularUnit() when removeRegularUnit != null:
return removeRegularUnit(_that);case DowngradeEliteUnit() when downgradeEliteUnit != null:
return downgradeEliteUnit(_that);case DowngradeSpecialEliteUnit() when downgradeSpecialEliteUnit != null:
return downgradeSpecialEliteUnit(_that);case RemoveNamedLeader() when removeNamedLeader != null:
return removeNamedLeader(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  removeGenericLeader,TResult Function()?  removeRegularUnit,TResult Function()?  downgradeEliteUnit,TResult Function()?  downgradeSpecialEliteUnit,TResult Function( NamedLeader leader)?  removeNamedLeader,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RemoveGenericLeader() when removeGenericLeader != null:
return removeGenericLeader();case RemoveRegularUnit() when removeRegularUnit != null:
return removeRegularUnit();case DowngradeEliteUnit() when downgradeEliteUnit != null:
return downgradeEliteUnit();case DowngradeSpecialEliteUnit() when downgradeSpecialEliteUnit != null:
return downgradeSpecialEliteUnit();case RemoveNamedLeader() when removeNamedLeader != null:
return removeNamedLeader(_that.leader);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  removeGenericLeader,required TResult Function()  removeRegularUnit,required TResult Function()  downgradeEliteUnit,required TResult Function()  downgradeSpecialEliteUnit,required TResult Function( NamedLeader leader)  removeNamedLeader,}) {final _that = this;
switch (_that) {
case RemoveGenericLeader():
return removeGenericLeader();case RemoveRegularUnit():
return removeRegularUnit();case DowngradeEliteUnit():
return downgradeEliteUnit();case DowngradeSpecialEliteUnit():
return downgradeSpecialEliteUnit();case RemoveNamedLeader():
return removeNamedLeader(_that.leader);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  removeGenericLeader,TResult? Function()?  removeRegularUnit,TResult? Function()?  downgradeEliteUnit,TResult? Function()?  downgradeSpecialEliteUnit,TResult? Function( NamedLeader leader)?  removeNamedLeader,}) {final _that = this;
switch (_that) {
case RemoveGenericLeader() when removeGenericLeader != null:
return removeGenericLeader();case RemoveRegularUnit() when removeRegularUnit != null:
return removeRegularUnit();case DowngradeEliteUnit() when downgradeEliteUnit != null:
return downgradeEliteUnit();case DowngradeSpecialEliteUnit() when downgradeSpecialEliteUnit != null:
return downgradeSpecialEliteUnit();case RemoveNamedLeader() when removeNamedLeader != null:
return removeNamedLeader(_that.leader);case _:
  return null;

}
}

}

/// @nodoc


class RemoveGenericLeader extends LegionChange {
  const RemoveGenericLeader(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveGenericLeader);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LegionChange.removeGenericLeader()';
}


}




/// @nodoc


class RemoveRegularUnit extends LegionChange {
  const RemoveRegularUnit(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveRegularUnit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LegionChange.removeRegularUnit()';
}


}




/// @nodoc


class DowngradeEliteUnit extends LegionChange {
  const DowngradeEliteUnit(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DowngradeEliteUnit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LegionChange.downgradeEliteUnit()';
}


}




/// @nodoc


class DowngradeSpecialEliteUnit extends LegionChange {
  const DowngradeSpecialEliteUnit(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DowngradeSpecialEliteUnit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LegionChange.downgradeSpecialEliteUnit()';
}


}




/// @nodoc


class RemoveNamedLeader extends LegionChange {
  const RemoveNamedLeader({required this.leader}): super._();
  

 final  NamedLeader leader;

/// Create a copy of LegionChange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveNamedLeaderCopyWith<RemoveNamedLeader> get copyWith => _$RemoveNamedLeaderCopyWithImpl<RemoveNamedLeader>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveNamedLeader&&(identical(other.leader, leader) || other.leader == leader));
}


@override
int get hashCode => Object.hash(runtimeType,leader);

@override
String toString() {
  return 'LegionChange.removeNamedLeader(leader: $leader)';
}


}

/// @nodoc
abstract mixin class $RemoveNamedLeaderCopyWith<$Res> implements $LegionChangeCopyWith<$Res> {
  factory $RemoveNamedLeaderCopyWith(RemoveNamedLeader value, $Res Function(RemoveNamedLeader) _then) = _$RemoveNamedLeaderCopyWithImpl;
@useResult
$Res call({
 NamedLeader leader
});




}
/// @nodoc
class _$RemoveNamedLeaderCopyWithImpl<$Res>
    implements $RemoveNamedLeaderCopyWith<$Res> {
  _$RemoveNamedLeaderCopyWithImpl(this._self, this._then);

  final RemoveNamedLeader _self;
  final $Res Function(RemoveNamedLeader) _then;

/// Create a copy of LegionChange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? leader = null,}) {
  return _then(RemoveNamedLeader(
leader: null == leader ? _self.leader : leader // ignore: cast_nullable_to_non_nullable
as NamedLeader,
  ));
}


}

// dart format on
