import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_constraints.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_request.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_resolver.dart';
import 'package:bswfa_core/legion/recommendation/legion_recommendation_role.dart';
import 'package:bswfa_ui/presentation/widgets/common/label_border_field_set.dart';
import 'package:bswfa_ui/presentation/widgets/legion_input/surprise_attack_input.dart';
import 'package:bswfa_ui/presentation/widgets/legion_input/unit_input.dart';
import 'package:flutter/material.dart';

class LegionRecommendationSetup extends StatefulWidget {
  const LegionRecommendationSetup({super.key});

  @override
  State<LegionRecommendationSetup> createState() =>
      _LegionRecommendationSetupState();
}

class _LegionRecommendationSetupState extends State<LegionRecommendationSetup> {
  LegionRecommendationRole _ownRole = LegionRecommendationRole.attacker;

  int _enemyRegularUnits = 0;
  int _enemyEliteUnits = 0;
  int _enemySpecialEliteUnits = 0;
  int _enemyGenericLeaders = 0;
  bool _enemySurpriseAttack = false;
  int _enemySettlementLevel = 0;

  int _maxRegularUnits = 0;
  int _maxEliteUnits = 0;
  int _maxSpecialEliteUnits = 0;
  int _maxGenericLeaders = 0;
  bool _allowSurpriseAttack = false;
  int _settlementLevel = 0;

  List<LegionRecommendation>? _recommendations;
  Object? _recommendationError;

  bool get _recommendingAttacker =>
      _ownRole == LegionRecommendationRole.attacker;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8.0,
      children: <Widget>[
        _RoleSelector(
          role: _ownRole,
          onRoleChanged: (LegionRecommendationRole value) {
            setState(() {
              _ownRole = value;
              _recommendations = null;
              _recommendationError = null;
            });
          },
        ),
        _EnemyLegionInput(
          ownRole: _ownRole,
          regularUnits: _enemyRegularUnits,
          eliteUnits: _enemyEliteUnits,
          specialEliteUnits: _enemySpecialEliteUnits,
          genericLeaders: _enemyGenericLeaders,
          surpriseAttack: _enemySurpriseAttack,
          settlementLevel: _enemySettlementLevel,
          onRegularUnitsChanged: (int value) =>
              _updateEnemy(regularUnits: value),
          onEliteUnitsChanged: (int value) => _updateEnemy(eliteUnits: value),
          onSpecialEliteUnitsChanged: (int value) =>
              _updateEnemy(specialEliteUnits: value),
          onGenericLeadersChanged: (int value) =>
              _updateEnemy(genericLeaders: value),
          onSurpriseAttackChanged: (bool value) =>
              _updateEnemy(surpriseAttack: value),
          onSettlementLevelChanged: (int value) =>
              _updateEnemy(settlementLevel: value),
        ),
        _OwnAvailabilityInput(
          ownRole: _ownRole,
          maxRegularUnits: _maxRegularUnits,
          maxEliteUnits: _maxEliteUnits,
          maxSpecialEliteUnits: _maxSpecialEliteUnits,
          maxGenericLeaders: _maxGenericLeaders,
          allowSurpriseAttack: _allowSurpriseAttack,
          settlementLevel: _settlementLevel,
          onMaxRegularUnitsChanged: (int value) =>
              _updateAvailability(maxRegularUnits: value),
          onMaxEliteUnitsChanged: (int value) =>
              _updateAvailability(maxEliteUnits: value),
          onMaxSpecialEliteUnitsChanged: (int value) =>
              _updateAvailability(maxSpecialEliteUnits: value),
          onMaxGenericLeadersChanged: (int value) =>
              _updateAvailability(maxGenericLeaders: value),
          onAllowSurpriseAttackChanged: (bool value) =>
              _updateAvailability(allowSurpriseAttack: value),
          onSettlementLevelChanged: (int value) =>
              _updateAvailability(settlementLevel: value),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            foregroundColor: Colors.amber,
          ),
          onPressed: _resolveRecommendations,
          icon: const Icon(Icons.manage_search_outlined),
          label: const Align(
            heightFactor: 1.6,
            child: Text(
              'Recomendar legion',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        _RecommendationResults(
          recommendations: _recommendations,
          error: _recommendationError,
        ),
      ],
    );
  }

  void _updateEnemy({
    int? regularUnits,
    int? eliteUnits,
    int? specialEliteUnits,
    int? genericLeaders,
    bool? surpriseAttack,
    int? settlementLevel,
  }) {
    setState(() {
      _enemyRegularUnits = regularUnits ?? _enemyRegularUnits;
      _enemyEliteUnits = eliteUnits ?? _enemyEliteUnits;
      _enemySpecialEliteUnits = specialEliteUnits ?? _enemySpecialEliteUnits;
      _enemyGenericLeaders = genericLeaders ?? _enemyGenericLeaders;
      _enemySurpriseAttack = surpriseAttack ?? _enemySurpriseAttack;
      _enemySettlementLevel = settlementLevel ?? _enemySettlementLevel;
      _recommendations = null;
      _recommendationError = null;
    });
  }

  void _updateAvailability({
    int? maxRegularUnits,
    int? maxEliteUnits,
    int? maxSpecialEliteUnits,
    int? maxGenericLeaders,
    bool? allowSurpriseAttack,
    int? settlementLevel,
  }) {
    setState(() {
      _maxRegularUnits = maxRegularUnits ?? _maxRegularUnits;
      _maxEliteUnits = maxEliteUnits ?? _maxEliteUnits;
      _maxSpecialEliteUnits = maxSpecialEliteUnits ?? _maxSpecialEliteUnits;
      _maxGenericLeaders = maxGenericLeaders ?? _maxGenericLeaders;
      _allowSurpriseAttack = allowSurpriseAttack ?? _allowSurpriseAttack;
      _settlementLevel = settlementLevel ?? _settlementLevel;
      _recommendations = null;
      _recommendationError = null;
    });
  }

  void _resolveRecommendations() {
    try {
      final List<LegionRecommendation> recommendations =
          const LegionRecommendationResolver().resolve(
            LegionRecommendationRequest(
              enemyLegion: _buildEnemyLegion(),
              ownRole: _ownRole,
              constraints: LegionRecommendationConstraints(
                maxRegularUnits: _maxRegularUnits,
                maxEliteUnits: _maxEliteUnits,
                maxSpecialEliteUnits: _maxSpecialEliteUnits,
                maxGenericLeaders: _maxGenericLeaders,
                allowSurpriseAttack: _recommendingAttacker
                    ? _allowSurpriseAttack
                    : false,
                settlementLevel: _recommendingAttacker ? 0 : _settlementLevel,
              ),
            ),
          );

      setState(() {
        _recommendations = recommendations;
        _recommendationError = null;
      });
    } catch (error) {
      setState(() {
        _recommendations = null;
        _recommendationError = error;
      });
    }
  }

  Legion _buildEnemyLegion() {
    if (_recommendingAttacker) {
      return DefendingLegion(
        regularUnits: _enemyRegularUnits,
        eliteUnits: _enemyEliteUnits,
        specialEliteUnits: _enemySpecialEliteUnits,
        genericLeaders: _enemyGenericLeaders,
        settlementLevel: _enemySettlementLevel,
      );
    }

    return AttackingLegion(
      regularUnits: _enemyRegularUnits,
      eliteUnits: _enemyEliteUnits,
      specialEliteUnits: _enemySpecialEliteUnits,
      genericLeaders: _enemyGenericLeaders,
      surpriseAttack: _enemySurpriseAttack,
    );
  }
}

class _RoleSelector extends StatelessWidget {
  const _RoleSelector({required this.role, required this.onRoleChanged});

  final LegionRecommendationRole role;
  final ValueChanged<LegionRecommendationRole> onRoleChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<LegionRecommendationRole>(
      segments: const <ButtonSegment<LegionRecommendationRole>>[
        ButtonSegment<LegionRecommendationRole>(
          value: LegionRecommendationRole.attacker,
          icon: Icon(Icons.north_east_outlined),
          label: Text('Quiero atacar'),
        ),
        ButtonSegment<LegionRecommendationRole>(
          value: LegionRecommendationRole.defender,
          icon: Icon(Icons.shield_outlined),
          label: Text('Quiero defender'),
        ),
      ],
      selected: <LegionRecommendationRole>{role},
      onSelectionChanged: (Set<LegionRecommendationRole> value) {
        onRoleChanged(value.first);
      },
    );
  }
}

class _EnemyLegionInput extends StatelessWidget {
  const _EnemyLegionInput({
    required this.ownRole,
    required this.regularUnits,
    required this.eliteUnits,
    required this.specialEliteUnits,
    required this.genericLeaders,
    required this.surpriseAttack,
    required this.settlementLevel,
    required this.onRegularUnitsChanged,
    required this.onEliteUnitsChanged,
    required this.onSpecialEliteUnitsChanged,
    required this.onGenericLeadersChanged,
    required this.onSurpriseAttackChanged,
    required this.onSettlementLevelChanged,
  });

  final LegionRecommendationRole ownRole;
  final int regularUnits;
  final int eliteUnits;
  final int specialEliteUnits;
  final int genericLeaders;
  final bool surpriseAttack;
  final int settlementLevel;
  final ValueChanged<int> onRegularUnitsChanged;
  final ValueChanged<int> onEliteUnitsChanged;
  final ValueChanged<int> onSpecialEliteUnitsChanged;
  final ValueChanged<int> onGenericLeadersChanged;
  final ValueChanged<bool> onSurpriseAttackChanged;
  final ValueChanged<int> onSettlementLevelChanged;

  bool get _enemyDefends => ownRole == LegionRecommendationRole.attacker;

  @override
  Widget build(BuildContext context) {
    return LabeledBorderFieldset(
      label: _enemyDefends ? 'Enemy Defender' : 'Enemy Attacker',
      borderColor: Colors.black87,
      textColor: Colors.black87,
      child: Wrap(
        spacing: 12.0,
        runSpacing: 12.0,
        children: <Widget>[
          _SizedInput(
            child: UnitInput(
              label: 'Leader',
              startPosition: genericLeaders,
              onValueChanged: onGenericLeadersChanged,
            ),
          ),
          _SizedInput(
            child: UnitInput(
              label: 'Regular',
              startPosition: regularUnits,
              onValueChanged: onRegularUnitsChanged,
            ),
          ),
          _SizedInput(
            child: UnitInput(
              label: 'Elite',
              startPosition: eliteUnits,
              onValueChanged: onEliteUnitsChanged,
            ),
          ),
          _SizedInput(
            child: UnitInput(
              label: 'Special',
              startPosition: specialEliteUnits,
              onValueChanged: onSpecialEliteUnitsChanged,
            ),
          ),
          if (_enemyDefends)
            _SizedInput(
              child: UnitInput(
                label: 'Settlement',
                startPosition: settlementLevel,
                onValueChanged: onSettlementLevelChanged,
              ),
            )
          else
            _SizedInput(
              child: SurpriseAttackInput(
                label: 'Surprise R1',
                value: surpriseAttack,
                onValueChanged: onSurpriseAttackChanged,
              ),
            ),
        ],
      ),
    );
  }
}

class _OwnAvailabilityInput extends StatelessWidget {
  const _OwnAvailabilityInput({
    required this.ownRole,
    required this.maxRegularUnits,
    required this.maxEliteUnits,
    required this.maxSpecialEliteUnits,
    required this.maxGenericLeaders,
    required this.allowSurpriseAttack,
    required this.settlementLevel,
    required this.onMaxRegularUnitsChanged,
    required this.onMaxEliteUnitsChanged,
    required this.onMaxSpecialEliteUnitsChanged,
    required this.onMaxGenericLeadersChanged,
    required this.onAllowSurpriseAttackChanged,
    required this.onSettlementLevelChanged,
  });

  final LegionRecommendationRole ownRole;
  final int maxRegularUnits;
  final int maxEliteUnits;
  final int maxSpecialEliteUnits;
  final int maxGenericLeaders;
  final bool allowSurpriseAttack;
  final int settlementLevel;
  final ValueChanged<int> onMaxRegularUnitsChanged;
  final ValueChanged<int> onMaxEliteUnitsChanged;
  final ValueChanged<int> onMaxSpecialEliteUnitsChanged;
  final ValueChanged<int> onMaxGenericLeadersChanged;
  final ValueChanged<bool> onAllowSurpriseAttackChanged;
  final ValueChanged<int> onSettlementLevelChanged;

  bool get _recommendingAttacker =>
      ownRole == LegionRecommendationRole.attacker;

  @override
  Widget build(BuildContext context) {
    return LabeledBorderFieldset(
      label: 'Own Availability',
      borderColor: Colors.amber,
      textColor: Colors.black87,
      child: Wrap(
        spacing: 12.0,
        runSpacing: 12.0,
        children: <Widget>[
          _SizedInput(
            child: UnitInput(
              label: 'Max leader',
              startPosition: maxGenericLeaders,
              onValueChanged: onMaxGenericLeadersChanged,
            ),
          ),
          _SizedInput(
            child: UnitInput(
              label: 'Max regular',
              startPosition: maxRegularUnits,
              onValueChanged: onMaxRegularUnitsChanged,
            ),
          ),
          _SizedInput(
            child: UnitInput(
              label: 'Max elite',
              startPosition: maxEliteUnits,
              onValueChanged: onMaxEliteUnitsChanged,
            ),
          ),
          _SizedInput(
            child: UnitInput(
              label: 'Max special',
              startPosition: maxSpecialEliteUnits,
              onValueChanged: onMaxSpecialEliteUnitsChanged,
            ),
          ),
          if (_recommendingAttacker)
            _SizedInput(
              child: SurpriseAttackInput(
                label: 'Allow surprise',
                value: allowSurpriseAttack,
                onValueChanged: onAllowSurpriseAttackChanged,
              ),
            )
          else
            _SizedInput(
              child: UnitInput(
                label: 'Settlement',
                startPosition: settlementLevel,
                onValueChanged: onSettlementLevelChanged,
              ),
            ),
        ],
      ),
    );
  }
}

class _RecommendationResults extends StatelessWidget {
  const _RecommendationResults({required this.recommendations, this.error});

  final List<LegionRecommendation>? recommendations;
  final Object? error;

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return _EmptyResults(message: 'No se pudo calcular: $error');
    }

    final List<LegionRecommendation>? values = recommendations;
    if (values == null) {
      return const _EmptyResults(message: 'Configura los datos y recomienda.');
    }

    if (values.isEmpty) {
      return const _EmptyResults(
        message: 'No hay recomendaciones disponibles.',
      );
    }

    return Wrap(
      runSpacing: 8.0,
      children: values.map((LegionRecommendation recommendation) {
        return _RecommendationCard(recommendation: recommendation);
      }).toList(),
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({required this.recommendation});

  final LegionRecommendation recommendation;

  @override
  Widget build(BuildContext context) {
    final Legion legion = recommendation.legion;
    final Color statusColor = recommendation.meetsTarget
        ? Colors.green
        : Colors.redAccent;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: statusColor.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  _compositionLabel(legion),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
              ),
              _TargetBadge(
                meetsTarget: recommendation.meetsTarget,
                color: statusColor,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: <Widget>[
              _MetricChip(
                label: 'Win',
                value: _percent(recommendation.ownWinProbability),
                color: Colors.green,
              ),
              _MetricChip(
                label: 'Lose',
                value: _percent(recommendation.ownLoseProbability),
                color: Colors.redAccent,
              ),
              _MetricChip(
                label: 'Draw',
                value: _percent(recommendation.distribution.drawProbability),
                color: Colors.blueGrey,
              ),
              _MetricChip(
                label: 'Unresolved',
                value: _percent(
                  recommendation.distribution.unresolvedProbability,
                ),
                color: Colors.deepPurple,
              ),
              _MetricChip(
                label: 'Cost',
                value: recommendation.cost.toStringAsFixed(1),
                color: Colors.amber.shade800,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _compositionLabel(Legion legion) {
    final List<String> parts = <String>[
      'L ${legion.genericLeaders}',
      'R ${legion.regularUnits}',
      'E ${legion.eliteUnits}',
      'S ${legion.specialEliteUnits}',
    ];

    if (legion is AttackingLegion && legion.surpriseAttack) {
      parts.add('Surprise');
    }
    if (legion is DefendingLegion && legion.settlementLevel > 0) {
      parts.add('Settlement ${legion.settlementLevel}');
    }

    return parts.join(' | ');
  }
}

class _TargetBadge extends StatelessWidget {
  const _TargetBadge({required this.meetsTarget, required this.color});

  final bool meetsTarget;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999.0),
      ),
      child: Text(
        meetsTarget ? 'Target met' : 'Below target',
        style: TextStyle(
          color: color,
          fontSize: 12.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _MetricChip extends StatelessWidget {
  const _MetricChip({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 4.0),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13.0,
              color: Colors.black87,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyResults extends StatelessWidget {
  const _EmptyResults({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.black87.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black12),
      ),
      child: Text(message, style: const TextStyle(color: Colors.black54)),
    );
  }
}

class _SizedInput extends StatelessWidget {
  const _SizedInput({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 276.0, child: child);
  }
}

String _percent(double value) {
  return '${(value * 100).toStringAsFixed(1)}%';
}
