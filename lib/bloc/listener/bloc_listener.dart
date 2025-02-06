import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:pipen/bloc/builder/bloc_builder_p.dart';
import 'package:flutter/widgets.dart';

class BlocListenerP<B extends bloc.StateStreamable<S>, S> extends StatelessWidget {
  BlocListenerP({this.builder, this.child, required this.listener, super.key}) {
    assert(builder != null || child != null);
  }

  final Widget Function(BuildContext context, S state, B bloc)? builder;
  final bloc.BlocWidgetListener<S> listener;
  final Widget? child;

  @override
  Widget build(BuildContext context) => BlocListenerP<B, S>(
        listener: listener,
        child: child ??
            BlocBuilderP<B, S>(
              builder: builder,
            ),
      );
}
