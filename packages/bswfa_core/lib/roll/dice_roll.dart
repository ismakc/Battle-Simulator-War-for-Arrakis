import 'package:bswfa_core/roll/battle_die.dart';

/// Resultado inmutable de una tirada de dados de batalla.
///
/// Los conteos de espadas, escudos y estrellas se almacenan en un único
/// entero usando 3 nibbles de 4 bits:
///
/// ```
/// Bits:  [11..8]  [7..4]   [3..0]
///        estrellas escudos  espadas
/// ```
///
/// Ejemplos:
/// ```
/// Espadas | Escudos | Estrellas | Bitmask (hex)
/// --------|---------|-----------|---------------
///    0    |    0    |     0     |     0x000
///    1    |    0    |     0     |     0x001
///    0    |    1    |     0     |     0x010
///    0    |    0    |     1     |     0x100
///    3    |    2    |     1     |     0x123
///    1    |    3    |     2     |     0x231
/// ```
class DiceRoll {
  const DiceRoll._(this.bitmask);

  factory DiceRoll(int bitmask) {
    return DiceRoll._(bitmask);
  }

  static const int segmentBits = 4;
  static const int countMask = 0xF;

  static const int swordOffset = 0; // bits 0-3
  static const int shieldOffset = swordOffset + segmentBits; // bits 4-7
  static const int starOffset = shieldOffset + segmentBits; // bits 8-11

  static const int maxDiceCount = 6;
  static const int encodedBits = starOffset + segmentBits;
  static const int maxEncodedBitmask = (1 << encodedBits) - 1; // 0xFFF

  static const DiceRoll zero = DiceRoll._(0);

  final int bitmask;

  int get swordCount => (bitmask >> swordOffset) & countMask;

  int get shieldCount => (bitmask >> shieldOffset) & countMask;

  int get starCount => (bitmask >> starOffset) & countMask;

  int get totalDice => swordCount + shieldCount + starCount;

  DiceRoll addSword() => _increment(BattleDie.sword);

  DiceRoll addShield() => _increment(BattleDie.shield);

  DiceRoll addStar() => _increment(BattleDie.star);

  DiceRoll _increment(BattleDie face) {
    final (int value, int offset) = switch (face) {
      BattleDie.sword => (swordCount, swordOffset),
      BattleDie.shield => (shieldCount, shieldOffset),
      BattleDie.star => (starCount, starOffset),
    };
    return _incrementAtOffset(value, offset);
  }

  DiceRoll _incrementAtOffset(int value, int offset) {
    if (totalDice >= maxDiceCount) {
      throw StateError('Cannot add more than $maxDiceCount dice to a roll.');
    }
    if (value >= maxDiceCount) {
      throw StateError(
        'Cannot encode more than $maxDiceCount dice for a single face.',
      );
    }

    final int newValue = value + 1;
    final int clearMask = ~(countMask << offset); // pone a 0 el nibble objetivo
    final int newBitmask =
        (bitmask & clearMask) // borra el nibble
        |
        (newValue << offset); // escribe el nuevo valor
    return DiceRoll._(newBitmask);
  }
}
