class DiceRoll {
  const DiceRoll(this.bitmask) : assert(bitmask >= 0 && bitmask <= 0xFFF, 'Bitmask must be between 0 and 0xFFF');

  const DiceRoll.empty() : bitmask = 0;

  final int bitmask;

  int get swordCount => bitmask & 0xF;

  int get shieldCount => (bitmask >> 4) & 0xF;

  int get starCount => (bitmask >> 8) & 0xF;

  DiceRoll addSword() => DiceRoll((bitmask & 0xFFFFFFF0) | (swordCount + 1 & 0xF));

  DiceRoll addShield() => DiceRoll((bitmask & 0xFFFFFF0F) | ((shieldCount + 1 & 0xF) << 4));

  DiceRoll addStar() => DiceRoll((bitmask & 0xFFFFF0FF) | ((starCount + 1 & 0xF) << 8));
}
