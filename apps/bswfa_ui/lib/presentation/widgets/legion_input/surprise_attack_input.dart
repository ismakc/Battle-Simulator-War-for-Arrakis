import 'package:bswfa_ui/presentation/widgets/common/clamp_first_row.dart';
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
    return ClampFirstRow(
      flex: 6,
      maxWidth: 94,
      firstChild: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 60,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Switch(
                value: value,
                activeColor: Colors.amber,
                onChanged: onValueChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
