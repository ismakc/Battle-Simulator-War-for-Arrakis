class DiceRoll {
  const DiceRoll(this.bitmask);

  final int bitmask;

  static const DiceRoll empty = DiceRoll(0);

  int swordCount() {
    return bitmask & 0xF;
  }

  int shieldCount() {
    return (bitmask >> 4) & 0xF;
  }

  int starCount() {
    return (bitmask >> 8) & 0xF;
  }

  DiceRoll withAddedSword() {
    return DiceRoll((bitmask & 0xFFFFFFF0) | (swordCount() + 1 & 0xF));
  }

  DiceRoll withAddedShield() {
    return DiceRoll((bitmask & 0xFFFFFF0F) | ((shieldCount() + 1 & 0xF) << 4));
  }

  DiceRoll withAddedStar() {
    return DiceRoll((bitmask & 0xFFFFF0FF) | ((starCount() + 1 & 0xF) << 8));
  }

  @override
  String toString() {
    final StringBuffer emojis = StringBuffer();
    emojis.write('⚔️' * swordCount());
    emojis.write('🛡️' * shieldCount());
    emojis.write('⭐' * starCount());
    return emojis.toString();
  }
}
