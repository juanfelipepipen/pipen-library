import 'package:flutter/material.dart';

class PipenInkWellContainer extends StatelessWidget {
  const PipenInkWellContainer({
    super.key,
    this.size,
    this.margin,
    this.padding,
    this.borderRadius,
    required this.child,
    required this.onTap,
  });

  final EdgeInsets? margin, padding;
  final BorderRadius? borderRadius;
  final VoidCallback onTap;
  final Widget child;
  final double? size;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
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
