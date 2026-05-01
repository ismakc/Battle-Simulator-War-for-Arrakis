import 'dart:io';
import 'dart:math' as math;

import 'package:bswfa_core/battle/battle_scenario.dart';
import 'package:bswfa_core/battle/distribution/battle_distribution.dart';
import 'package:bswfa_core/battle/distribution/battle_distribution_resolver.dart';
import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/legion_change.dart';
import 'package:bswfa_core/legion/legion_optimal_loss_policy.dart';
import 'package:bswfa_core/legion/legion_resolution.dart';
import 'package:bswfa_core/legion/named_leader.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_role.dart';

import 'recommendation_search_weight_tools.dart';

void main(List<String> args) {
  final _CliOptions options = _CliOptions.parse(args);
  final List<DatasetEntry> entries = loadDatasetEntries(options.datasetFile)
      .where(
        (DatasetEntry entry) =>
            options.split == 'all' || entry.split == options.split,
      )
      .take(options.maxEntries ?? 1 << 30)
      .toList(growable: false);

  stdout.writeln('Loaded ${entries.length} dataset entries');
  stdout.writeln(
    'Evaluating current loss policy against continuation oracle '
    '(candidatesPerEntry=${options.maxCandidatesPerEntry}, '
    'split=${options.split}, includeNamedLeaders=${options.includeNamedLeaders})',
  );

  final Stopwatch stopwatch = Stopwatch()..start();
  final _EvaluationResult result = _evaluateEntries(entries, options);
  stopwatch.stop();

  stdout.writeln('');
  stdout.writeln('Evaluated decision points: ${result.decisionPoints}');
  stdout.writeln(
    'Optimal decisions: ${result.optimalDecisions}/${result.decisionPoints} '
    '(${_formatPercent(result.optimalRate)})',
  );
  stdout.writeln(
    'Average utility gap: ${result.averageUtilityGap.toStringAsFixed(6)}',
  );
  stdout.writeln(
    'Worst utility gap: ${result.worstUtilityGap.toStringAsFixed(6)}',
  );
  stdout.writeln('Attacker decisions: ${result.attackerDecisionPoints}');
  stdout.writeln('Defender decisions: ${result.defenderDecisionPoints}');
  stdout.writeln('Elapsed: ${_formatDuration(stopwatch.elapsed)}');

  if (options.searchTrials > 0) {
    stdout.writeln('');
    _runWeightSearch(result.evaluations, options);
  }
  if (options.fixedWeights != null) {
    stdout.writeln('');
    _printFixedWeightEvaluation(result.evaluations, options.fixedWeights!);
  }

  if (result.worstCases.isNotEmpty) {
    stdout.writeln('');
    stdout.writeln('Worst cases:');
    for (int index = 0; index < result.worstCases.length; index++) {
      final _DecisionEvaluation decision = result.worstCases[index];
      stdout.writeln('Rank ${index + 1}');
      stdout.writeln('  entry: ${decision.entryId}');
      stdout.writeln('  side: ${decision.side.name}');
      stdout.writeln(
        '  current: ${_describeResolution(decision.current.resolution)}',
      );
      stdout.writeln(
        '    utility=${decision.current.utility.toStringAsFixed(6)} '
        'ownWin=${decision.current.ownWinProbability.toStringAsFixed(4)} '
        'ownLose=${decision.current.ownLoseProbability.toStringAsFixed(4)}',
      );
      stdout.writeln(
        '  oracle: ${_describeResolution(decision.oracle.resolution)}',
      );
      stdout.writeln(
        '    utility=${decision.oracle.utility.toStringAsFixed(6)} '
        'ownWin=${decision.oracle.ownWinProbability.toStringAsFixed(4)} '
        'ownLose=${decision.oracle.ownLoseProbability.toStringAsFixed(4)}',
      );
      stdout.writeln('  gap: ${decision.utilityGap.toStringAsFixed(6)}');
      stdout.writeln(
        '  attacker: ${_describeLegion(decision.scenario.attackingLegion)}',
      );
      stdout.writeln(
        '  defender: ${_describeLegion(decision.scenario.defendingLegion)}',
      );
    }
  }

  stdout.writeln('');
  stdout.writeln('FINAL_RESULT_START');
  stdout.writeln('decision_points: ${result.decisionPoints}');
  stdout.writeln('optimal_rate: ${result.optimalRate.toStringAsFixed(4)}');
  stdout.writeln(
    'average_utility_gap: ${result.averageUtilityGap.toStringAsFixed(6)}',
  );
  stdout.writeln(
    'worst_utility_gap: ${result.worstUtilityGap.toStringAsFixed(6)}',
  );
  stdout.writeln('attacker_decision_points: ${result.attackerDecisionPoints}');
  stdout.writeln('defender_decision_points: ${result.defenderDecisionPoints}');
  stdout.writeln('FINAL_RESULT_END');
}

void _runWeightSearch(
  List<_DecisionEvaluation> evaluations,
  _CliOptions options,
) {
  final Stopwatch stopwatch = Stopwatch()..start();
  final math.Random random = math.Random(options.seed);
  _WeightedPolicyEvaluation? best;

  stdout.writeln(
    'Searching loss-policy weights '
    '(trials=${options.searchTrials}, seed=${options.seed})',
  );

  for (int trial = 1; trial <= options.searchTrials; trial++) {
    final _LossPolicyWeights weights = _LossPolicyWeights.sample(random);
    final _WeightedPolicyEvaluation evaluation = _evaluateWeights(
      evaluations,
      weights,
    );

    if (best == null || evaluation.score > best.score) {
      best = evaluation;
    }

    if (options.searchProgressEvery > 0 &&
        (trial % options.searchProgressEvery == 0 ||
            trial == options.searchTrials)) {
      stdout.writeln(
        '[SEARCH] $trial/${options.searchTrials} '
        'bestScore=${best.score.toStringAsFixed(6)} '
        'optimalRate=${_formatPercent(best.optimalRate)} '
        'avgGap=${best.averageUtilityGap.toStringAsFixed(6)}',
      );
    }
  }

  stopwatch.stop();
  final _WeightedPolicyEvaluation selected = best!;
  stdout.writeln('');
  stdout.writeln('Best loss-policy weights: ${selected.weights}');
  stdout.writeln('Score: ${selected.score.toStringAsFixed(6)}');
  stdout.writeln('Optimal rate: ${_formatPercent(selected.optimalRate)}');
  stdout.writeln(
    'Average utility gap: ${selected.averageUtilityGap.toStringAsFixed(6)}',
  );
  stdout.writeln(
    'Worst utility gap: ${selected.worstUtilityGap.toStringAsFixed(6)}',
  );
  stdout.writeln('Search elapsed: ${_formatDuration(stopwatch.elapsed)}');

  stdout.writeln('');
  stdout.writeln('WEIGHT_SEARCH_RESULT_START');
  stdout.writeln('weights: ${selected.weights}');
  stdout.writeln('weights_cli: ${selected.weights.cliValue}');
  stdout.writeln('score: ${selected.score.toStringAsFixed(6)}');
  stdout.writeln('optimal_rate: ${selected.optimalRate.toStringAsFixed(4)}');
  stdout.writeln(
    'average_utility_gap: ${selected.averageUtilityGap.toStringAsFixed(6)}',
  );
  stdout.writeln(
    'worst_utility_gap: ${selected.worstUtilityGap.toStringAsFixed(6)}',
  );
  stdout.writeln('WEIGHT_SEARCH_RESULT_END');
}

void _printFixedWeightEvaluation(
  List<_DecisionEvaluation> evaluations,
  _LossPolicyWeights weights,
) {
  final _WeightedPolicyEvaluation evaluation = _evaluateWeights(
    evaluations,
    weights,
  );

  stdout.writeln('Fixed loss-policy weights: ${evaluation.weights}');
  stdout.writeln('Score: ${evaluation.score.toStringAsFixed(6)}');
  stdout.writeln('Optimal rate: ${_formatPercent(evaluation.optimalRate)}');
  stdout.writeln(
    'Average utility gap: ${evaluation.averageUtilityGap.toStringAsFixed(6)}',
  );
  stdout.writeln(
    'Worst utility gap: ${evaluation.worstUtilityGap.toStringAsFixed(6)}',
  );

  stdout.writeln('');
  stdout.writeln('FIXED_WEIGHT_RESULT_START');
  stdout.writeln('weights: ${evaluation.weights}');
  stdout.writeln('weights_cli: ${evaluation.weights.cliValue}');
  stdout.writeln('score: ${evaluation.score.toStringAsFixed(6)}');
  stdout.writeln('optimal_rate: ${evaluation.optimalRate.toStringAsFixed(4)}');
  stdout.writeln(
    'average_utility_gap: ${evaluation.averageUtilityGap.toStringAsFixed(6)}',
  );
  stdout.writeln(
    'worst_utility_gap: ${evaluation.worstUtilityGap.toStringAsFixed(6)}',
  );
  stdout.writeln('FIXED_WEIGHT_RESULT_END');
}

_WeightedPolicyEvaluation _evaluateWeights(
  List<_DecisionEvaluation> evaluations,
  _LossPolicyWeights weights,
) {
  int optimalDecisions = 0;
  double totalUtilityGap = 0;
  double worstUtilityGap = 0;

  for (final _DecisionEvaluation evaluation in evaluations) {
    final _LossOutcome selected = _selectWeightedOutcome(evaluation, weights);
    final double utilityGap = math.max(
      0,
      evaluation.oracle.utility - selected.utility,
    );
    if (utilityGap <= 1e-9) {
      optimalDecisions++;
    }
    totalUtilityGap += utilityGap;
    worstUtilityGap = math.max(worstUtilityGap, utilityGap);
  }

  final int decisionPoints = evaluations.length;
  final double optimalRate = decisionPoints == 0
      ? 0
      : optimalDecisions / decisionPoints;
  final double averageUtilityGap = decisionPoints == 0
      ? 0
      : totalUtilityGap / decisionPoints;

  return _WeightedPolicyEvaluation(
    weights: weights,
    optimalRate: optimalRate,
    averageUtilityGap: averageUtilityGap,
    worstUtilityGap: worstUtilityGap,
  );
}

_LossOutcome _selectWeightedOutcome(
  _DecisionEvaluation evaluation,
  _LossPolicyWeights weights,
) {
  _LossOutcome? selected;
  double? selectedScore;

  for (final _LossOutcome outcome in evaluation.legalOutcomes) {
    final double score = weights.score(outcome.resultingLegion);
    if (selected == null ||
        score > selectedScore! ||
        (score == selectedScore &&
            _shouldPreferForStableTieBreak(
              outcome.resolution,
              selected.resolution,
              weights,
            ))) {
      selected = outcome;
      selectedScore = score;
    }
  }

  return selected!;
}

_EvaluationResult _evaluateEntries(
  List<DatasetEntry> entries,
  _CliOptions options,
) {
  final BattleDistributionResolver resolver =
      const BattleDistributionResolver();
  final List<_DecisionEvaluation> evaluations = <_DecisionEvaluation>[];
  final int total = entries.length;

  for (int entryIndex = 0; entryIndex < entries.length; entryIndex++) {
    final DatasetEntry entry = entries[entryIndex];
    final List<Legion> candidates = _selectCandidates(
      buildCandidateLegions(entry).toList(growable: false),
      options.maxCandidatesPerEntry,
    );

    for (final Legion candidate in candidates) {
      final BattleScenario scenario = _buildScenario(entry, candidate);
      for (final BattleScenario variant in _scenarioVariants(
        scenario,
        includeNamedLeaders: options.includeNamedLeaders,
      )) {
        _addEvaluation(
          evaluations,
          entry: entry,
          scenario: variant,
          side: _BattleSide.attacker,
          resolver: resolver,
          maxRounds: options.maxRoundsAfterLoss ?? entry.maxRounds,
        );
        _addEvaluation(
          evaluations,
          entry: entry,
          scenario: variant,
          side: _BattleSide.defender,
          resolver: resolver,
          maxRounds: options.maxRoundsAfterLoss ?? entry.maxRounds,
        );
      }
    }

    if (options.progressEvery > 0 &&
        ((entryIndex + 1) % options.progressEvery == 0 ||
            entryIndex + 1 == total)) {
      stdout.writeln(
        '[PROGRESS] ${entryIndex + 1}/$total entries, '
        '${evaluations.length} decision points',
      );
    }
  }

  evaluations.sort(
    (_DecisionEvaluation left, _DecisionEvaluation right) =>
        right.utilityGap.compareTo(left.utilityGap),
  );

  return _EvaluationResult.fromEvaluations(
    evaluations,
    worstCaseLimit: options.worstCases,
  );
}

void _addEvaluation(
  List<_DecisionEvaluation> evaluations, {
  required DatasetEntry entry,
  required BattleScenario scenario,
  required _BattleSide side,
  required BattleDistributionResolver resolver,
  required int maxRounds,
}) {
  final Legion losingLegion = _legionForSide(scenario, side);
  if (losingLegion.remainingLossCapacity == 0) {
    return;
  }

  final List<LegionResolution> legalResolutions = _legalSingleLosses(
    losingLegion,
  );
  if (legalResolutions.length < 2) {
    return;
  }

  final List<_LossOutcome> outcomes = <_LossOutcome>[
    for (final LegionResolution resolution in legalResolutions)
      _evaluateResolution(
        scenario: scenario,
        side: side,
        resolution: resolution,
        resolver: resolver,
        maxRounds: maxRounds,
      ),
  ];
  final List<_LossOutcome> oracleOutcomes = <_LossOutcome>[...outcomes]
    ..sort(_compareLossOutcomes);

  final LegionResolution currentResolution =
      LegionOptimalLossPolicy.selectOptimalLoss(losingLegion);
  final Legion currentLegion = currentResolution.applyTo(losingLegion);
  final _LossOutcome currentOutcome = outcomes.firstWhere(
    (_LossOutcome outcome) => outcome.resultingLegion == currentLegion,
    orElse: () => _evaluateResolution(
      scenario: scenario,
      side: side,
      resolution: currentResolution,
      resolver: resolver,
      maxRounds: maxRounds,
    ),
  );
  final _LossOutcome oracleOutcome = oracleOutcomes.first;

  evaluations.add(
    _DecisionEvaluation(
      entryId: entry.id,
      side: side,
      scenario: scenario,
      legalOutcomes: outcomes,
      current: currentOutcome,
      oracle: oracleOutcome,
    ),
  );
}

_LossOutcome _evaluateResolution({
  required BattleScenario scenario,
  required _BattleSide side,
  required LegionResolution resolution,
  required BattleDistributionResolver resolver,
  required int maxRounds,
}) {
  final Legion resultingLegion = resolution.applyTo(
    _legionForSide(scenario, side),
  );
  final BattleScenario nextScenario = _replaceLegion(
    scenario,
    side,
    resultingLegion,
  );
  final BattleDistribution distribution = resolver.resolve(
    initialScenario: nextScenario,
    maxRounds: maxRounds,
  );
  final double ownWinProbability = side == _BattleSide.attacker
      ? distribution.attackerWinProbability
      : distribution.defenderWinProbability;
  final double ownLoseProbability = side == _BattleSide.attacker
      ? distribution.defenderWinProbability
      : distribution.attackerWinProbability;

  return _LossOutcome(
    resolution: resolution,
    resultingLegion: resultingLegion,
    ownWinProbability: ownWinProbability,
    ownLoseProbability: ownLoseProbability,
    resolvedProbability: distribution.resolvedProbability,
  );
}

List<LegionResolution> _legalSingleLosses(Legion legion) {
  return <LegionResolution>[
    if (legion.genericLeaders > 0)
      const LegionResolution(
        appliedChanges: <LegionChange>[LegionChange.removeGenericLeader()],
      ),
    if (legion.regularUnits > 0)
      const LegionResolution(
        appliedChanges: <LegionChange>[LegionChange.removeRegularUnit()],
      ),
    if (legion.eliteUnits > 0)
      const LegionResolution(
        appliedChanges: <LegionChange>[LegionChange.downgradeEliteUnit()],
      ),
    if (legion.specialEliteUnits > 0)
      const LegionResolution(
        appliedChanges: <LegionChange>[
          LegionChange.downgradeSpecialEliteUnit(),
        ],
      ),
    for (final NamedLeader leader in legion.namedLeaders)
      LegionResolution(
        appliedChanges: <LegionChange>[
          LegionChange.removeNamedLeader(leader: leader),
        ],
      ),
  ];
}

int _compareLossOutcomes(_LossOutcome left, _LossOutcome right) {
  return compareByFields(<int>[
    compareDoubleDescending(left.utility, right.utility),
    compareDoubleDescending(left.ownWinProbability, right.ownWinProbability),
    compareDoubleAscending(left.ownLoseProbability, right.ownLoseProbability),
    compareDoubleDescending(
      left.resolvedProbability,
      right.resolvedProbability,
    ),
  ]);
}

BattleScenario _buildScenario(DatasetEntry entry, Legion candidate) {
  return switch (entry.ownRole) {
    LegionRecommendationRole.attacker => BattleScenario(
      attackingLegion: candidate as AttackingLegion,
      defendingLegion: entry.enemyLegion as DefendingLegion,
    ),
    LegionRecommendationRole.defender => BattleScenario(
      attackingLegion: entry.enemyLegion as AttackingLegion,
      defendingLegion: candidate as DefendingLegion,
    ),
  };
}

Iterable<BattleScenario> _scenarioVariants(
  BattleScenario scenario, {
  required bool includeNamedLeaders,
}) sync* {
  yield scenario;

  if (!includeNamedLeaders) {
    return;
  }

  yield scenario.copyWith(
    attackingLegion: scenario.attackingLegion.copyWith(
      namedLeaders: const <NamedLeader>[NamedLeader.leader1_1],
    ),
  );
  yield scenario.copyWith(
    defendingLegion: scenario.defendingLegion.copyWith(
      namedLeaders: const <NamedLeader>[NamedLeader.leader0_2],
    ),
  );
  yield scenario.copyWith(
    attackingLegion: scenario.attackingLegion.copyWith(
      namedLeaders: const <NamedLeader>[
        NamedLeader.leader2_0,
        NamedLeader.leader0_1,
      ],
    ),
    defendingLegion: scenario.defendingLegion.copyWith(
      namedLeaders: const <NamedLeader>[
        NamedLeader.leader1_1,
        NamedLeader.leader0_2,
      ],
    ),
  );
}

List<Legion> _selectCandidates(List<Legion> candidates, int limit) {
  if (candidates.length <= limit) {
    return candidates;
  }
  if (limit <= 1) {
    return <Legion>[candidates.first];
  }

  final List<Legion> selected = <Legion>[];
  final Set<int> selectedIndexes = <int>{};
  for (int index = 0; index < limit; index++) {
    final int candidateIndex = ((candidates.length - 1) * index / (limit - 1))
        .round();
    if (selectedIndexes.add(candidateIndex)) {
      selected.add(candidates[candidateIndex]);
    }
  }
  return selected;
}

Legion _legionForSide(BattleScenario scenario, _BattleSide side) {
  return switch (side) {
    _BattleSide.attacker => scenario.attackingLegion,
    _BattleSide.defender => scenario.defendingLegion,
  };
}

BattleScenario _replaceLegion(
  BattleScenario scenario,
  _BattleSide side,
  Legion legion,
) {
  return switch (side) {
    _BattleSide.attacker => scenario.copyWith(
      attackingLegion: legion as AttackingLegion,
    ),
    _BattleSide.defender => scenario.copyWith(
      defendingLegion: legion as DefendingLegion,
    ),
  };
}

String _describeResolution(LegionResolution resolution) {
  return resolution.appliedChanges.map(_describeChange).join(', ');
}

bool _shouldPreferForStableTieBreak(
  LegionResolution candidate,
  LegionResolution selected,
  _LossPolicyWeights weights,
) {
  final int candidatePriority = _resolutionPriority(candidate);
  final int selectedPriority = _resolutionPriority(selected);
  if (candidatePriority != selectedPriority) {
    return candidatePriority < selectedPriority;
  }

  return _resolutionLossWeight(candidate, weights) <
      _resolutionLossWeight(selected, weights);
}

int _resolutionPriority(LegionResolution resolution) {
  if (resolution.appliedChanges.isEmpty) {
    return 5;
  }

  return resolution.appliedChanges.first.map(
    removeGenericLeader: (_) => 0,
    removeRegularUnit: (_) => 1,
    downgradeEliteUnit: (_) => 2,
    downgradeSpecialEliteUnit: (_) => 3,
    removeNamedLeader: (_) => 4,
  );
}

double _resolutionLossWeight(
  LegionResolution resolution,
  _LossPolicyWeights weights,
) {
  if (resolution.appliedChanges.isEmpty) {
    return double.infinity;
  }

  return resolution.appliedChanges.first.map(
    removeGenericLeader: (_) => weights.genericLeader,
    removeRegularUnit: (_) => weights.regularUnit,
    downgradeEliteUnit: (_) => weights.eliteUnit - weights.regularUnit,
    downgradeSpecialEliteUnit: (_) =>
        weights.specialEliteUnit - weights.regularUnit,
    removeNamedLeader: (RemoveNamedLeader change) =>
        (change.leader.attack * weights.namedLeaderAttack) +
        (change.leader.defense * weights.namedLeaderDefense),
  );
}

String _describeChange(LegionChange change) {
  return change.map(
    removeGenericLeader: (_) => 'removeGenericLeader',
    removeRegularUnit: (_) => 'removeRegularUnit',
    downgradeEliteUnit: (_) => 'downgradeEliteUnit',
    downgradeSpecialEliteUnit: (_) => 'downgradeSpecialEliteUnit',
    removeNamedLeader: (RemoveNamedLeader change) =>
        'removeNamedLeader(${change.leader.combatProfile})',
  );
}

String _describeLegion(Legion legion) {
  return 'regular=${legion.regularUnits}, elite=${legion.eliteUnits}, '
      'special=${legion.specialEliteUnits}, generic=${legion.genericLeaders}, '
      'named=[${legion.namedLeaders.map((NamedLeader l) => l.combatProfile).join(',')}], '
      'dice=${legion.diceCount}, lossCapacity=${legion.remainingLossCapacity}';
}

String _formatPercent(double value) => '${(value * 100).toStringAsFixed(2)}%';

String _formatDuration(Duration duration) {
  String twoDigits(int value) => value.toString().padLeft(2, '0');
  final int hours = duration.inHours;
  final int minutes = duration.inMinutes.remainder(60);
  final int seconds = duration.inSeconds.remainder(60);
  return '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}';
}

enum _BattleSide { attacker, defender }

class _LossOutcome {
  const _LossOutcome({
    required this.resolution,
    required this.resultingLegion,
    required this.ownWinProbability,
    required this.ownLoseProbability,
    required this.resolvedProbability,
  });

  final LegionResolution resolution;
  final Legion resultingLegion;
  final double ownWinProbability;
  final double ownLoseProbability;
  final double resolvedProbability;

  double get utility => ownWinProbability - ownLoseProbability;
}

class _DecisionEvaluation {
  const _DecisionEvaluation({
    required this.entryId,
    required this.side,
    required this.scenario,
    required this.legalOutcomes,
    required this.current,
    required this.oracle,
  });

  final String entryId;
  final _BattleSide side;
  final BattleScenario scenario;
  final List<_LossOutcome> legalOutcomes;
  final _LossOutcome current;
  final _LossOutcome oracle;

  double get utilityGap => math.max(0, oracle.utility - current.utility);

  bool get isOptimal => utilityGap <= 1e-9;
}

class _EvaluationResult {
  const _EvaluationResult({
    required this.evaluations,
    required this.decisionPoints,
    required this.optimalDecisions,
    required this.attackerDecisionPoints,
    required this.defenderDecisionPoints,
    required this.averageUtilityGap,
    required this.worstUtilityGap,
    required this.worstCases,
  });

  factory _EvaluationResult.fromEvaluations(
    List<_DecisionEvaluation> evaluations, {
    required int worstCaseLimit,
  }) {
    final int decisionPoints = evaluations.length;
    final int optimalDecisions = evaluations
        .where((_DecisionEvaluation evaluation) => evaluation.isOptimal)
        .length;
    final double totalUtilityGap = evaluations.fold(
      0,
      (double total, _DecisionEvaluation evaluation) =>
          total + evaluation.utilityGap,
    );

    return _EvaluationResult(
      evaluations: evaluations,
      decisionPoints: decisionPoints,
      optimalDecisions: optimalDecisions,
      attackerDecisionPoints: evaluations
          .where(
            (_DecisionEvaluation evaluation) =>
                evaluation.side == _BattleSide.attacker,
          )
          .length,
      defenderDecisionPoints: evaluations
          .where(
            (_DecisionEvaluation evaluation) =>
                evaluation.side == _BattleSide.defender,
          )
          .length,
      averageUtilityGap: decisionPoints == 0
          ? 0
          : totalUtilityGap / decisionPoints,
      worstUtilityGap: evaluations.isEmpty ? 0 : evaluations.first.utilityGap,
      worstCases: evaluations.take(worstCaseLimit).toList(growable: false),
    );
  }

  final List<_DecisionEvaluation> evaluations;
  final int decisionPoints;
  final int optimalDecisions;
  final int attackerDecisionPoints;
  final int defenderDecisionPoints;
  final double averageUtilityGap;
  final double worstUtilityGap;
  final List<_DecisionEvaluation> worstCases;

  double get optimalRate =>
      decisionPoints == 0 ? 0 : optimalDecisions / decisionPoints;
}

class _LossPolicyWeights {
  const _LossPolicyWeights({
    required this.genericLeader,
    required this.regularUnit,
    required this.eliteUnit,
    required this.specialEliteUnit,
    required this.namedLeaderAttack,
    required this.namedLeaderDefense,
    required this.diceCount,
    required this.lossCapacity,
  });

  factory _LossPolicyWeights.sample(math.Random random) {
    return _LossPolicyWeights(
      genericLeader: round3(sampleRange(random, 0.05, 1.20)),
      regularUnit: 1.0,
      eliteUnit: round3(sampleRange(random, 1.05, 2.60)),
      specialEliteUnit: round3(sampleRange(random, 1.40, 3.80)),
      namedLeaderAttack: round3(sampleRange(random, 0.05, 1.40)),
      namedLeaderDefense: round3(sampleRange(random, 0.05, 1.80)),
      diceCount: round3(sampleRange(random, 0.00, 2.50)),
      lossCapacity: round3(sampleRange(random, 0.00, 0.60)),
    );
  }

  factory _LossPolicyWeights.parse(String value) {
    final List<double> parts = value
        .split(',')
        .map((String part) => double.parse(part.trim()))
        .toList(growable: false);
    if (parts.length != 8) {
      throw ArgumentError(
        '--weights expects 8 comma-separated values: '
        'generic,regular,elite,special,namedAttack,namedDefense,dice,lossCapacity.',
      );
    }

    return _LossPolicyWeights(
      genericLeader: parts[0],
      regularUnit: parts[1],
      eliteUnit: parts[2],
      specialEliteUnit: parts[3],
      namedLeaderAttack: parts[4],
      namedLeaderDefense: parts[5],
      diceCount: parts[6],
      lossCapacity: parts[7],
    );
  }

  String get cliValue => <double>[
    genericLeader,
    regularUnit,
    eliteUnit,
    specialEliteUnit,
    namedLeaderAttack,
    namedLeaderDefense,
    diceCount,
    lossCapacity,
  ].map((double value) => value.toStringAsFixed(3)).join(',');

  final double genericLeader;
  final double regularUnit;
  final double eliteUnit;
  final double specialEliteUnit;
  final double namedLeaderAttack;
  final double namedLeaderDefense;
  final double diceCount;
  final double lossCapacity;

  double score(Legion legion) {
    if (legion.totalUnits == 0) {
      return 0;
    }

    final int namedAttack = legion.namedLeaders.fold(
      0,
      (int total, NamedLeader leader) => total + leader.attack,
    );
    final int namedDefense = legion.namedLeaders.fold(
      0,
      (int total, NamedLeader leader) => total + leader.defense,
    );

    return legion.genericLeaders * genericLeader +
        legion.regularUnits * regularUnit +
        legion.eliteUnits * eliteUnit +
        legion.specialEliteUnits * specialEliteUnit +
        namedAttack * namedLeaderAttack +
        namedDefense * namedLeaderDefense +
        legion.diceCount * diceCount +
        legion.remainingLossCapacity * lossCapacity;
  }

  @override
  String toString() {
    return 'genericLeader=${genericLeader.toStringAsFixed(3)}, '
        'regularUnit=${regularUnit.toStringAsFixed(3)}, '
        'eliteUnit=${eliteUnit.toStringAsFixed(3)}, '
        'specialEliteUnit=${specialEliteUnit.toStringAsFixed(3)}, '
        'namedLeaderAttack=${namedLeaderAttack.toStringAsFixed(3)}, '
        'namedLeaderDefense=${namedLeaderDefense.toStringAsFixed(3)}, '
        'diceCount=${diceCount.toStringAsFixed(3)}, '
        'lossCapacity=${lossCapacity.toStringAsFixed(3)}';
  }
}

class _WeightedPolicyEvaluation {
  const _WeightedPolicyEvaluation({
    required this.weights,
    required this.optimalRate,
    required this.averageUtilityGap,
    required this.worstUtilityGap,
  });

  final _LossPolicyWeights weights;
  final double optimalRate;
  final double averageUtilityGap;
  final double worstUtilityGap;

  double get score =>
      (optimalRate * 0.75) -
      (averageUtilityGap * 0.20) -
      (worstUtilityGap * 0.05);
}

class _CliOptions {
  const _CliOptions({
    required this.datasetFile,
    required this.split,
    required this.maxEntries,
    required this.maxCandidatesPerEntry,
    required this.maxRoundsAfterLoss,
    required this.includeNamedLeaders,
    required this.worstCases,
    required this.progressEvery,
    required this.searchTrials,
    required this.seed,
    required this.searchProgressEvery,
    required this.fixedWeights,
  });

  factory _CliOptions.parse(List<String> args) {
    File datasetFile = File('tool/recommendation_weight_dataset.json');
    String split = 'all';
    int? maxEntries;
    int maxCandidatesPerEntry = 24;
    int? maxRoundsAfterLoss;
    bool includeNamedLeaders = true;
    int worstCases = 10;
    int progressEvery = 10;
    int searchTrials = 0;
    int seed = 42;
    int searchProgressEvery = 1000;
    _LossPolicyWeights? fixedWeights;

    for (final String arg in args) {
      if (arg.startsWith('--dataset=')) {
        datasetFile = File(arg.substring('--dataset='.length));
      } else if (arg.startsWith('--split=')) {
        split = arg.substring('--split='.length);
      } else if (arg.startsWith('--max-entries=')) {
        maxEntries = int.parse(arg.substring('--max-entries='.length));
      } else if (arg.startsWith('--max-candidates-per-entry=')) {
        maxCandidatesPerEntry = int.parse(
          arg.substring('--max-candidates-per-entry='.length),
        );
      } else if (arg.startsWith('--max-rounds-after-loss=')) {
        maxRoundsAfterLoss = int.parse(
          arg.substring('--max-rounds-after-loss='.length),
        );
      } else if (arg == '--no-named-leaders') {
        includeNamedLeaders = false;
      } else if (arg.startsWith('--worst=')) {
        worstCases = int.parse(arg.substring('--worst='.length));
      } else if (arg.startsWith('--progress-every=')) {
        progressEvery = int.parse(arg.substring('--progress-every='.length));
      } else if (arg.startsWith('--search-trials=')) {
        searchTrials = int.parse(arg.substring('--search-trials='.length));
      } else if (arg.startsWith('--seed=')) {
        seed = int.parse(arg.substring('--seed='.length));
      } else if (arg.startsWith('--search-progress-every=')) {
        searchProgressEvery = int.parse(
          arg.substring('--search-progress-every='.length),
        );
      } else if (arg.startsWith('--weights=')) {
        fixedWeights = _LossPolicyWeights.parse(
          arg.substring('--weights='.length),
        );
      } else {
        throw ArgumentError('Unsupported argument "$arg".');
      }
    }

    return _CliOptions(
      datasetFile: datasetFile,
      split: split,
      maxEntries: maxEntries,
      maxCandidatesPerEntry: maxCandidatesPerEntry,
      maxRoundsAfterLoss: maxRoundsAfterLoss,
      includeNamedLeaders: includeNamedLeaders,
      worstCases: worstCases,
      progressEvery: progressEvery,
      searchTrials: searchTrials,
      seed: seed,
      searchProgressEvery: searchProgressEvery,
      fixedWeights: fixedWeights,
    );
  }

  final File datasetFile;
  final String split;
  final int? maxEntries;
  final int maxCandidatesPerEntry;
  final int? maxRoundsAfterLoss;
  final bool includeNamedLeaders;
  final int worstCases;
  final int progressEvery;
  final int searchTrials;
  final int seed;
  final int searchProgressEvery;
  final _LossPolicyWeights? fixedWeights;
}
