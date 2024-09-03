import 'package:flutter/widgets.dart';
import 'package:vibration/vibration.dart';

class PipenGestureTap extends StatelessWidget {
  const PipenGestureTap({
    super.key,
    this.onTap,
    required this.child,
    this.disabled = false,
    this.margin = EdgeInsets.zero,
  }) : vibrate = false;

  const PipenGestureTap.vibrate({
    super.key,
    this.onTap,
    required this.child,
    this.disabled = false,
    this.margin = EdgeInsets.zero,
  }) : vibrate = true;

  final bool disabled, vibrate;
  final Function()? onTap;
  final EdgeInsets margin;
  final Widget child;

  /// On gesture tap
  void _onTap() {
    if (!disabled) {
      onTap?.call();

      if (vibrate) {
        Vibration.vibrate(duration: 50);
      }
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _onTap,
        behavior: HitTestBehavior.translucent,
        child: Padding(
          padding: margin,
          child: child,
        ),
      );
}
