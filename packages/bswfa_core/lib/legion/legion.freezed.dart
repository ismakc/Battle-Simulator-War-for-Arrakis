// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'legion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Legion {

  int get genericLeaders;

  int get regularUnits;

  int get eliteUnits;

  int get specialEliteUnits;

  List<NamedLeader> get namedLeaders;

  int get usedCards;

  /// Create a copy of Legion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LegionCopyWith<Legion> get copyWith =>
      _$LegionCopyWithImpl<Legion>(this as Legion, _$identity);


  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Legion &&
            (identical(other.genericLeaders, genericLeaders) ||
                other.genericLeaders == genericLeaders) &&
            (identical(other.regularUnits, regularUnits) ||
                other.regularUnits == regularUnits) &&
            (identical(other.eliteUnits, eliteUnits) ||
                other.eliteUnits == eliteUnits) &&
            (identical(other.specialEliteUnits, specialEliteUnits) ||
                other.specialEliteUnits == specialEliteUnits) &&
            const DeepCollectionEquality().equals(
                other.namedLeaders, namedLeaders) &&
            (identical(other.usedCards, usedCards) ||
                other.usedCards == usedCards));
  }


  @override
  int get hashCode =>
      Object.hash(
          runtimeType,
          genericLeaders,
          regularUnits,
          eliteUnits,
          specialEliteUnits,
          const DeepCollectionEquality().hash(namedLeaders),
          usedCards);

  @override
  String toString() {
    return 'Legion(genericLeaders: $genericLeaders, regularUnits: $regularUnits, eliteUnits: $eliteUnits, specialEliteUnits: $specialEliteUnits, namedLeaders: $namedLeaders, usedCards: $usedCards)';
  }


}

/// @nodoc
abstract mixin class $LegionCopyWith<$Res> {
  factory $LegionCopyWith(Legion value,
      $Res Function(Legion) _then) = _$LegionCopyWithImpl;

  @useResult
  $Res call({
    int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, List<
        NamedLeader> namedLeaders, int usedCards
  });


}

/// @nodoc
class _$LegionCopyWithImpl<$Res>
    implements $LegionCopyWith<$Res> {
  _$LegionCopyWithImpl(this._self, this._then);

  final Legion _self;
  final $Res Function(Legion) _then;

  /// Create a copy of Legion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call(
      {Object? genericLeaders = null, Object? regularUnits = null, Object? eliteUnits = null, Object? specialEliteUnits = null, Object? namedLeaders = null, Object? usedCards = null,}) {
    return _then(_self.copyWith(
      genericLeaders: null == genericLeaders
          ? _self.genericLeaders
          : genericLeaders // ignore: cast_nullable_to_non_nullable
      as int,
      regularUnits: null == regularUnits
          ? _self.regularUnits
          : regularUnits // ignore: cast_nullable_to_non_nullable
      as int,
      eliteUnits: null == eliteUnits
          ? _self.eliteUnits
          : eliteUnits // ignore: cast_nullable_to_non_nullable
      as int,
      specialEliteUnits: null == specialEliteUnits
          ? _self.specialEliteUnits
          : specialEliteUnits // ignore: cast_nullable_to_non_nullable
      as int,
      namedLeaders: null == namedLeaders
          ? _self.namedLeaders
          : namedLeaders // ignore: cast_nullable_to_non_nullable
      as List<NamedLeader>,
      usedCards: null == usedCards
          ? _self.usedCards
          : usedCards // ignore: cast_nullable_to_non_nullable
      as int,
    ));
  }

}


/// Adds pattern-matching-related methods to [Legion].
extension LegionPatterns on Legion {
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

  @optionalTypeArgs TResult maybeMap

  <

  TResult

  extends

  Object?

  >

  (

  {

  TResult

  Function

  (

  AttackingLegion

  value

  )

  ?

  attacking

  ,

  TResult

  Function

  (

  DefendingLegion

  value

  )

  ?

  defending

  ,

  required

  TResult

  orElse

  (

  )

  ,
}){
final _that = this;
switch (_that) {
case AttackingLegion() when attacking != null:
return attacking(_that);case DefendingLegion() when defending != null:
return defending(_that);case _:
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

@optionalTypeArgs
TResult map<TResult extends Object?>(
    {required TResult Function( AttackingLegion value) attacking, required TResult Function( DefendingLegion value) defending,}) {
  final _that = this;
  switch (_that) {
    case AttackingLegion():
      return attacking(_that);
    case DefendingLegion():
      return defending(_that);
    case _:
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

@optionalTypeArgs
TResult? mapOrNull<TResult extends Object?>(
    {TResult? Function( AttackingLegion value)? attacking, TResult? Function( DefendingLegion value)? defending,}) {
  final _that = this;
  switch (_that) {
    case AttackingLegion() when attacking != null:
      return attacking(_that);
    case DefendingLegion() when defending != null:
      return defending(_that);
    case _:
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

@optionalTypeArgs TResult maybeWhen
<
TResult extends Object?>(
{
TResult
Function
(
int
genericLeaders
,
int
regularUnits
,
int
eliteUnits
,
int
specialEliteUnits
,
List
<
NamedLeader
>
namedLeaders
,
int
usedCards
,
bool
surpriseAttack
)
?
attacking
,
TResult
Function
(
int
genericLeaders
,
int
regularUnits
,
int
eliteUnits
,
int
specialEliteUnits
,
List
<
NamedLeader
>
namedLeaders
,
int
usedCards
,
int
settlementLevel
)
?
defending
,
required
TResult
orElse(),}) {final _that = this;
switch (_that) {
case AttackingLegion() when attacking != null:
return attacking(_that.genericLeaders,_that.regularUnits,_that.eliteUnits,_that.specialEliteUnits,_that.namedLeaders,_that.usedCards,_that.surpriseAttack);case DefendingLegion() when defending != null:
return defending(_that.genericLeaders,_that.regularUnits,_that.eliteUnits,_that.specialEliteUnits,_that.namedLeaders,_that.usedCards,_that.settlementLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, List<NamedLeader> namedLeaders, int usedCards, bool surpriseAttack) attacking,required TResult Function( int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, List<NamedLeader> namedLeaders, int usedCards, int settlementLevel) defending,}) {final _that = this;
switch (_that) {
case AttackingLegion():
return attacking(_that.genericLeaders,_that.regularUnits,_that.eliteUnits,_that.specialEliteUnits,_that.namedLeaders,_that.usedCards,_that.surpriseAttack);case DefendingLegion():
return defending(_that.genericLeaders,_that.regularUnits,_that.eliteUnits,_that.specialEliteUnits,_that.namedLeaders,_that.usedCards,_that.settlementLevel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, List<NamedLeader> namedLeaders, int usedCards, bool surpriseAttack)? attacking,TResult? Function( int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, List<NamedLeader> namedLeaders, int usedCards, int settlementLevel)? defending,}) {final _that = this;
switch (_that) {
case AttackingLegion() when attacking != null:
return attacking(_that.genericLeaders,_that.regularUnits,_that.eliteUnits,_that.specialEliteUnits,_that.namedLeaders,_that.usedCards,_that.surpriseAttack);case DefendingLegion() when defending != null:
return defending(_that.genericLeaders,_that.regularUnits,_that.eliteUnits,_that.specialEliteUnits,_that.namedLeaders,_that.usedCards,_that.settlementLevel);case _:
return null;

}
}

}

/// @nodoc


class AttackingLegion extends Legion {
const AttackingLegion({this.genericLeaders = 0, this.regularUnits = 0, this.eliteUnits = 0, this.specialEliteUnits = 0, final List<NamedLeader> namedLeaders = const <NamedLeader>[], this.usedCards = 0, this.surpriseAttack = false}): _namedLeaders = namedLeaders,super._();


@override@JsonKey() final int genericLeaders;
@override@JsonKey() final int regularUnits;
@override@JsonKey() final int eliteUnits;
@override@JsonKey() final int specialEliteUnits;
final List<NamedLeader> _namedLeaders;
@override@JsonKey() List<NamedLeader> get namedLeaders {
if (_namedLeaders is EqualUnmodifiableListView) return _namedLeaders;
// ignore: implicit_dynamic_type
return EqualUnmodifiableListView(_namedLeaders);
}

@override@JsonKey() final int usedCards;
@JsonKey() final bool surpriseAttack;

/// Create a copy of Legion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttackingLegionCopyWith<AttackingLegion> get copyWith => _$AttackingLegionCopyWithImpl<AttackingLegion>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is AttackingLegion&&(identical(other.genericLeaders, genericLeaders) || other.genericLeaders == genericLeaders)&&(identical(other.regularUnits, regularUnits) || other.regularUnits == regularUnits)&&(identical(other.eliteUnits, eliteUnits) || other.eliteUnits == eliteUnits)&&(identical(other.specialEliteUnits, specialEliteUnits) || other.specialEliteUnits == specialEliteUnits)&&const DeepCollectionEquality().equals(other._namedLeaders, _namedLeaders)&&(identical(other.usedCards, usedCards) || other.usedCards == usedCards)&&(identical(other.surpriseAttack, surpriseAttack) || other.surpriseAttack == surpriseAttack));
}


@override
int get hashCode => Object.hash(runtimeType,genericLeaders,regularUnits,eliteUnits,specialEliteUnits,const DeepCollectionEquality().hash(_namedLeaders),usedCards,surpriseAttack);

@override
String toString() {
return 'Legion.attacking(genericLeaders: $genericLeaders, regularUnits: $regularUnits, eliteUnits: $eliteUnits, specialEliteUnits: $specialEliteUnits, namedLeaders: $namedLeaders, usedCards: $usedCards, surpriseAttack: $surpriseAttack)';
}


}

/// @nodoc
abstract mixin class $AttackingLegionCopyWith<$Res> implements $LegionCopyWith<$Res> {
factory $AttackingLegionCopyWith(AttackingLegion value, $Res Function(AttackingLegion) _then) = _$AttackingLegionCopyWithImpl;
@override @useResult
$Res call({
int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, List<NamedLeader> namedLeaders, int usedCards, bool surpriseAttack
});


}
/// @nodoc
class _$AttackingLegionCopyWithImpl<$Res>
implements $AttackingLegionCopyWith<$Res> {
_$AttackingLegionCopyWithImpl(this._self, this._then);

final AttackingLegion _self;
final $Res Function(AttackingLegion) _then;

/// Create a copy of Legion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genericLeaders = null,Object? regularUnits = null,Object? eliteUnits = null,Object? specialEliteUnits = null,Object? namedLeaders = null,Object? usedCards = null,Object? surpriseAttack = null,}) {
return _then(AttackingLegion(
genericLeaders: null == genericLeaders ? _self.genericLeaders : genericLeaders // ignore: cast_nullable_to_non_nullable
as int,regularUnits: null == regularUnits ? _self.regularUnits : regularUnits // ignore: cast_nullable_to_non_nullable
as int,eliteUnits: null == eliteUnits ? _self.eliteUnits : eliteUnits // ignore: cast_nullable_to_non_nullable
as int,specialEliteUnits: null == specialEliteUnits ? _self.specialEliteUnits : specialEliteUnits // ignore: cast_nullable_to_non_nullable
as int,namedLeaders: null == namedLeaders ? _self._namedLeaders : namedLeaders // ignore: cast_nullable_to_non_nullable
as List<NamedLeader>,usedCards: null == usedCards ? _self.usedCards : usedCards // ignore: cast_nullable_to_non_nullable
as int,surpriseAttack: null == surpriseAttack ? _self.surpriseAttack : surpriseAttack // ignore: cast_nullable_to_non_nullable
as bool,
));
}


}

/// @nodoc


class DefendingLegion extends Legion {
const DefendingLegion({this.genericLeaders = 0, this.regularUnits = 0, this.eliteUnits = 0, this.specialEliteUnits = 0, final List<NamedLeader> namedLeaders = const <NamedLeader>[], this.usedCards = 0, this.settlementLevel = 0}): _namedLeaders = namedLeaders,super._();


@override@JsonKey() final int genericLeaders;
@override@JsonKey() final int regularUnits;
@override@JsonKey() final int eliteUnits;
@override@JsonKey() final int specialEliteUnits;
final List<NamedLeader> _namedLeaders;
@override@JsonKey() List<NamedLeader> get namedLeaders {
if (_namedLeaders is EqualUnmodifiableListView) return _namedLeaders;
// ignore: implicit_dynamic_type
return EqualUnmodifiableListView(_namedLeaders);
}

@override@JsonKey() final int usedCards;
@JsonKey() final int settlementLevel;

/// Create a copy of Legion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefendingLegionCopyWith<DefendingLegion> get copyWith => _$DefendingLegionCopyWithImpl<DefendingLegion>(this, _$identity);


@override
bool operator ==(Object other) {
return identical(this, other) || (other.runtimeType == runtimeType&&other is DefendingLegion&&(identical(other.genericLeaders, genericLeaders) || other.genericLeaders == genericLeaders)&&(identical(other.regularUnits, regularUnits) || other.regularUnits == regularUnits)&&(identical(other.eliteUnits, eliteUnits) || other.eliteUnits == eliteUnits)&&(identical(other.specialEliteUnits, specialEliteUnits) || other.specialEliteUnits == specialEliteUnits)&&const DeepCollectionEquality().equals(other._namedLeaders, _namedLeaders)&&(identical(other.usedCards, usedCards) || other.usedCards == usedCards)&&(identical(other.settlementLevel, settlementLevel) || other.settlementLevel == settlementLevel));
}


@override
int get hashCode => Object.hash(runtimeType,genericLeaders,regularUnits,eliteUnits,specialEliteUnits,const DeepCollectionEquality().hash(_namedLeaders),usedCards,settlementLevel);

@override
String toString() {
return 'Legion.defending(genericLeaders: $genericLeaders, regularUnits: $regularUnits, eliteUnits: $eliteUnits, specialEliteUnits: $specialEliteUnits, namedLeaders: $namedLeaders, usedCards: $usedCards, settlementLevel: $settlementLevel)';
}


}

/// @nodoc
abstract mixin class $DefendingLegionCopyWith<$Res> implements $LegionCopyWith<$Res> {
factory $DefendingLegionCopyWith(DefendingLegion value, $Res Function(DefendingLegion) _then) = _$DefendingLegionCopyWithImpl;
@override @useResult
$Res call({
int genericLeaders, int regularUnits, int eliteUnits, int specialEliteUnits, List<NamedLeader> namedLeaders, int usedCards, int settlementLevel
});


}
/// @nodoc
class _$DefendingLegionCopyWithImpl<$Res>
implements $DefendingLegionCopyWith<$Res> {
_$DefendingLegionCopyWithImpl(this._self, this._then);

final DefendingLegion _self;
final $Res Function(DefendingLegion) _then;

/// Create a copy of Legion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? genericLeaders = null,Object? regularUnits = null,Object? eliteUnits = null,Object? specialEliteUnits = null,Object? namedLeaders = null,Object? usedCards = null,Object? settlementLevel = null,}) {
return _then(DefendingLegion(
genericLeaders: null == genericLeaders ? _self.genericLeaders : genericLeaders // ignore: cast_nullable_to_non_nullable
as int,regularUnits: null == regularUnits ? _self.regularUnits : regularUnits // ignore: cast_nullable_to_non_nullable
as int,eliteUnits: null == eliteUnits ? _self.eliteUnits : eliteUnits // ignore: cast_nullable_to_non_nullable
as int,specialEliteUnits: null == specialEliteUnits ? _self.specialEliteUnits : specialEliteUnits // ignore: cast_nullable_to_non_nullable
as int,namedLeaders: null == namedLeaders ? _self._namedLeaders : namedLeaders // ignore: cast_nullable_to_non_nullable
as List<NamedLeader>,usedCards: null == usedCards ? _self.usedCards : usedCards // ignore: cast_nullable_to_non_nullable
as int,settlementLevel: null == settlementLevel ? _self.settlementLevel : settlementLevel // ignore: cast_nullable_to_non_nullable
as int,
));
}


}

// dart format on
