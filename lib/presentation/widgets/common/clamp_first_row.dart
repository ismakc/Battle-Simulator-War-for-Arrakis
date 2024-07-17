import 'package:flutter/widgets.dart';

class ClampFirstRow extends StatelessWidget {
  const ClampFirstRow({
    super.key,
    required this.firstChild,
    required this.children,
    this.flex = 1,
    this.minWidth = 0.0,
    this.maxWidth = double.infinity,
  });

  final Widget firstChild;
  final List<Widget> children;
  final int flex;
  final double minWidth;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: (constraints.maxWidth / flex).clamp(minWidth, maxWidth),
              child: firstChild,
            ),
            ...children.map(
              (child) => Flexible(
                flex: flex,
                child: child,
              ),
            ),
          ],
        );
      },
    );
  }
}
