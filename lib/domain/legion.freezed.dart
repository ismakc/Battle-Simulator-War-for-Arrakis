// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'legion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Legion {
  int get genericLeaders => throw _privateConstructorUsedError;
  int get regularUnits => throw _privateConstructorUsedError;
  int get eliteUnits => throw _privateConstructorUsedError;
  int get specialEliteUnits => throw _privateConstructorUsedError;
  int get usedCards => throw _privateConstructorUsedError;
  List<NamedLeader> get namedLeaders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LegionCopyWith<Legion> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LegionCopyWith<$Res> {
  factory $LegionCopyWith(Legion value, $Res Function(Legion) then) =
      _$LegionCopyWithImpl<$Res, Legion>;
  @useResult
  $Res call(
      {int genericLeaders,
      int regularUnits,
      int eliteUnits,
      int specialEliteUnits,
      int usedCards,
      List<NamedLeader> namedLeaders});
}

/// @nodoc
class _$LegionCopyWithImpl<$Res, $Val extends Legion>
    implements $LegionCopyWith<$Res> {
  _$LegionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genericLeaders = null,
    Object? regularUnits = null,
    Object? eliteUnits = null,
    Object? specialEliteUnits = null,
    Object? usedCards = null,
    Object? namedLeaders = null,
  }) {
    return _then(_value.copyWith(
      genericLeaders: null == genericLeaders
          ? _value.genericLeaders
          : genericLeaders // ignore: cast_nullable_to_non_nullable
              as int,
      regularUnits: null == regularUnits
          ? _value.regularUnits
          : regularUnits // ignore: cast_nullable_to_non_nullable
              as int,
      eliteUnits: null == eliteUnits
          ? _value.eliteUnits
          : eliteUnits // ignore: cast_nullable_to_non_nullable
              as int,
      specialEliteUnits: null == specialEliteUnits
          ? _value.specialEliteUnits
          : specialEliteUnits // ignore: cast_nullable_to_non_nullable
              as int,
      usedCards: null == usedCards
          ? _value.usedCards
          : usedCards // ignore: cast_nullable_to_non_nullable
              as int,
      namedLeaders: null == namedLeaders
          ? _value.namedLeaders
          : namedLeaders // ignore: cast_nullable_to_non_nullable
              as List<NamedLeader>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LegionImplCopyWith<$Res> implements $LegionCopyWith<$Res> {
  factory _$$LegionImplCopyWith(
          _$LegionImpl value, $Res Function(_$LegionImpl) then) =
      __$$LegionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int genericLeaders,
      int regularUnits,
      int eliteUnits,
      int specialEliteUnits,
      int usedCards,
      List<NamedLeader> namedLeaders});
}

/// @nodoc
class __$$LegionImplCopyWithImpl<$Res>
    extends _$LegionCopyWithImpl<$Res, _$LegionImpl>
    implements _$$LegionImplCopyWith<$Res> {
  __$$LegionImplCopyWithImpl(
      _$LegionImpl _value, $Res Function(_$LegionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genericLeaders = null,
    Object? regularUnits = null,
    Object? eliteUnits = null,
    Object? specialEliteUnits = null,
    Object? usedCards = null,
    Object? namedLeaders = null,
  }) {
    return _then(_$LegionImpl(
      genericLeaders: null == genericLeaders
          ? _value.genericLeaders
          : genericLeaders // ignore: cast_nullable_to_non_nullable
              as int,
      regularUnits: null == regularUnits
          ? _value.regularUnits
          : regularUnits // ignore: cast_nullable_to_non_nullable
              as int,
      eliteUnits: null == eliteUnits
          ? _value.eliteUnits
          : eliteUnits // ignore: cast_nullable_to_non_nullable
              as int,
      specialEliteUnits: null == specialEliteUnits
          ? _value.specialEliteUnits
          : specialEliteUnits // ignore: cast_nullable_to_non_nullable
              as int,
      usedCards: null == usedCards
          ? _value.usedCards
          : usedCards // ignore: cast_nullable_to_non_nullable
              as int,
      namedLeaders: null == namedLeaders
          ? _value._namedLeaders
          : namedLeaders // ignore: cast_nullable_to_non_nullable
              as List<NamedLeader>,
    ));
  }
}

/// @nodoc

class _$LegionImpl extends _Legion {
  const _$LegionImpl(
      {this.genericLeaders = 0,
      this.regularUnits = 0,
      this.eliteUnits = 0,
      this.specialEliteUnits = 0,
      this.usedCards = 0,
      final List<NamedLeader> namedLeaders = const []})
      : _namedLeaders = namedLeaders,
        super._();

  @override
  @JsonKey()
  final int genericLeaders;
  @override
  @JsonKey()
  final int regularUnits;
  @override
  @JsonKey()
  final int eliteUnits;
  @override
  @JsonKey()
  final int specialEliteUnits;
  @override
  @JsonKey()
  final int usedCards;
  final List<NamedLeader> _namedLeaders;
  @override
  @JsonKey()
  List<NamedLeader> get namedLeaders {
    if (_namedLeaders is EqualUnmodifiableListView) return _namedLeaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_namedLeaders);
  }

  @override
  String toString() {
    return 'Legion(genericLeaders: $genericLeaders, regularUnits: $regularUnits, eliteUnits: $eliteUnits, specialEliteUnits: $specialEliteUnits, usedCards: $usedCards, namedLeaders: $namedLeaders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LegionImpl &&
            (identical(other.genericLeaders, genericLeaders) ||
                other.genericLeaders == genericLeaders) &&
            (identical(other.regularUnits, regularUnits) ||
                other.regularUnits == regularUnits) &&
            (identical(other.eliteUnits, eliteUnits) ||
                other.eliteUnits == eliteUnits) &&
            (identical(other.specialEliteUnits, specialEliteUnits) ||
                other.specialEliteUnits == specialEliteUnits) &&
            (identical(other.usedCards, usedCards) ||
                other.usedCards == usedCards) &&
            const DeepCollectionEquality()
                .equals(other._namedLeaders, _namedLeaders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      genericLeaders,
      regularUnits,
      eliteUnits,
      specialEliteUnits,
      usedCards,
      const DeepCollectionEquality().hash(_namedLeaders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LegionImplCopyWith<_$LegionImpl> get copyWith =>
      __$$LegionImplCopyWithImpl<_$LegionImpl>(this, _$identity);
}

abstract class _Legion extends Legion {
  const factory _Legion(
      {final int genericLeaders,
      final int regularUnits,
      final int eliteUnits,
      final int specialEliteUnits,
      final int usedCards,
      final List<NamedLeader> namedLeaders}) = _$LegionImpl;
  const _Legion._() : super._();

  @override
  int get genericLeaders;
  @override
  int get regularUnits;
  @override
  int get eliteUnits;
  @override
  int get specialEliteUnits;
  @override
  int get usedCards;
  @override
  List<NamedLeader> get namedLeaders;
  @override
  @JsonKey(ignore: true)
  _$$LegionImplCopyWith<_$LegionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
