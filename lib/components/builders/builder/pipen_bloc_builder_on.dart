import 'package:pipen/models/builder_model.dart';
import 'package:flutter/widgets.dart';

class PipenBlocBuilderOn<E> extends StatelessWidget {
  const PipenBlocBuilderOn({required this.builder, required this.child, this.difference, super.key});

  final Widget Function(E state) child;
  final BuilderModel builder;
  final Widget? difference;

  @override
  Widget build(BuildContext context) => builder.builder((context, state) {
        if (state is E) {
          return child.call(state as E);
        }
        return difference ?? SizedBox.shrink();
      });
}
