import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_constraints.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_role.dart';

class LegionRecommendationRequest {
  const LegionRecommendationRequest({
    required this.enemyLegion,
    required this.ownRole,
    required this.constraints,
    this.maxRounds = 3,
    this.targetWinProbability = 0.6,
    this.limit = 3,
    this.maxEvaluatedCandidates = 250,
  });

  final Legion enemyLegion;
  final LegionRecommendationRole ownRole;
  final LegionRecommendationConstraints constraints;
  final int maxRounds;
  final double targetWinProbability;
  final int limit;
  final int maxEvaluatedCandidates;
}
