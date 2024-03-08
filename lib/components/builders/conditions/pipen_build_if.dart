import 'package:flutter/widgets.dart';

class PipenBuildIf extends StatelessWidget {
  const PipenBuildIf({super.key, required this.condition, required this.child, this.def});

  final bool condition;
  final Widget child;
  final Widget? def;

  @override
  Widget build(BuildContext context) => condition ? child : def ?? const SizedBox.shrink();
}
