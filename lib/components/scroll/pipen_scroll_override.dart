import 'package:flutter/material.dart';

class PipenScrollOverride extends StatelessWidget {
  const PipenScrollOverride({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
    behavior: const ScrollBehavior(),
    child: GlowingOverscrollIndicator(
      showLeading: false,
      showTrailing: false,
      axisDirection: AxisDirection.down,
      color: Colors.black.withValues(alpha: 0.6),
      child: child,
    ),
  );
}
