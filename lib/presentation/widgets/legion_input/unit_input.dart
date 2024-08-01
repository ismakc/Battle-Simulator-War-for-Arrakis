import 'package:bswfa/presentation/widgets/common/clamp_first_row.dart';
import 'package:bswfa/presentation/widgets/common/display_number_picker.dart';
import 'package:flutter/widgets.dart';

const List<int> kUnitsCount = <int>[0, 1, 2, 3, 4, 5, 6];

class UnitInput extends StatelessWidget {
  const UnitInput({
    required this.label, required this.startPosition, required this.onValueChanged, super.key,
  });

  final String label;
  final int startPosition;
  final void Function(int) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return ClampFirstRow(
      flex: 6,
      minWidth: 100.0,
      maxWidth: 100.0,
      firstChild: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 8.0),
          child: DisplayNumberPicker(
            datas: kUnitsCount,
            startPosition: startPosition,
            onValueChanged: onValueChanged,
          ),
        ),
      ],
    );
  }
}
