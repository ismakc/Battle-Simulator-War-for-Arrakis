import 'package:bswfa_core/domain/roll/die.dart';

/// Representa el resultado de una tirada de dados en el juego.
///
/// El bitmask codifica la cantidad de espadas, escudos y estrellas.
/// Los primeros 4 bits (0-3) representan la cantidad de espadas,
/// los siguientes 4 bits (4-7) la cantidad de escudos,
/// y los siguientes 4 bits (8-11) la cantidad de estrellas.
///
/// Esto permite almacenar y manipular los resultados de manera eficiente
/// usando operaciones a nivel de bits.
///
/// Ejemplo:
/// Teniendo en cuenta que un dado tiene 3 espadas, 2 escudos y 1 estrella,
/// y se pueden lanzar un máximo de 6 dados:
/// - Un bitmask de `0x00000000` representa 0 espadas, 0 escudos y 0 estrellas.
/// - Un bitmask de `0x00000001` representa 1 espada, 0 escudos y 0 estrellas.
/// - Un bitmask de `0x00000002` representa 2 espadas, 0 escudos y 0 estrellas.
/// - Un bitmask de `0x00000010` representa 0 espadas, 1 escudo y 0 estrellas.
/// - Un bitmask de `0x00000100` representa 0 espadas, 0 escudos y 1 estrella.
/// - Un bitmask de `0x00000111` representa 1 espada, 1 escudo y 1 estrella.
/// - Un bitmask de `0x00000211` representa 2 espadas, 1 escudo y 1 estrella.
/// - Un bitmask de `0x00000321` representa 3 espadas, 2 escudos y 1 estrella.
/// - Un bitmask de `0x00000132` representa 1 espada, 3 escudos y 2 estrellas.
/// - Un bitmask de `0x00000033` representa 3 espadas, 0 escudos y 3 estrellas.

class DiceRoll {
  const DiceRoll._(this.bitmask);

  factory DiceRoll(int bitmask) {
    _validateBitmask(bitmask);
    return DiceRoll._(bitmask);
  }

  static const int segmentBits = 4;
  static const int countMask = 0xF;
  static const int maxDiceCount = 6;
  static const int swordOffset = 0;
  static const int shieldOffset = swordOffset + segmentBits;
  static const int starOffset = shieldOffset + segmentBits;
  static const int encodedBits = starOffset + segmentBits;
  static const int maxEncodedBitmask = (1 << encodedBits) - 1;

  final int bitmask;

  static const DiceRoll defaultValues = DiceRoll._(0);

  static DiceRoll fromCounts({
    required int swordCount,
    required int shieldCount,
    required int starCount,
  }) {
    _validateCount(swordCount, 'swordCount');
    _validateCount(shieldCount, 'shieldCount');
    _validateCount(starCount, 'starCount');
    _validateTotalDice(swordCount + shieldCount + starCount);
    return DiceRoll(
      (swordCount << swordOffset) |
          (shieldCount << shieldOffset) |
          (starCount << starOffset),
    );
  }

  int get swordCount {
    return (bitmask >> swordOffset) & countMask;
  }

  int get shieldCount {
    return (bitmask >> shieldOffset) & countMask;
  }

  int get starCount {
    return (bitmask >> starOffset) & countMask;
  }

  int get totalDice {
    return swordCount + shieldCount + starCount;
  }

  DiceRoll increment(Die face) {
    switch (face) {
      case Die.sword:
        return _incrementAtOffset(swordCount, swordOffset, 'swordCount');
      case Die.shield:
        return _incrementAtOffset(shieldCount, shieldOffset, 'shieldCount');
      case Die.star:
        return _incrementAtOffset(starCount, starOffset, 'starCount');
    }
  }

  DiceRoll addSword() {
    return increment(Die.sword);
  }

  DiceRoll addShield() {
    return increment(Die.shield);
  }

  DiceRoll addStar() {
    return increment(Die.star);
  }

  DiceRoll _incrementAtOffset(int currentValue, int offset, String label) {
    if (totalDice >= maxDiceCount) {
      throw StateError('totalDice overflow: $totalDice >= $maxDiceCount');
    }
    if (currentValue >= maxDiceCount) {
      throw StateError('$label overflow: $currentValue >= $maxDiceCount');
    }
    final int incrementedValue = currentValue + 1;
    final int clearMask = ~(countMask << offset);
    final int updatedBitmask =
        (bitmask & clearMask) | (incrementedValue << offset);
    return DiceRoll(updatedBitmask);
  }

  static void _validateBitmask(int bitmask) {
    if (bitmask < 0 || bitmask > maxEncodedBitmask) {
      throw ArgumentError.value(
        bitmask,
        'bitmask',
        'DiceRoll bitmask must be in range 0..$maxEncodedBitmask',
      );
    }

    final int swords = (bitmask >> swordOffset) & countMask;
    final int shields = (bitmask >> shieldOffset) & countMask;
    final int stars = (bitmask >> starOffset) & countMask;
    _validateCount(swords, 'swordCount');
    _validateCount(shields, 'shieldCount');
    _validateCount(stars, 'starCount');
    _validateTotalDice(swords + shields + stars);
  }

  static void _validateCount(int count, String label) {
    if (count < 0 || count > maxDiceCount) {
      throw ArgumentError.value(
        count,
        label,
        '$label must be in range 0..$maxDiceCount',
      );
    }
  }

  static void _validateTotalDice(int totalDice) {
    if (totalDice < 0 || totalDice > maxDiceCount) {
      throw ArgumentError.value(
        totalDice,
        'totalDice',
        'totalDice must be in range 0..$maxDiceCount',
      );
    }
  }
}
