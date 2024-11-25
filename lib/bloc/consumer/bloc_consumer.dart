import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter/widgets.dart';

class BlocConsumer<B extends bloc.StateStreamable<S>, S> extends StatelessWidget {
  const BlocConsumer({required this.builder, required this.listener, super.key});

  final Widget Function(BuildContext context, S state, B bloc) builder;
  final bloc.BlocWidgetListener<S> listener;

  @override
  Widget build(BuildContext context) => bloc.BlocConsumer<B, S>(
        listener: listener,
        builder: (context, state) {
          final bloc = context.read<B>();
          return builder.call(context, state, bloc);
        },
      );
}
