import 'package:flutter/cupertino.dart';
import 'package:pipen/components.dart';

class PipenRowExpanded extends StatelessWidget {
  const PipenRowExpanded({super.key, required this.spacing, required this.children});

  final double spacing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => PipenRow(
        spacing: spacing,
        listable: children.map((e) => Expanded(child: e)),
      );
}
