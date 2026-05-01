import 'package:bswfa_core/legion/named_leader.dart';

/// Selecciona qué líder de renombre debe perderse cuando una legión sufre una
/// baja y hay que elegir entre varios líderes.
class NamedLeaderLossSelectionPolicy {
  const NamedLeaderLossSelectionPolicy._();

  static NamedLeader selectLeaderToLose(List<NamedLeader> leaders) {
    NamedLeader selectedLeader = leaders.first;

    for (final NamedLeader candidate in leaders.skip(1)) {
      if (_shouldPreferLosing(candidate, selectedLeader)) {
        selectedLeader = candidate;
      }
    }

    return selectedLeader;
  }

  /// Entre varios líderes nombrados, se pierde el menos valioso para el combate:
  /// primero el de menor ataque y, en empate, el de menor defensa.
  static bool _shouldPreferLosing(
    NamedLeader candidate,
    NamedLeader currentSelection,
  ) {
    if (candidate.attack != currentSelection.attack) {
      return candidate.attack < currentSelection.attack;
    }

    return candidate.defense < currentSelection.defense;
  }
}
