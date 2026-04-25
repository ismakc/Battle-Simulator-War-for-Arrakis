import 'package:bswfa_core/legion/named_leader.dart';
import 'package:flutter/material.dart';

class NamedLeaderInput extends StatefulWidget {
  const NamedLeaderInput({
    required this.label,
    required this.values,
    required this.onValueChanged,
    super.key,
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
    final ThemeData theme = Theme.of(context);
    final List<Widget> leadersWidgets = NamedLeader.values.map((
      NamedLeader leader,
    ) {
      final bool isSelected = _values.contains(leader);
      return GestureDetector(
        onTap: () => _toggleLeaderSelection(leader),
        child: Container(
          height: 42,
          width: 58,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.amber : Colors.white,
            border: Border.all(
              color: isSelected ? Colors.black87 : Colors.black26,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            leader.combatProfile,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black87 : Colors.black87,
            ),
          ),
        ),
      );
    }).toList();

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                widget.label,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8.0),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(999.0),
                ),
                child: Text(
                  '${_values.length}',
                  style: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Wrap(spacing: 8.0, runSpacing: 8.0, children: leadersWidgets),
        ],
      ),
    );
  }
}
