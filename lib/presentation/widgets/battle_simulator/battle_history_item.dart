import 'package:bswfa/domain/battle_result.dart';
import 'package:flutter/material.dart';

class BattleHistoryItem extends StatelessWidget {
  const BattleHistoryItem({
    super.key,
    required this.battleResult,
    required this.displayIndex,
  });

  final BattleResult battleResult;
  final int displayIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: displayIndex % 2 == 0 ? Colors.amber : Colors.black87,
          width: 1.6,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -5.0,
            right: -5.0,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Text(
                '#$displayIndex',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRow(
                    label: 'Att.Hits:',
                    hits: battleResult.attackerExpectedHits,
                    legion: battleResult.attackingLegion,
                    isAttacker: true,
                  ),
                  const SizedBox(height: 3.0),
                  _buildRow(
                    label: 'Def.Hits:',
                    hits: battleResult.defenderExpectedHits,
                    legion: battleResult.defendingLegion,
                    isAttacker: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow({
    required String label,
    required double hits,
    required dynamic legion,
    required bool isAttacker,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: isAttacker ? Colors.black87 : Colors.amber,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 67,
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isAttacker ? Colors.amber : Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    '${hits.toStringAsFixed(2)}\u{2694}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isAttacker ? Colors.amber : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildRichText('L', '${legion.genericLeaders}'),
          _buildRichText('R', '${legion.regularUnits}'),
          _buildRichText('E', '${legion.eliteUnits}'),
          _buildRichText('S', '${legion.specialEliteUnits}'),
          _buildRichText('C', '${legion.usedCards}'),
          _buildRichText('N', '${legion.namedLeaders.length}'),
          _buildRichText(
            isAttacker ? 'A' : 'S:',
            isAttacker ? ' ${legion.surpriseAttack ? 'yes' : 'no'}' : ' ${legion.settlementLevel}',
          ),
        ].map((child) => Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0), child: child)).toList(),
      ),
    );
  }

  Row _buildRichText(String t1, String t2) {
    return Row(
      children: [
        Text(t1, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(t2, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
