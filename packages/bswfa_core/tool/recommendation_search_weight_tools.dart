import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/distribution/battle_distribution.dart';
import 'package:bswfa_core/battle/distribution/battle_distribution_resolver.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/legion_limits.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_constraints.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_cost_policy.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_role.dart';

typedef ProgressCallback =
    void Function(int completed, int total, String label);

class SearchWeights {
  const SearchWeights({
    required this.genericLeader,
    required this.regularUnit,
    required this.eliteUnit,
    required this.specialEliteUnit,
    required this.surpriseAttack,
    required this.settlementLevel,
  });

  final double genericLeader;
  final double regularUnit;
  final double eliteUnit;
  final double specialEliteUnit;
  final double surpriseAttack;
  final double settlementLevel;

  @override
  String toString() {
    return 'genericLeader=${genericLeader.toStringAsFixed(3)}, '
        'regularUnit=${regularUnit.toStringAsFixed(3)}, '
        'eliteUnit=${eliteUnit.toStringAsFixed(3)}, '
        'specialEliteUnit=${specialEliteUnit.toStringAsFixed(3)}, '
        'surpriseAttack=${surpriseAttack.toStringAsFixed(3)}, '
        'settlementLevel=${settlementLevel.toStringAsFixed(3)}';
  }
}

class SearchSpaceProfile {
  const SearchSpaceProfile({
    required this.minGenericLeader,
    required this.maxGenericLeader,
    required this.minEliteUnit,
    required this.maxEliteUnit,
    required this.minSpecialEliteUnit,
    required this.maxSpecialEliteUnit,
    required this.minSurpriseAttack,
    required this.maxSurpriseAttack,
    required this.minSettlementLevel,
    required this.maxSettlementLevel,
    required this.minSpecialOverEliteGap,
  });

  static const SearchSpaceProfile wide = SearchSpaceProfile(
    minGenericLeader: 0.15,
    maxGenericLeader: 1.00,
    minEliteUnit: 1.10,
    maxEliteUnit: 2.10,
    minSpecialEliteUnit: 1.70,
    maxSpecialEliteUnit: 3.80,
    minSurpriseAttack: 0.00,
    maxSurpriseAttack: 0.95,
    minSettlementLevel: 0.40,
    maxSettlementLevel: 2.40,
    minSpecialOverEliteGap: 0.25,
  );

  static const SearchSpaceProfile plausible = SearchSpaceProfile(
    minGenericLeader: 0.25,
    maxGenericLeader: 0.95,
    minEliteUnit: 1.35,
    maxEliteUnit: 2.10,
    minSpecialEliteUnit: 2.20,
    maxSpecialEliteUnit: 3.90,
    minSurpriseAttack: 0.08,
    maxSurpriseAttack: 0.60,
    minSettlementLevel: 0.80,
    maxSettlementLevel: 2.30,
    minSpecialOverEliteGap: 0.55,
  );

  static const SearchSpaceProfile refined = SearchSpaceProfile(
    minGenericLeader: 0.20,
    maxGenericLeader: 0.40,
    minEliteUnit: 1.30,
    maxEliteUnit: 1.55,
    minSpecialEliteUnit: 2.05,
    maxSpecialEliteUnit: 2.40,
    minSurpriseAttack: 0.08,
    maxSurpriseAttack: 0.22,
    minSettlementLevel: 2.15,
    maxSettlementLevel: 2.40,
    minSpecialOverEliteGap: 0.55,
  );

  static const SearchSpaceProfile specialHeavy = SearchSpaceProfile(
    minGenericLeader: 0.20,
    maxGenericLeader: 0.45,
    minEliteUnit: 1.30,
    maxEliteUnit: 1.60,
    minSpecialEliteUnit: 2.30,
    maxSpecialEliteUnit: 2.80,
    minSurpriseAttack: 0.08,
    maxSurpriseAttack: 0.25,
    minSettlementLevel: 2.10,
    maxSettlementLevel: 2.45,
    minSpecialOverEliteGap: 0.75,
  );

  final double minGenericLeader;
  final double maxGenericLeader;
  final double minEliteUnit;
  final double maxEliteUnit;
  final double minSpecialEliteUnit;
  final double maxSpecialEliteUnit;
  final double minSurpriseAttack;
  final double maxSurpriseAttack;
  final double minSettlementLevel;
  final double maxSettlementLevel;
  final double minSpecialOverEliteGap;

  SearchWeights sample(math.Random random) {
    final double genericLeader = _sampleRange(
      random,
      minGenericLeader,
      maxGenericLeader,
    );
    final double eliteUnit = _sampleRange(random, minEliteUnit, maxEliteUnit);
    final double specialMin = math.max(
      minSpecialEliteUnit,
      eliteUnit + minSpecialOverEliteGap,
    );
    final double specialEliteUnit = _sampleRange(
      random,
      specialMin,
      math.max(specialMin, maxSpecialEliteUnit),
    );
    final double surpriseUpper = math.min(maxSurpriseAttack, genericLeader);
    final double surpriseAttack = _sampleRange(
      random,
      math.min(minSurpriseAttack, surpriseUpper),
      surpriseUpper,
    );
    final double settlementLevel = _sampleRange(
      random,
      minSettlementLevel,
      maxSettlementLevel,
    );

    return SearchWeights(
      genericLeader: _round3(genericLeader),
      regularUnit: 1.0,
      eliteUnit: _round3(eliteUnit),
      specialEliteUnit: _round3(specialEliteUnit),
      surpriseAttack: _round3(surpriseAttack),
      settlementLevel: _round3(settlementLevel),
    );
  }
}

class DatasetEntry {
  const DatasetEntry({
    required this.id,
    required this.split,
    required this.ownRole,
    required this.enemyLegion,
    required this.constraints,
    required this.maxRounds,
    required this.maxEvaluatedCandidates,
  });

  final String id;
  final String split;
  final LegionRecommendationRole ownRole;
  final Legion enemyLegion;
  final LegionRecommendationConstraints constraints;
  final int maxRounds;
  final int maxEvaluatedCandidates;
}

class CandidateStaticData {
  const CandidateStaticData({
    required this.legion,
    required this.cost,
    required this.estimatedStrength,
    required this.baseBattleValue,
  });

  final Legion legion;
  final double cost;
  final double estimatedStrength;
  final double baseBattleValue;
}

class ResolvedCandidateTruth {
  const ResolvedCandidateTruth({
    required this.legion,
    required this.ownWinProbability,
    required this.ownLoseProbability,
    required this.cost,
    required this.resolvedProbability,
  });

  final Legion legion;
  final double ownWinProbability;
  final double ownLoseProbability;
  final double cost;
  final double resolvedProbability;
}

class PreparedDatasetEntry {
  const PreparedDatasetEntry({
    required this.entry,
    required this.candidates,
    required this.oracleRanking,
    required this.oracleTopKLegions,
    required this.oracleTop3Legions,
    required this.bestOracleWinProbability,
  });

  final DatasetEntry entry;
  final List<CandidateStaticData> candidates;
  final List<ResolvedCandidateTruth> oracleRanking;
  final Set<Legion> oracleTopKLegions;
  final List<Legion> oracleTop3Legions;
  final double bestOracleWinProbability;
}

class EntryEvaluation {
  const EntryEvaluation({
    required this.entryId,
    required this.k,
    required this.recallAtK,
    required this.top3Overlap,
    required this.bestWinGap,
  });

  final String entryId;
  final int k;
  final double recallAtK;
  final double top3Overlap;
  final double bestWinGap;
}

class EvaluationSummary {
  const EvaluationSummary({
    required this.averageRecallAtK,
    required this.averageTop3Overlap,
    required this.averageBestWinGap,
    required this.fullTop3Matches,
    required this.entryCount,
  });

  factory EvaluationSummary.fromEvaluations(List<EntryEvaluation> evaluations) {
    final double recallAtK =
        evaluations.fold(
          0.0,
          (double total, EntryEvaluation e) => total + e.recallAtK,
        ) /
        evaluations.length;
    final double top3Overlap =
        evaluations.fold(
          0.0,
          (double total, EntryEvaluation e) => total + e.top3Overlap,
        ) /
        evaluations.length;
    final double bestWinGap =
        evaluations.fold(
          0.0,
          (double total, EntryEvaluation e) => total + e.bestWinGap,
        ) /
        evaluations.length;
    final int fullTop3Matches = evaluations
        .where((EntryEvaluation e) => e.top3Overlap == 1.0)
        .length;

    return EvaluationSummary(
      averageRecallAtK: recallAtK,
      averageTop3Overlap: top3Overlap,
      averageBestWinGap: bestWinGap,
      fullTop3Matches: fullTop3Matches,
      entryCount: evaluations.length,
    );
  }

  final double averageRecallAtK;
  final double averageTop3Overlap;
  final double averageBestWinGap;
  final int fullTop3Matches;
  final int entryCount;

  double get optimizationScore =>
      (averageRecallAtK * 0.7) +
      (averageTop3Overlap * 0.2) -
      (averageBestWinGap * 0.1);
}

class PreparedSearchWeightEvaluator {
  const PreparedSearchWeightEvaluator({required this.searchWeights});

  final SearchWeights searchWeights;

  EntryEvaluation evaluate(PreparedDatasetEntry preparedEntry) {
    final List<CandidateScoredData> preselected = preselectCandidates(
      preparedEntry,
    );
    final Set<Legion> selectedLegions = preselected
        .map((CandidateScoredData candidate) => candidate.legion)
        .toSet();
    final int k = math.min(
      preparedEntry.entry.maxEvaluatedCandidates,
      preparedEntry.oracleRanking.length,
    );
    final int recalledCount = selectedLegions
        .intersection(preparedEntry.oracleTopKLegions)
        .length;
    final List<Legion> selectedTop3 = preselected
        .take(3)
        .map((CandidateScoredData candidate) => candidate.legion)
        .toList(growable: false);
    final int top3Overlap = selectedTop3
        .where(preparedEntry.oracleTop3Legions.contains)
        .length;
    final double bestSelectedWinProbability = preparedEntry.oracleRanking
        .where(
          (ResolvedCandidateTruth candidate) =>
              selectedLegions.contains(candidate.legion),
        )
        .map((ResolvedCandidateTruth candidate) => candidate.ownWinProbability)
        .fold<double>(0, math.max);

    return EntryEvaluation(
      entryId: preparedEntry.entry.id,
      k: k,
      recallAtK: recalledCount / k,
      top3Overlap: top3Overlap / 3,
      bestWinGap:
          preparedEntry.bestOracleWinProbability - bestSelectedWinProbability,
    );
  }

  EvaluationSummary evaluateAll(List<PreparedDatasetEntry> entries) {
    return EvaluationSummary.fromEvaluations(<EntryEvaluation>[
      for (final PreparedDatasetEntry entry in entries) evaluate(entry),
    ]);
  }

  List<CandidateScoredData> preselectCandidates(
    PreparedDatasetEntry preparedEntry,
  ) {
    final double enemyBattleValue = calculateSearchBattleValue(
      preparedEntry.entry.enemyLegion,
    );
    final int maxCandidates = math.min(
      preparedEntry.entry.maxEvaluatedCandidates,
      preparedEntry.candidates.length,
    );
    final List<CandidateScoredData> selected = <CandidateScoredData>[];

    for (final CandidateStaticData candidate in preparedEntry.candidates) {
      final CandidateScoredData scored = CandidateScoredData(
        legion: candidate.legion,
        cost: candidate.cost,
        estimatedStrength: candidate.estimatedStrength,
        battleValue: calculateSearchBattleValue(candidate.legion),
      );
      insertCandidate(
        selected,
        scored,
        maxCandidates: maxCandidates,
        enemyBattleValue: enemyBattleValue,
      );
    }

    return selected;
  }

  void insertCandidate(
    List<CandidateScoredData> selected,
    CandidateScoredData candidate, {
    required int maxCandidates,
    required double enemyBattleValue,
  }) {
    if (selected.isEmpty) {
      selected.add(candidate);
      return;
    }

    if (selected.length == maxCandidates &&
        compareSearchCandidates(candidate, selected.last, enemyBattleValue) >=
            0) {
      return;
    }

    int insertIndex = selected.length;
    for (int index = 0; index < selected.length; index++) {
      if (compareSearchCandidates(
            candidate,
            selected[index],
            enemyBattleValue,
          ) <
          0) {
        insertIndex = index;
        break;
      }
    }

    selected.insert(insertIndex, candidate);
    if (selected.length > maxCandidates) {
      selected.removeLast();
    }
  }

  int compareSearchCandidates(
    CandidateScoredData left,
    CandidateScoredData right,
    double enemyBattleValue,
  ) {
    return compareByFields(<int>[
      compareDoubleAscending(
        (left.battleValue - enemyBattleValue).abs(),
        (right.battleValue - enemyBattleValue).abs(),
      ),
      compareDoubleDescending(left.estimatedStrength, right.estimatedStrength),
      compareDoubleAscending(left.cost, right.cost),
      compareIntAscending(
        left.legion.totalUnits + left.legion.totalLeaders,
        right.legion.totalUnits + right.legion.totalLeaders,
      ),
    ]);
  }

  double calculateSearchBattleValue(Legion legion) {
    return legion.genericLeaders * searchWeights.genericLeader +
        legion.regularUnits * searchWeights.regularUnit +
        legion.eliteUnits * searchWeights.eliteUnit +
        legion.specialEliteUnits * searchWeights.specialEliteUnit +
        legion.map(
          attacking: (AttackingLegion attackingLegion) =>
              attackingLegion.surpriseAttack ? searchWeights.surpriseAttack : 0,
          defending: (DefendingLegion defendingLegion) =>
              defendingLegion.settlementLevel * searchWeights.settlementLevel,
        );
  }
}

class CandidateScoredData {
  const CandidateScoredData({
    required this.legion,
    required this.cost,
    required this.estimatedStrength,
    required this.battleValue,
  });

  final Legion legion;
  final double cost;
  final double estimatedStrength;
  final double battleValue;
}

List<PreparedDatasetEntry> prepareDatasetEntries(
  List<DatasetEntry> entries, {
  ProgressCallback? onProgress,
}) {
  final BattleDistributionResolver resolver =
      const BattleDistributionResolver();
  final List<PreparedDatasetEntry> prepared = <PreparedDatasetEntry>[];
  final int total = entries.length;

  for (int index = 0; index < entries.length; index++) {
    final DatasetEntry entry = entries[index];
    prepared.add(_prepareSingleEntry(entry, resolver));
    onProgress?.call(index + 1, total, entry.id);
  }

  return prepared;
}

PreparedDatasetEntry _prepareSingleEntry(
  DatasetEntry entry,
  BattleDistributionResolver resolver,
) {
  final List<Legion> candidateLegions = buildCandidateLegions(
    entry,
  ).toList(growable: false);
  final List<CandidateStaticData> candidateData = <CandidateStaticData>[
    for (final Legion legion in candidateLegions)
      CandidateStaticData(
        legion: legion,
        cost: LegionRecommendationCostPolicy.calculate(legion),
        estimatedStrength: estimateCandidateStrength(entry.ownRole, legion),
        baseBattleValue: LegionRecommendationCostPolicy.calculateBattleValue(
          legion,
        ),
      ),
  ];
  final List<ResolvedCandidateTruth> oracleRanking = <ResolvedCandidateTruth>[
    for (final Legion legion in candidateLegions)
      resolveCandidateTruth(entry, legion, resolver),
  ]..sort(compareResolvedCandidateTruths);

  final int k = math.min(entry.maxEvaluatedCandidates, oracleRanking.length);
  final Set<Legion> oracleTopKLegions = oracleRanking
      .take(k)
      .map((ResolvedCandidateTruth candidate) => candidate.legion)
      .toSet();
  final List<Legion> oracleTop3Legions = oracleRanking
      .take(3)
      .map((ResolvedCandidateTruth candidate) => candidate.legion)
      .toList(growable: false);

  return PreparedDatasetEntry(
    entry: entry,
    candidates: candidateData,
    oracleRanking: oracleRanking,
    oracleTopKLegions: oracleTopKLegions,
    oracleTop3Legions: oracleTop3Legions,
    bestOracleWinProbability: oracleRanking.first.ownWinProbability,
  );
}

Iterable<Legion> buildCandidateLegions(DatasetEntry entry) sync* {
  final LegionRecommendationConstraints constraints = entry.constraints;
  final int maxRegularUnits = clampMax(
    constraints.maxRegularUnits,
    LegionLimits.maxUnitsPerType,
  );
  final int maxEliteUnits = clampMax(
    constraints.maxEliteUnits,
    LegionLimits.maxUnitsPerType,
  );
  final int maxSpecialEliteUnits = clampMax(
    constraints.maxSpecialEliteUnits,
    LegionLimits.maxUnitsPerType,
  );
  final int maxGenericLeaders = clampMax(
    constraints.maxGenericLeaders,
    LegionLimits.maxLeaders,
  );
  final List<bool> surpriseAttackOptions =
      entry.ownRole == LegionRecommendationRole.attacker &&
          constraints.allowSurpriseAttack
      ? <bool>[false, true]
      : <bool>[false];

  for (int regularUnits = 0; regularUnits <= maxRegularUnits; regularUnits++) {
    for (int eliteUnits = 0; eliteUnits <= maxEliteUnits; eliteUnits++) {
      for (
        int specialEliteUnits = 0;
        specialEliteUnits <= maxSpecialEliteUnits;
        specialEliteUnits++
      ) {
        final int totalUnits = regularUnits + eliteUnits + specialEliteUnits;
        if (totalUnits == 0 || totalUnits > LegionLimits.maxUnitsAndCards) {
          continue;
        }

        for (
          int genericLeaders = 0;
          genericLeaders <= maxGenericLeaders;
          genericLeaders++
        ) {
          for (final bool surpriseAttack in surpriseAttackOptions) {
            yield switch (entry.ownRole) {
              LegionRecommendationRole.attacker => AttackingLegion(
                genericLeaders: genericLeaders,
                regularUnits: regularUnits,
                eliteUnits: eliteUnits,
                specialEliteUnits: specialEliteUnits,
                usedCards: 0,
                surpriseAttack: surpriseAttack,
              ),
              LegionRecommendationRole.defender => DefendingLegion(
                genericLeaders: genericLeaders,
                regularUnits: regularUnits,
                eliteUnits: eliteUnits,
                specialEliteUnits: specialEliteUnits,
                usedCards: 0,
                settlementLevel: clampMax(
                  constraints.settlementLevel,
                  LegionLimits.maxSettlementLevel,
                ),
              ),
            };
          }
        }
      }
    }
  }
}

ResolvedCandidateTruth resolveCandidateTruth(
  DatasetEntry entry,
  Legion legion,
  BattleDistributionResolver resolver,
) {
  final BattleScenario scenario = switch (entry.ownRole) {
    LegionRecommendationRole.attacker => BattleScenario(
      attackingLegion: legion as AttackingLegion,
      defendingLegion: entry.enemyLegion as DefendingLegion,
    ),
    LegionRecommendationRole.defender => BattleScenario(
      attackingLegion: entry.enemyLegion as AttackingLegion,
      defendingLegion: legion as DefendingLegion,
    ),
  };
  final BattleDistribution distribution = resolver.resolve(
    initialScenario: scenario,
    maxRounds: entry.maxRounds,
  );
  final double ownWinProbability =
      entry.ownRole == LegionRecommendationRole.attacker
      ? distribution.attackerWinProbability
      : distribution.defenderWinProbability;
  final double ownLoseProbability =
      entry.ownRole == LegionRecommendationRole.attacker
      ? distribution.defenderWinProbability
      : distribution.attackerWinProbability;

  return ResolvedCandidateTruth(
    legion: legion,
    ownWinProbability: ownWinProbability,
    ownLoseProbability: ownLoseProbability,
    cost: LegionRecommendationCostPolicy.calculate(legion),
    resolvedProbability: distribution.resolvedProbability,
  );
}

double estimateCandidateStrength(
  LegionRecommendationRole ownRole,
  Legion legion,
) {
  final double attackBonus = legion.genericLeaders * 0.35;
  final double defenseBonus = legion.remainingLossCapacity * 0.25;
  final double diceBonus = legion.diceCount * 1.5;
  final double specialEliteBonus = legion.specialEliteUnits * 0.5;
  final double surpriseAttackBonus =
      ownRole == LegionRecommendationRole.attacker &&
          (legion as AttackingLegion).surpriseAttack
      ? 0.2
      : 0;

  return diceBonus +
      attackBonus +
      defenseBonus +
      specialEliteBonus +
      surpriseAttackBonus;
}

List<DatasetEntry> loadDatasetEntries(File datasetFile) {
  final Map<String, Object?> payload =
      jsonDecode(datasetFile.readAsStringSync()) as Map<String, Object?>;
  final List<Object?> rawEntries = payload['entries']! as List<Object?>;

  return <DatasetEntry>[
    for (final Object? rawEntry in rawEntries)
      parseDatasetEntry(rawEntry! as Map<String, Object?>),
  ];
}

DatasetEntry parseDatasetEntry(Map<String, Object?> json) {
  return DatasetEntry(
    id: json['id']! as String,
    split: json['split']! as String,
    ownRole: LegionRecommendationRole.values.byName(json['ownRole']! as String),
    enemyLegion: parseLegion(json['enemyLegion']! as Map<String, Object?>),
    constraints: parseConstraints(json['constraints']! as Map<String, Object?>),
    maxRounds: json['maxRounds']! as int,
    maxEvaluatedCandidates: json['maxEvaluatedCandidates']! as int,
  );
}

Legion parseLegion(Map<String, Object?> json) {
  final String type = json['type']! as String;
  return switch (type) {
    'attacking' => AttackingLegion(
      genericLeaders: json['genericLeaders']! as int,
      regularUnits: json['regularUnits']! as int,
      eliteUnits: json['eliteUnits']! as int,
      specialEliteUnits: json['specialEliteUnits']! as int,
      usedCards: json['usedCards']! as int,
      surpriseAttack: json['surpriseAttack']! as bool,
    ),
    'defending' => DefendingLegion(
      genericLeaders: json['genericLeaders']! as int,
      regularUnits: json['regularUnits']! as int,
      eliteUnits: json['eliteUnits']! as int,
      specialEliteUnits: json['specialEliteUnits']! as int,
      usedCards: json['usedCards']! as int,
      settlementLevel: json['settlementLevel']! as int,
    ),
    _ => throw ArgumentError('Unsupported legion type "$type".'),
  };
}

LegionRecommendationConstraints parseConstraints(Map<String, Object?> json) {
  return LegionRecommendationConstraints(
    maxRegularUnits: json['maxRegularUnits']! as int,
    maxEliteUnits: json['maxEliteUnits']! as int,
    maxSpecialEliteUnits: json['maxSpecialEliteUnits']! as int,
    maxGenericLeaders: json['maxGenericLeaders']! as int,
    allowSurpriseAttack: json['allowSurpriseAttack']! as bool,
    settlementLevel: json['settlementLevel']! as int,
  );
}

int compareResolvedCandidateTruths(
  ResolvedCandidateTruth left,
  ResolvedCandidateTruth right,
) {
  return compareByFields(<int>[
    compareDoubleDescending(left.ownWinProbability, right.ownWinProbability),
    compareDoubleAscending(left.ownLoseProbability, right.ownLoseProbability),
    compareDoubleAscending(left.cost, right.cost),
    compareIntAscending(
      left.legion.totalUnits + left.legion.totalLeaders,
      right.legion.totalUnits + right.legion.totalLeaders,
    ),
    compareDoubleDescending(
      left.resolvedProbability,
      right.resolvedProbability,
    ),
  ]);
}

int compareByFields(List<int> comparisons) {
  for (final int comparison in comparisons) {
    if (comparison != 0) {
      return comparison;
    }
  }
  return 0;
}

int compareDoubleDescending(double left, double right) => right.compareTo(left);

int compareDoubleAscending(double left, double right) => left.compareTo(right);

int compareIntAscending(int left, int right) => left.compareTo(right);

int clampMax(int value, int maxValue) => math.max(0, math.min(value, maxValue));

double sampleRange(math.Random random, double min, double max) {
  return min + (random.nextDouble() * (max - min));
}

double round3(double value) => double.parse(value.toStringAsFixed(3));

double _sampleRange(math.Random random, double min, double max) {
  return sampleRange(random, min, max);
}

double _round3(double value) => round3(value);
