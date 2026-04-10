enum Die {
  sword,
  shield,
  star;

  /// Número de caras de espada en un dado de combate.
  static const int swordFaceCount = 3;

  /// Número de caras de escudo en un dado de combate.
  static const int shieldFaceCount = 2;

  /// Número de caras de estrella en un dado de combate.
  static const int starFaceCount = 1;

  /// Total de caras que tiene un dado.
  static const int faceCount = swordFaceCount + shieldFaceCount + starFaceCount;

  /// Distribución real de caras para permutar resultados.
  static const List<Die> faces = <Die>[
    sword,
    sword,
    sword,
    shield,
    shield,
    star,
  ];

  /// Probabilidad de obtener esta cara en una tirada de un dado.
  double get probability {
    switch (this) {
      case Die.sword:
        return swordFaceCount / faceCount;
      case Die.shield:
        return shieldFaceCount / faceCount;
      case Die.star:
        return starFaceCount / faceCount;
    }
  }
}
