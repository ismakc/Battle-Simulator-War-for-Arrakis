import 'package:bswfa_core/battle/distribution/battle_distribution.dart';
import 'package:bswfa_core/legion/legion.dart';

class LegionRecommendation {
  const LegionRecommendation({
    required this.legion,
    required this.distribution,
    required this.ownWinProbability,
    required this.ownLoseProbability,
    required this.cost,
    required this.score,
    required this.meetsTarget,
  });

  final Legion legion;
  final BattleDistribution distribution;
  final double ownWinProbability;
  final double ownLoseProbability;
  final double cost;
  final double score;
  final bool meetsTarget;
}
