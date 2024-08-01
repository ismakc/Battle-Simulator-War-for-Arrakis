import 'package:flutter/material.dart';

class DisplayNumberPicker extends StatefulWidget {
  const DisplayNumberPicker({
    required this.datas, required this.startPosition, required this.onValueChanged, super.key,
  });

  final List<int> datas;
  final int? startPosition;
  final ValueChanged<int> onValueChanged;

  @override
  State<DisplayNumberPicker> createState() => _DisplayNumberPickerState();
}

class _DisplayNumberPickerState extends State<DisplayNumberPicker> {
  late int? _selectedPosition;

  @override
  void initState() {
    super.initState();
    _selectedPosition = widget.startPosition;
  }

  @override
  void didUpdateWidget(covariant DisplayNumberPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startPosition != oldWidget.startPosition) {
      setState(() {
        _selectedPosition = widget.startPosition;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.datas.asMap().entries.map((MapEntry<int, int> entry) {
        final int index = entry.key;
        final int number = entry.value;
        return GestureDetector(
          onTap: () {
            widget.onValueChanged(number);
            setState(() {
              _selectedPosition = number;
            });
          },
          child: Container(
            height: 40,
            width: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: index == _selectedPosition ? Colors.amber : Colors.black87,
              border: Border.all(color: index == _selectedPosition ? Colors.black87 : Colors.amber),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              number.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: index == _selectedPosition ? Colors.black87 : Colors.amber,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
