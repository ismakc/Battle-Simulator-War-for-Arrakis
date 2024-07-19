enum NamedLeader {
  leader0_1(0, 1),
  leader0_1_duplicate(0, 1),
  leader0_2(0, 2),
  leader0_3(0, 3),
  leader1_0(1, 0),
  leader1_1(1, 1),
  leader1_2(1, 2),
  leader2_0(2, 0),
  leader2_0_duplicate(2, 0),
  leader2_1(2, 1),
  leader2_1_duplicate(2, 1);

  const NamedLeader(this.attack, this.defense);

  final int attack;
  final int defense;

  String get displayAsString => "$attack/$defense";
}
