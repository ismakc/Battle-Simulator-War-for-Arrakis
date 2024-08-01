class DiceRoll {
  const DiceRoll(this.bitmask);

  final int bitmask;

  static const DiceRoll defaultValues = DiceRoll(0);

  int get swordCount {
    return bitmask & 0xF;
  }

  int get shieldCount {
    return (bitmask >> 4) & 0xF;
  }

  int get starCount {
    return (bitmask >> 8) & 0xF;
  }

  DiceRoll addSword() {
    return DiceRoll((bitmask & 0xFFFFFFF0) | (swordCount + 1 & 0xF));
  }

  DiceRoll addShield() {
    return DiceRoll((bitmask & 0xFFFFFF0F) | ((shieldCount + 1 & 0xF) << 4));
  }

  DiceRoll addStar() {
    return DiceRoll((bitmask & 0xFFFFF0FF) | ((starCount + 1 & 0xF) << 8));
  }
}
