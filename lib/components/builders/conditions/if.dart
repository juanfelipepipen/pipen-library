import 'package:pipen/components/builders/conditions/pipen_build_if.dart';
import 'package:flutter/cupertino.dart';

class If extends StatelessWidget {
  const If({super.key, required this.condition, required this.child, this.def});

  final bool condition;
  final Widget child;
  final Widget? def;

  @override
  Widget build(BuildContext context) => PipenBuildIf(
        condition: condition,
        def: def,
        child: child,
      );
}
