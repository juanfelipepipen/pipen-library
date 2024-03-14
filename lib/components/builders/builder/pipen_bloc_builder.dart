import 'package:pipen/components/builders/container/pipen_builder_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

class PipenBlocBuilder<B extends StateStreamable<S>, S> extends StatelessWidget {
  final Widget Function(BuildContext context, S state, B bloc)? builder;
  final Function(BuildContext context, B bloc)? init;
  final Widget? child;

  PipenBlocBuilder({required this.builder, this.init, super.key, this.child}) {
    assert(child != null || builder != null);
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<B, S>(
        builder: (context, state) => PipenBuilderContainer(
          init: () => init?.call(context, context.read<B>()),
          child: child ?? builder!.call(context, state, context.read<B>()),
        ),
      );
}
