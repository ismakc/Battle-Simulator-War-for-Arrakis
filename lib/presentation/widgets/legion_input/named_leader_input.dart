import 'package:bswfa/domain/legion/named_leader.dart';
import 'package:bswfa/presentation/widgets/common/clamp_first_row.dart';
import 'package:flutter/material.dart';

class NamedLeaderInput extends StatefulWidget {
  const NamedLeaderInput({
    required this.label, required this.values, required this.onValueChanged, super.key,
  });

  final String label;
  final List<NamedLeader> values;

  final void Function(List<NamedLeader>) onValueChanged;

  @override
  State<NamedLeaderInput> createState() => _NamedLeaderInputState();
}

class _NamedLeaderInputState extends State<NamedLeaderInput> {
  late List<NamedLeader> _values;

  @override
  void initState() {
    super.initState();
    _values = List<NamedLeader>.from(widget.values);
  }

  @override
  void didUpdateWidget(covariant NamedLeaderInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.values != oldWidget.values) {
      setState(() {
        _values = List<NamedLeader>.from(widget.values);
      });
    }
  }

  void _toggleLeaderSelection(NamedLeader leader) {
    setState(() {
      final List<NamedLeader> newList = List<NamedLeader>.from(_values);
      if (newList.contains(leader)) {
        newList.remove(leader);
      } else {
        newList.add(leader);
      }
      _values = newList;
    });
    widget.onValueChanged(_values);
  }

  @override
  Widget build(BuildContext context) {
    final List<GestureDetector> leadersWidgets = NamedLeader.values.map((NamedLeader leader) {
      final bool isSelected = _values.contains(leader);
      return GestureDetector(
        onTap: () => _toggleLeaderSelection(leader),
        child: Container(
          height: 40,
          width: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.amber : Colors.black87,
            border: Border.all(
              color: isSelected ? Colors.black87 : Colors.amber,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            leader.displayAsString,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black87 : Colors.amber,
            ),
          ),
        ),
      );
    }).toList();

    return ClampFirstRow(
      flex: 5,
      minWidth: 100.0,
      maxWidth: 100.0,
      firstChild: const Text('Named', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 8.0),
          child: _buildFlexibleRows(context, leadersWidgets),
        ),
      ],
    );
  }

  Widget _buildFlexibleRows(BuildContext context, List<Widget> children) {
    final int midpoint = (children.length / 2).ceil();
    final List<Widget> firstRowChildren = children.sublist(0, midpoint);
    final List<Widget> secondRowChildren = children.sublist(midpoint);

    return Wrap(
      runSpacing: 3.0,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: firstRowChildren,
        ),
        if (secondRowChildren.isNotEmpty)
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: secondRowChildren),
      ],
    );
  }
}
