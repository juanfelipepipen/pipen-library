import 'package:pipen/components/provider/pipen_bloc_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

class PipenBlocProviderListener<B extends StateStreamableSource<S>, S> extends StatelessWidget {
  PipenBlocProviderListener({
    super.key,
    this.init,
    this.child,
    this.builder,
    required this.create,
    required this.listener,
  }) {
    assert(child != null || builder != null);
  }

  final Widget Function(BuildContext context, S state, B bloc)? builder;
  final Function(BuildContext context, S state) listener;
  final Function(BuildContext context, B bloc)? init;
  final Create<B> create;
  final Widget? child;

  @override
  Widget build(BuildContext context) => PipenBlocProvider<B, S>(
        init: init,
        create: create,
        builder: (context, state, bloc) => BlocListener<B, S>(
          listener: listener,
          child: child ?? builder!.call(context, state, bloc),
        ),
      );
}
