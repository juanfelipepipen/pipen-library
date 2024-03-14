import 'package:pipen/components/builders/builder/pipen_bloc_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';

class PipenBlocProvider<B extends StateStreamableSource<S>, S> extends StatelessWidget {
  const PipenBlocProvider({super.key, required this.create, this.builder, this.child, this.init});

  final Widget Function(BuildContext context, S state, B bloc)? builder;
  final Function(BuildContext context, B bloc)? init;
  final Create<B> create;
  final Widget? child;

  @override
  Widget build(BuildContext context) => BlocProvider<B>(
        lazy: false,
        create: create,
        child: PipenBlocBuilder<B, S>(
          init: init,
          builder: builder,
          child: child,
        ),
      );
}
