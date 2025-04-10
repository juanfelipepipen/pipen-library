import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipen/components/row/pipen_row.dart';

enum IconSide { left, right }

class PipenTextIcon extends StatelessWidget {
  const PipenTextIcon({
    super.key,
    this.spacing = 4,
    required this.icon,
    required this.text,
    required this.style,
  }) : side = IconSide.left;

  const PipenTextIcon.right({
    super.key,
    this.spacing = 4,
    required this.icon,
    required this.text,
    required this.style,
  }) : side = IconSide.right;

  final TextStyle? style;
  final double spacing;
  final IconSide side;
  final String text;
  final Icon icon;

  Icon get _icon {
    if (icon.color == null) {
      return Icon(icon.icon, size: icon.size, color: style?.color);
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) => PipenRow(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (side == IconSide.left) Padding(padding: EdgeInsets.only(right: 10), child: _icon),
      Text(text, style: style),
      if (side == IconSide.right) Padding(padding: EdgeInsets.only(left: 10), child: _icon),
    ],
  );
}
