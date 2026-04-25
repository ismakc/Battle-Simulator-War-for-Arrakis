import 'package:bswfa_core/legion/named_leader.dart';

/// Define el orden de activación de líderes de renombre durante el combate.
class LeaderActivationOrderPolicy {
  const LeaderActivationOrderPolicy._();

  static List<NamedLeader> orderForActivation(List<NamedLeader> namedLeaders) {
    return List<NamedLeader>.from(namedLeaders)..sort(
      (NamedLeader a, NamedLeader b) => b.attack != a.attack
          ? b.attack.compareTo(a.attack)
          : b.defense.compareTo(a.defense),
    );
  }
}
