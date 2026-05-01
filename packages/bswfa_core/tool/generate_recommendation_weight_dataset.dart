import 'dart:convert';
import 'dart:io';

import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_constraints.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_role.dart';

void main(List<String> args) {
  final _CliOptions options = _CliOptions.parse(args);
  final List<_DatasetEntry> entries = _buildDatasetEntries();

  final Map<String, Object> payload = <String, Object>{
    'generatedAtUtc': DateTime.now().toUtc().toIso8601String(),
    'entryCount': entries.length,
    'splitCounts': _countBy(entries, (_DatasetEntry entry) => entry.split),
    'roleCounts': _countBy(
      entries,
      (_DatasetEntry entry) => entry.ownRole.name,
    ),
    'entries': <Map<String, Object>>[
      for (final _DatasetEntry entry in entries) entry.toJson(),
    ],
  };

  options.outputFile.parent.createSync(recursive: true);
  options.outputFile.writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert(payload),
  );

  stdout.writeln(
    'Generated ${entries.length} dataset entries at '
    '${options.outputFile.path}',
  );
}

class _CliOptions {
  const _CliOptions({required this.outputFile});

  factory _CliOptions.parse(List<String> args) {
    String outputPath = 'tool/recommendation_weight_dataset.json';

    for (final String arg in args) {
      if (arg.startsWith('--output=')) {
        outputPath = arg.substring('--output='.length);
        continue;
      }
      throw ArgumentError(
        'Unsupported argument "$arg". Use --output=<path>.',
      );
    }

    return _CliOptions(outputFile: File(outputPath));
  }

  final File outputFile;
}

class _DatasetEntry {
  const _DatasetEntry({
    required this.id,
    required this.split,
    required this.ownRole,
    required this.enemyLegion,
    required this.constraints,
    required this.maxRounds,
    required this.targetWinProbability,
    required this.limit,
    required this.maxEvaluatedCandidates,
    required this.tags,
  });

  final String id;
  final String split;
  final LegionRecommendationRole ownRole;
  final Legion enemyLegion;
  final LegionRecommendationConstraints constraints;
  final int maxRounds;
  final double targetWinProbability;
  final int limit;
  final int maxEvaluatedCandidates;
  final List<String> tags;

  Map<String, Object> toJson() {
    return <String, Object>{
      'id': id,
      'split': split,
      'ownRole': ownRole.name,
      'enemyLegion': _legionToJson(enemyLegion),
      'constraints': _constraintsToJson(constraints),
      'maxRounds': maxRounds,
      'targetWinProbability': targetWinProbability,
      'limit': limit,
      'maxEvaluatedCandidates': maxEvaluatedCandidates,
      'tags': tags,
    };
  }
}

List<_DatasetEntry> _buildDatasetEntries() {
  final List<_DatasetEntry> entries = <_DatasetEntry>[];

  for (final _EnemyScenario enemy in _buildDefenderEnemies()) {
    for (final _ConstraintProfile profile
        in _buildAttackerConstraintProfiles(enemy.band)) {
      final String id = _buildEntryId(
        ownRole: LegionRecommendationRole.attacker,
        enemy: enemy,
        constraintProfileName: profile.name,
      );
      entries.add(
        _DatasetEntry(
          id: id,
          split: _assignSplit(id),
          ownRole: LegionRecommendationRole.attacker,
          enemyLegion: enemy.legion,
          constraints: profile.constraints,
          maxRounds: enemy.band.maxRounds,
          targetWinProbability: 0.6,
          limit: 3,
          maxEvaluatedCandidates: enemy.band.maxEvaluatedCandidates,
          tags: <String>[
            'role:attacker',
            'band:${enemy.band.name}',
            'enemy:${enemy.variantName}',
            'constraints:${profile.name}',
          ],
        ),
      );
    }
  }

  for (final _EnemyScenario enemy in _buildAttackerEnemies()) {
    for (final _ConstraintProfile profile
        in _buildDefenderConstraintProfiles(enemy.band)) {
      final String id = _buildEntryId(
        ownRole: LegionRecommendationRole.defender,
        enemy: enemy,
        constraintProfileName: profile.name,
      );
      entries.add(
        _DatasetEntry(
          id: id,
          split: _assignSplit(id),
          ownRole: LegionRecommendationRole.defender,
          enemyLegion: enemy.legion,
          constraints: profile.constraints,
          maxRounds: enemy.band.maxRounds,
          targetWinProbability: 0.6,
          limit: 3,
          maxEvaluatedCandidates: enemy.band.maxEvaluatedCandidates,
          tags: <String>[
            'role:defender',
            'band:${enemy.band.name}',
            'enemy:${enemy.variantName}',
            'constraints:${profile.name}',
          ],
        ),
      );
    }
  }

  entries.sort((_DatasetEntry left, _DatasetEntry right) => left.id.compareTo(right.id));
  return entries;
}

Iterable<_EnemyScenario> _buildDefenderEnemies() sync* {
  for (final _ScenarioBand band in _ScenarioBand.values) {
    for (int totalUnits = band.minUnits; totalUnits <= band.maxUnits; totalUnits++) {
      yield _EnemyScenario(
        band: band,
        variantName: 'regular_line',
        legion: DefendingLegion(
          regularUnits: totalUnits,
          settlementLevel: band.defaultSettlementLevel,
        ),
      );
      yield _EnemyScenario(
        band: band,
        variantName: 'elite_mix',
        legion: DefendingLegion(
          regularUnits: totalUnits - 1,
          eliteUnits: 1,
          settlementLevel: band.defaultSettlementLevel,
        ),
      );
      if (totalUnits >= 2) {
        yield _EnemyScenario(
          band: band,
          variantName: 'special_mix',
          legion: DefendingLegion(
            regularUnits: totalUnits - 1,
            specialEliteUnits: 1,
            settlementLevel: band.defaultSettlementLevel,
          ),
        );
      }
      if (totalUnits >= 3) {
        yield _EnemyScenario(
          band: band,
          variantName: 'leader_mix',
          legion: DefendingLegion(
            regularUnits: totalUnits - 2,
            eliteUnits: 1,
            genericLeaders: 1,
            settlementLevel: band.defaultSettlementLevel,
          ),
        );
      }
      if (band != _ScenarioBand.small && totalUnits >= 4) {
        yield _EnemyScenario(
          band: band,
          variantName: 'command_mix',
          legion: DefendingLegion(
            regularUnits: totalUnits - 3,
            eliteUnits: 1,
            specialEliteUnits: 1,
            genericLeaders: 2,
            settlementLevel: band.defaultSettlementLevel,
          ),
        );
      }
      if (band != _ScenarioBand.small) {
        yield _EnemyScenario(
          band: band,
          variantName: 'fortified_line',
          legion: DefendingLegion(
            regularUnits: totalUnits,
            genericLeaders: totalUnits >= 4 ? 1 : 0,
            settlementLevel: band.fortifiedSettlementLevel,
          ),
        );
      }
    }
  }
}

Iterable<_EnemyScenario> _buildAttackerEnemies() sync* {
  for (final _ScenarioBand band in _ScenarioBand.values) {
    for (int totalUnits = band.minUnits; totalUnits <= band.maxUnits; totalUnits++) {
      yield _EnemyScenario(
        band: band,
        variantName: 'regular_wave',
        legion: AttackingLegion(regularUnits: totalUnits),
      );
      yield _EnemyScenario(
        band: band,
        variantName: 'elite_mix',
        legion: AttackingLegion(
          regularUnits: totalUnits - 1,
          eliteUnits: 1,
        ),
      );
      if (totalUnits >= 2) {
        yield _EnemyScenario(
          band: band,
          variantName: 'special_mix',
          legion: AttackingLegion(
            regularUnits: totalUnits - 1,
            specialEliteUnits: 1,
          ),
        );
      }
      if (totalUnits >= 3) {
        yield _EnemyScenario(
          band: band,
          variantName: 'leader_mix',
          legion: AttackingLegion(
            regularUnits: totalUnits - 2,
            eliteUnits: 1,
            genericLeaders: 1,
          ),
        );
      }
      if (band != _ScenarioBand.small && totalUnits >= 4) {
        yield _EnemyScenario(
          band: band,
          variantName: 'command_mix',
          legion: AttackingLegion(
            regularUnits: totalUnits - 3,
            eliteUnits: 1,
            specialEliteUnits: 1,
            genericLeaders: 2,
          ),
        );
      }
      if (band != _ScenarioBand.small) {
        yield _EnemyScenario(
          band: band,
          variantName: 'surprise_assault',
          legion: AttackingLegion(
            regularUnits: totalUnits - 1,
            specialEliteUnits: 1,
            genericLeaders: totalUnits >= 6 ? 2 : 1,
            surpriseAttack: true,
          ),
        );
      }
    }
  }
}

Iterable<_ConstraintProfile> _buildAttackerConstraintProfiles(_ScenarioBand band) sync* {
  yield _ConstraintProfile(
    name: 'tight',
    constraints: LegionRecommendationConstraints(
      maxRegularUnits: band.attackerTightRegular,
      maxEliteUnits: band.attackerTightElite,
      maxSpecialEliteUnits: band.attackerTightSpecial,
      maxGenericLeaders: band.attackerTightLeaders,
      allowSurpriseAttack: false,
    ),
  );
  yield _ConstraintProfile(
    name: 'wide',
    constraints: LegionRecommendationConstraints(
      maxRegularUnits: band.attackerWideRegular,
      maxEliteUnits: band.attackerWideElite,
      maxSpecialEliteUnits: band.attackerWideSpecial,
      maxGenericLeaders: band.attackerWideLeaders,
      allowSurpriseAttack: true,
    ),
  );
}

Iterable<_ConstraintProfile> _buildDefenderConstraintProfiles(_ScenarioBand band) sync* {
  yield _ConstraintProfile(
    name: 'open_field',
    constraints: LegionRecommendationConstraints(
      maxRegularUnits: band.defenderTightRegular,
      maxEliteUnits: band.defenderTightElite,
      maxSpecialEliteUnits: band.defenderTightSpecial,
      maxGenericLeaders: band.defenderTightLeaders,
      settlementLevel: 0,
    ),
  );
  yield _ConstraintProfile(
    name: 'fortified',
    constraints: LegionRecommendationConstraints(
      maxRegularUnits: band.defenderWideRegular,
      maxEliteUnits: band.defenderWideElite,
      maxSpecialEliteUnits: band.defenderWideSpecial,
      maxGenericLeaders: band.defenderWideLeaders,
      settlementLevel: band.fortifiedSettlementLevel,
    ),
  );
}

String _buildEntryId({
  required LegionRecommendationRole ownRole,
  required _EnemyScenario enemy,
  required String constraintProfileName,
}) {
  final Legion legion = enemy.legion;
  final Map<String, Object> enemyJson = _legionToJson(legion);
  final List<String> parts = <String>[
    ownRole.name,
    enemy.band.name,
    enemy.variantName,
    constraintProfileName,
    'r${enemyJson['regularUnits']}',
    'e${enemyJson['eliteUnits']}',
    's${enemyJson['specialEliteUnits']}',
    'g${enemyJson['genericLeaders']}',
  ];
  if (legion is AttackingLegion) {
    parts.add('sa${legion.surpriseAttack ? 1 : 0}');
  } else if (legion is DefendingLegion) {
    parts.add('st${legion.settlementLevel}');
  }

  return parts.join('__');
}

String _assignSplit(String id) {
  int hash = 17;
  for (final int codeUnit in id.codeUnits) {
    hash = (hash * 31 + codeUnit) & 0x7fffffff;
  }

  final int bucket = hash % 10;
  if (bucket < 8) {
    return 'train';
  }
  if (bucket == 8) {
    return 'validation';
  }
  return 'holdout';
}

Map<String, int> _countBy<T>(
  Iterable<T> values,
  String Function(T value) keySelector,
) {
  final Map<String, int> counts = <String, int>{};
  for (final T value in values) {
    final String key = keySelector(value);
    counts.update(key, (int current) => current + 1, ifAbsent: () => 1);
  }
  return counts;
}

Map<String, Object> _legionToJson(Legion legion) {
  return legion.map(
    attacking: (AttackingLegion attackingLegion) => <String, Object>{
      'type': 'attacking',
      'genericLeaders': attackingLegion.genericLeaders,
      'regularUnits': attackingLegion.regularUnits,
      'eliteUnits': attackingLegion.eliteUnits,
      'specialEliteUnits': attackingLegion.specialEliteUnits,
      'usedCards': attackingLegion.usedCards,
      'surpriseAttack': attackingLegion.surpriseAttack,
    },
    defending: (DefendingLegion defendingLegion) => <String, Object>{
      'type': 'defending',
      'genericLeaders': defendingLegion.genericLeaders,
      'regularUnits': defendingLegion.regularUnits,
      'eliteUnits': defendingLegion.eliteUnits,
      'specialEliteUnits': defendingLegion.specialEliteUnits,
      'usedCards': defendingLegion.usedCards,
      'settlementLevel': defendingLegion.settlementLevel,
    },
  );
}

Map<String, Object> _constraintsToJson(
  LegionRecommendationConstraints constraints,
) {
  return <String, Object>{
    'maxRegularUnits': constraints.maxRegularUnits,
    'maxEliteUnits': constraints.maxEliteUnits,
    'maxSpecialEliteUnits': constraints.maxSpecialEliteUnits,
    'maxGenericLeaders': constraints.maxGenericLeaders,
    'allowSurpriseAttack': constraints.allowSurpriseAttack,
    'settlementLevel': constraints.settlementLevel,
  };
}

class _EnemyScenario {
  const _EnemyScenario({
    required this.band,
    required this.variantName,
    required this.legion,
  });

  final _ScenarioBand band;
  final String variantName;
  final Legion legion;
}

class _ConstraintProfile {
  const _ConstraintProfile({required this.name, required this.constraints});

  final String name;
  final LegionRecommendationConstraints constraints;
}

enum _ScenarioBand {
  small,
  medium,
  large;

  int get minUnits => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 3,
    _ScenarioBand.large => 5,
  };

  int get maxUnits => switch (this) {
    _ScenarioBand.small => 2,
    _ScenarioBand.medium => 4,
    _ScenarioBand.large => 6,
  };

  int get maxRounds => switch (this) {
    _ScenarioBand.small => 2,
    _ScenarioBand.medium => 3,
    _ScenarioBand.large => 4,
  };

  int get maxEvaluatedCandidates => switch (this) {
    _ScenarioBand.small => 80,
    _ScenarioBand.medium => 140,
    _ScenarioBand.large => 220,
  };

  int get defaultSettlementLevel => switch (this) {
    _ScenarioBand.small => 0,
    _ScenarioBand.medium => 1,
    _ScenarioBand.large => 2,
  };

  int get fortifiedSettlementLevel => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 3,
    _ScenarioBand.large => 4,
  };

  int get attackerTightRegular => switch (this) {
    _ScenarioBand.small => 3,
    _ScenarioBand.medium => 4,
    _ScenarioBand.large => 6,
  };

  int get attackerTightElite => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 2,
    _ScenarioBand.large => 3,
  };

  int get attackerTightSpecial => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 1,
    _ScenarioBand.large => 2,
  };

  int get attackerTightLeaders => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 2,
    _ScenarioBand.large => 3,
  };

  int get attackerWideRegular => switch (this) {
    _ScenarioBand.small => 4,
    _ScenarioBand.medium => 5,
    _ScenarioBand.large => 6,
  };

  int get attackerWideElite => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 2,
    _ScenarioBand.large => 3,
  };

  int get attackerWideSpecial => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 2,
    _ScenarioBand.large => 2,
  };

  int get attackerWideLeaders => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 3,
    _ScenarioBand.large => 4,
  };

  int get defenderTightRegular => switch (this) {
    _ScenarioBand.small => 3,
    _ScenarioBand.medium => 4,
    _ScenarioBand.large => 5,
  };

  int get defenderTightElite => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 2,
    _ScenarioBand.large => 2,
  };

  int get defenderTightSpecial => switch (this) {
    _ScenarioBand.small => 0,
    _ScenarioBand.medium => 1,
    _ScenarioBand.large => 2,
  };

  int get defenderTightLeaders => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 2,
    _ScenarioBand.large => 3,
  };

  int get defenderWideRegular => switch (this) {
    _ScenarioBand.small => 4,
    _ScenarioBand.medium => 5,
    _ScenarioBand.large => 6,
  };

  int get defenderWideElite => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 2,
    _ScenarioBand.large => 3,
  };

  int get defenderWideSpecial => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 1,
    _ScenarioBand.large => 2,
  };

  int get defenderWideLeaders => switch (this) {
    _ScenarioBand.small => 1,
    _ScenarioBand.medium => 3,
    _ScenarioBand.large => 4,
  };
}
