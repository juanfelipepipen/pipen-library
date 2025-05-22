import 'package:flutter/widgets.dart';

class PipenBuildNullable<E> extends StatelessWidget {
  const PipenBuildNullable({super.key, required this.builder, required this.state});

  final Widget Function(BuildContext context, E? state) builder;
  final Object? state;

  @override
  Widget build(BuildContext context) => builder(context, state is E ? state as E : null);
}
