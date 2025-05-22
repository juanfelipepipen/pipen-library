import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components.dart';

enum IconSide { left, right }

class PipenTextIcon extends StatelessWidget {
  const PipenTextIcon({
    super.key,
    this.horizontal,
    this.spacing = 4,
    required this.icon,
    required this.text,
    required this.style,
  }) : side = IconSide.left;

  const PipenTextIcon.right({
    super.key,
    this.horizontal,
    this.spacing = 4,
    required this.icon,
    required this.text,
    required this.style,
  }) : side = IconSide.right;

  final MainAxisAlignment? horizontal;
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
    horizontal: horizontal,
    mainAxisSize: MainAxisSize.min,
    vertical: CrossAxisAlignment.center,
    children: [
      if (side == IconSide.left) Padding(padding: EdgeInsets.only(right: 10), child: _icon),
      Flexible(child: Text(text, style: style)),
      if (side == IconSide.right) Padding(padding: EdgeInsets.only(left: 10), child: _icon),
    ],
  );
}
