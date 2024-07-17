import 'package:flutter/material.dart';

class LabeledBorderFieldset extends StatelessWidget {
  const LabeledBorderFieldset({
    super.key,
    required this.label,
    required this.borderColor,
    required this.textColor,
    required this.child,
  });

  final String label;
  final Color borderColor;
  final Color textColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6.0),
          padding: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 8.0, right: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: child,
        ),
        Positioned(
          top: 0,
          left: 20,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: RichText(
              text: TextSpan(
                text: label,
                style: TextStyle(
                  fontSize: 16.0,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
