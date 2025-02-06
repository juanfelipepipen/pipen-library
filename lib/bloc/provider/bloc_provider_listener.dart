import 'package:flutter_bloc/flutter_bloc.dart' as flutter_bloc;
import 'package:pipen/bloc/provider/bloc_provider_p.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

class BlocProviderListener<B extends flutter_bloc.StateStreamableSource<S>, S>
    extends StatelessWidget {
  BlocProviderListener({
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
  Widget build(BuildContext context) => BlocProviderP<B, S>(
        init: init,
        create: create,
        builder: (context, state, bloc) => flutter_bloc.BlocListener<B, S>(
          listener: listener,
          child: child ?? builder!.call(context, state, bloc),
        ),
      );
}
