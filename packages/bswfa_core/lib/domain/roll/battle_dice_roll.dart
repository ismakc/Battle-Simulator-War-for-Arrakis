import 'package:bswfa_core/domain/roll/dice_roll.dart';

class BattleDiceRoll {
  const BattleDiceRoll(this.attackerRoll, this.defenderRoll);

  const BattleDiceRoll.empty()
      : attackerRoll = const DiceRoll.empty(),
        defenderRoll = const DiceRoll.empty();

  final DiceRoll attackerRoll;
  final DiceRoll defenderRoll;

  /// Returns the concatenated bitMask of [attackerRoll] and [defenderRoll].
  int get combinedBitMask {
    return (attackerRoll.bitmask << 16) | defenderRoll.bitmask;
  }

  BattleDiceRoll copyWith({
    DiceRoll? attackerDiceRoll,
    DiceRoll? defenderDiceRoll,
  }) {
    return BattleDiceRoll(
      attackerDiceRoll ?? attackerRoll,
      defenderDiceRoll ?? defenderRoll,
    );
  }
}
