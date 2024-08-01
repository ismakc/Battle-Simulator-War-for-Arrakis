import 'package:bswfa/domain/legion/named_leader.dart';

class LeaderSelectorPolicy {
  static List<NamedLeader> orderAttackerLeaders(List<NamedLeader> namedLeaders) {
    return List<NamedLeader>.from(namedLeaders)
      ..sort(
        (NamedLeader a, NamedLeader b) =>
            b.attack != a.attack ? b.attack.compareTo(a.attack) : b.defense.compareTo(a.defense),
      );
  }

  static List<NamedLeader> orderDefenderLeaders(List<NamedLeader> namedLeaders) {
    return List<NamedLeader>.from(namedLeaders)
      ..sort(
        (NamedLeader a, NamedLeader b) =>
            b.attack != a.attack ? b.attack.compareTo(a.attack) : b.defense.compareTo(a.defense),
      );
  }
}
