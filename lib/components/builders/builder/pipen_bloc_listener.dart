import 'package:pipen/components/builders/builder/pipen_bloc_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

class PipenBlocListener<B extends StateStreamable<S>, S> extends StatelessWidget {
  PipenBlocListener({this.builder, this.child, required this.listener, super.key}) {
    assert(builder != null || child != null);
  }

  final Widget Function(BuildContext context, S state, B bloc)? builder;
  final BlocWidgetListener<S> listener;
  final Widget? child;

  @override
  Widget build(BuildContext context) => BlocListener<B, S>(
        listener: listener,
        child: child ??
            PipenBlocBuilder<B, S>(
              builder: builder,
            ),
      );
}
