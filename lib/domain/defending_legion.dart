import 'package:bswfa/domain/named_leader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'defending_legion.freezed.dart';

@freezed
class DefendingLegion with _$DefendingLegion {
  const DefendingLegion._();

  const factory DefendingLegion({
    @Default(0) int regularUnits,
    @Default(0) int eliteUnits,
    @Default(0) int specialEliteUnits,
    @Default(0) int genericLeaders,
    @Default(0) int usedCards,
    @Default(0) int settlementLevel,
    @Default([]) List<NamedLeader> namedLeaders,
  }) = _DefendingLegion;

  factory DefendingLegion.defaultValues() => const DefendingLegion();
}
