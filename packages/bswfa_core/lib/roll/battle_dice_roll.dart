import 'package:bswfa_core/roll/dice_roll.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battle_dice_roll.freezed.dart';

@freezed
abstract class BattleDiceRoll with _$BattleDiceRoll {
  const BattleDiceRoll._();

  const factory BattleDiceRoll({
    @Default(DiceRoll.zero) DiceRoll attackerDiceRoll,
    @Default(DiceRoll.zero) DiceRoll defenderDiceRoll,
  }) = _BattleDiceRoll;

  static const int _defenderOffset = 0;
  static const int _attackerOffset = DiceRoll.encodedBits;

  /// Clave estable de memoización para una tirada atacante + defensora.
  int get cacheKey {
    final int attacker = (attackerDiceRoll.bitmask) << _attackerOffset;
    final int defender = (defenderDiceRoll.bitmask) << _defenderOffset;
    return attacker | defender;
  }
}
