import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:pipen/bloc/builder/bloc_builder.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

class BlocProvider<B extends bloc.StateStreamableSource<S>, S> extends StatelessWidget {
  const BlocProvider({super.key, required this.create, this.builder, this.child, this.init});

  final Widget Function(BuildContext context, S state, B bloc)? builder;
  final Function(BuildContext context, B bloc)? init;
  final Create<B> create;
  final Widget? child;

  @override
  Widget build(BuildContext context) => bloc.BlocProvider<B>(
        lazy: false,
        create: create,
        child: BlocBuilder<B, S>(
          init: init,
          builder: builder,
          child: child,
        ),
      );
}
