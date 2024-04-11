import 'package:flutter/material.dart';

class PipenInkWellContainer extends StatelessWidget {
  const PipenInkWellContainer({
    super.key,
    this.size,
    this.margin,
    this.padding,
    this.borderRadius,
    this.disabled = false,
    required this.child,
    required this.onTap,
  });

  final EdgeInsets? margin, padding;
  final BorderRadius? borderRadius;
  final VoidCallback onTap;
  final bool disabled;
  final Widget child;
  final double? size;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: disabled ? null : onTap,
          child: SizedBox(
            width: size,
            height: size,
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: child,
            ),
          ),
        ),
      );
}
