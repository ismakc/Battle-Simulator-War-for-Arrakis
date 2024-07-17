import 'package:flutter/cupertino.dart';

class Collapsable extends StatelessWidget {
  const Collapsable({
    super.key,
    required this.child,
    this.visible = true,
  });

  final Widget child;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainState: true,
      visible: visible,
      child: child,
    );
  }
}
