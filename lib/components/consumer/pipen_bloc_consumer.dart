import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

class PipenBlocConsumer<B extends StateStreamable<S>, S> extends StatelessWidget {
  const PipenBlocConsumer({required this.builder, required this.listener, super.key});

  final Widget Function(BuildContext context, S state, B bloc) builder;
  final BlocWidgetListener<S> listener;

  @override
  Widget build(BuildContext context) => BlocConsumer<B, S>(
        listener: listener,
        builder: (context, state) {
          final bloc = context.read<B>();
          return builder.call(context, state, bloc);
        },
      );
}
