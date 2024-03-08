import 'package:flutter/widgets.dart';

class PipenGestureTap extends StatelessWidget {
  const PipenGestureTap({
    super.key,
    this.onTap,
    this.disabled = false,
    this.margin = EdgeInsets.zero,
    required this.child,
  });

  final Function()? onTap;
  final EdgeInsets margin;
  final bool disabled;
  final Widget child;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: disabled ? () {} : onTap,
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: margin,
          child: child,
        ),
      );
}
