import 'package:flutter/material.dart';

const List<int> kUnitsCount = <int>[0, 1, 2, 3, 4, 5, 6];

class UnitInput extends StatelessWidget {
  const UnitInput({
    required this.label,
    required this.startPosition,
    required this.onValueChanged,
    super.key,
  });

  final String label;
  final int startPosition;
  final void Function(int) onValueChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool canDecrease = startPosition > kUnitsCount.first;
    final bool canIncrease = startPosition < kUnitsCount.last;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.black12),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
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
          const SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              _StepButton(
                icon: Icons.remove_rounded,
                enabled: canDecrease,
                onPressed: canDecrease
                    ? () => onValueChanged(startPosition - 1)
                    : null,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Container(
                  height: 52.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(color: Colors.amber, width: 1.5),
                  ),
                  child: Text(
                    '$startPosition',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: Colors.amber,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              _StepButton(
                icon: Icons.add_rounded,
                enabled: canIncrease,
                onPressed: canIncrease
                    ? () => onValueChanged(startPosition + 1)
                    : null,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: kUnitsCount.map((int value) {
              return _QuickValueButton(
                value: value,
                selected: value == startPosition,
                onPressed: value == startPosition
                    ? null
                    : () => onValueChanged(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _QuickValueButton extends StatelessWidget {
  const _QuickValueButton({
    required this.value,
    required this.selected,
    required this.onPressed,
  });

  final int value;
  final bool selected;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Colors.amber : Colors.black87.withValues(alpha: 0.06),
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: onPressed,
        child: Container(
          width: 30.0,
          height: 30.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: selected ? Colors.black87 : Colors.black12,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            '$value',
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w800,
              color: selected ? Colors.black87 : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}

class _StepButton extends StatelessWidget {
  const _StepButton({
    required this.icon,
    required this.enabled,
    required this.onPressed,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: enabled ? Colors.amber.withValues(alpha: 0.18) : Colors.black12,
      borderRadius: BorderRadius.circular(14.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(14.0),
        onTap: onPressed,
        child: SizedBox(
          width: 44.0,
          height: 52.0,
          child: Icon(icon, color: enabled ? Colors.black87 : Colors.black38),
        ),
      ),
    );
  }
}
