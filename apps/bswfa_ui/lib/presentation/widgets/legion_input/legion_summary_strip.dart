import 'package:flutter/material.dart';

class LegionSummaryStrip extends StatelessWidget {
  const LegionSummaryStrip({required this.entries, super.key});

  final List<({String label, String value, IconData icon, Color color})>
  entries;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: entries.map((
        ({String label, String value, IconData icon, Color color}) entry,
      ) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
          decoration: BoxDecoration(
            color: entry.color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(999.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(entry.icon, size: 16.0, color: entry.color),
              const SizedBox(width: 6.0),
              Text(
                entry.label,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(width: 4.0),
              Text(
                entry.value,
                style: const TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
