import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/legion_limits.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_constraints.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_request.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_resolver.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_role.dart';

void main(List<String> args) {
  final BenchmarkOptions options = BenchmarkOptions.parse(args);
  final List<BenchmarkScenario> scenarios = _buildScenarios();
  const LegionRecommendationResolver resolver = LegionRecommendationResolver();

  print('Recommendation UI scenario benchmark');
  print(
    'runs=${options.runs}, warmups=${options.warmups}, '
    'limits=${options.maxEvaluatedCandidates.join(',')}',
  );
  print('');

  for (final BenchmarkScenario scenario in scenarios) {
    print('Scenario: ${scenario.name}');
    print('  role=${scenario.ownRole.name}');
    print('  enemy=${_describeLegion(scenario.enemyLegion)}');
    print(
      '  context=allowSurpriseAttack:${scenario.allowSurpriseAttack}, '
      'settlementLevel:${scenario.settlementLevel}',
    );

    for (final int maxEvaluatedCandidates
        in options.maxEvaluatedCandidates) {
      final LegionRecommendationRequest request = scenario.toRequest(
        maxEvaluatedCandidates: maxEvaluatedCandidates,
      );

      for (int i = 0; i < options.warmups; i++) {
        resolver.resolve(request);
      }

      final List<int> elapsedMicros = <int>[];
      List<LegionRecommendation> lastRecommendations =
          const <LegionRecommendation>[];

      for (int i = 0; i < options.runs; i++) {
        final Stopwatch stopwatch = Stopwatch()..start();
        lastRecommendations = resolver.resolve(request);
        stopwatch.stop();
        elapsedMicros.add(stopwatch.elapsedMicroseconds);
      }

      elapsedMicros.sort();
      final double medianMs = _median(elapsedMicros) / 1000;
      final double averageMs =
          elapsedMicros.reduce((int a, int b) => a + b) /
          elapsedMicros.length /
          1000;
      final double minMs = elapsedMicros.first / 1000;
      final double maxMs = elapsedMicros.last / 1000;
      final LegionRecommendation? best = lastRecommendations.firstOrNull;

      print(
        '  candidates=$maxEvaluatedCandidates '
        'median=${medianMs.toStringAsFixed(1)}ms '
        'avg=${averageMs.toStringAsFixed(1)}ms '
        'min=${minMs.toStringAsFixed(1)}ms '
        'max=${maxMs.toStringAsFixed(1)}ms '
        'results=${lastRecommendations.length}'
        '${best == null ? '' : ' bestWin=${_percent(best.ownWinProbability)} bestCost=${best.cost.toStringAsFixed(1)}'}',
      );
    }
    print('');
  }
}

class BenchmarkOptions {
  const BenchmarkOptions({
    required this.maxEvaluatedCandidates,
    required this.runs,
    required this.warmups,
  });

  factory BenchmarkOptions.parse(List<String> args) {
    return BenchmarkOptions(
      maxEvaluatedCandidates: _parseIntList(
        args,
        '--candidates=',
        fallback: <int>[50, 100, 150, 250],
      ),
      runs: _parseInt(args, '--runs=', fallback: 5),
      warmups: _parseInt(args, '--warmups=', fallback: 1),
    );
  }

  final List<int> maxEvaluatedCandidates;
  final int runs;
  final int warmups;
}

class BenchmarkScenario {
  const BenchmarkScenario({
    required this.name,
    required this.enemyLegion,
    required this.ownRole,
    this.allowSurpriseAttack = false,
    this.settlementLevel = 0,
  });

  final String name;
  final Legion enemyLegion;
  final LegionRecommendationRole ownRole;
  final bool allowSurpriseAttack;
  final int settlementLevel;

  LegionRecommendationRequest toRequest({required int maxEvaluatedCandidates}) {
    return LegionRecommendationRequest(
      enemyLegion: enemyLegion,
      ownRole: ownRole,
      constraints: LegionRecommendationConstraints(
        maxRegularUnits: LegionLimits.maxUnitsPerType,
        maxEliteUnits: LegionLimits.maxUnitsPerType,
        maxSpecialEliteUnits: LegionLimits.maxUnitsPerType,
        maxGenericLeaders: LegionLimits.maxLeaders,
        allowSurpriseAttack: allowSurpriseAttack,
        settlementLevel: settlementLevel,
      ),
      maxEvaluatedCandidates: maxEvaluatedCandidates,
    );
  }
}

List<BenchmarkScenario> _buildScenarios() {
  return <BenchmarkScenario>[
    const BenchmarkScenario(
      name: 'attacker_vs_small_open_defender',
      enemyLegion: DefendingLegion(regularUnits: 2),
      ownRole: LegionRecommendationRole.attacker,
    ),
    const BenchmarkScenario(
      name: 'attacker_vs_medium_fortified_special',
      enemyLegion: DefendingLegion(
        regularUnits: 3,
        specialEliteUnits: 1,
        genericLeaders: 1,
        settlementLevel: 2,
      ),
      ownRole: LegionRecommendationRole.attacker,
      allowSurpriseAttack: true,
    ),
    const BenchmarkScenario(
      name: 'attacker_vs_large_command_fortress',
      enemyLegion: DefendingLegion(
        regularUnits: 4,
        eliteUnits: 1,
        specialEliteUnits: 1,
        genericLeaders: 2,
        settlementLevel: 3,
      ),
      ownRole: LegionRecommendationRole.attacker,
      allowSurpriseAttack: true,
    ),
    const BenchmarkScenario(
      name: 'defender_vs_regular_wave',
      enemyLegion: AttackingLegion(regularUnits: 6),
      ownRole: LegionRecommendationRole.defender,
      settlementLevel: 1,
    ),
    const BenchmarkScenario(
      name: 'defender_vs_surprise_special_assault',
      enemyLegion: AttackingLegion(
        regularUnits: 4,
        specialEliteUnits: 1,
        genericLeaders: 2,
        surpriseAttack: true,
      ),
      ownRole: LegionRecommendationRole.defender,
      settlementLevel: 2,
    ),
    const BenchmarkScenario(
      name: 'defender_vs_large_command_assault',
      enemyLegion: AttackingLegion(
        regularUnits: 3,
        eliteUnits: 1,
        specialEliteUnits: 1,
        genericLeaders: 2,
        surpriseAttack: true,
      ),
      ownRole: LegionRecommendationRole.defender,
      settlementLevel: 3,
    ),
  ];
}

List<int> _parseIntList(
  List<String> args,
  String prefix, {
  required List<int> fallback,
}) {
  final String? rawValue = _findOptionValue(args, prefix);
  if (rawValue == null || rawValue.trim().isEmpty) {
    return fallback;
  }
  final List<int> values = rawValue
      .split(',')
      .map((String value) => int.parse(value.trim()))
      .toList();
  if (values.any((int value) => value <= 0)) {
    throw ArgumentError('Candidate limits must be positive.');
  }
  return values;
}

int _parseInt(List<String> args, String prefix, {required int fallback}) {
  final String? rawValue = _findOptionValue(args, prefix);
  if (rawValue == null || rawValue.trim().isEmpty) {
    return fallback;
  }
  final int value = int.parse(rawValue);
  if (value <= 0) {
    throw ArgumentError('$prefix must be positive.');
  }
  return value;
}

String? _findOptionValue(List<String> args, String prefix) {
  for (final String arg in args) {
    if (arg.startsWith(prefix)) {
      return arg.substring(prefix.length);
    }
  }
  return null;
}

double _median(List<int> sortedValues) {
  final int middle = sortedValues.length ~/ 2;
  if (sortedValues.length.isOdd) {
    return sortedValues[middle].toDouble();
  }
  return (sortedValues[middle - 1] + sortedValues[middle]) / 2;
}

String _describeLegion(Legion legion) {
  final List<String> parts = <String>[
    'g:${legion.genericLeaders}',
    'r:${legion.regularUnits}',
    'e:${legion.eliteUnits}',
    's:${legion.specialEliteUnits}',
  ];
  legion.map(
    attacking: (AttackingLegion legion) {
      if (legion.surpriseAttack) {
        parts.add('surprise');
      }
    },
    defending: (DefendingLegion legion) {
      parts.add('settlement:${legion.settlementLevel}');
    },
  );
  return parts.join(',');
}

String _percent(double value) {
  return '${(value * 100).toStringAsFixed(1)}%';
}
