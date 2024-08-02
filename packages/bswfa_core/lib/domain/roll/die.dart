enum Die {
  sword,
  shield,
  star;

  static const List<Die> faces = <Die>[sword, sword, sword, shield, shield, star];

  static const double swords = 3;
  static const double shields = 2;
  static const double stars = 1;
  static const double totalFaces = swords + shields + stars;
}
