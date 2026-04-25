import 'package:flutter/material.dart';

class SurpriseAttackInput extends StatelessWidget {
  const SurpriseAttackInput({
    required this.label,
    required this.value,
    this.onValueChanged,
    super.key,
  });

  final String label;
  final bool value;
  final void Function(bool)? onValueChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  label,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  value ? 'Enabled' : 'Disabled',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            activeThumbColor: Colors.amber,
            onChanged: onValueChanged,
          ),
        ],
      ),
    );
  }
}
