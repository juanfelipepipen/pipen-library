import 'package:flutter/material.dart';

class PipenDivider extends StatelessWidget {
  const PipenDivider({
    super.key,
    this.color,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
  });

  final EdgeInsets margin, padding;
  final Color? color;

  @override
  Widget build(BuildContext context) => Container(
        height: 1,
        margin: margin,
        padding: padding,
        color: color ?? Theme.of(context).colorScheme.secondary.withOpacity(0.08),
      );
}
