import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

class PipenBuilderNullable<B extends StateStreamable<S>, S, O> extends StatelessWidget {
  const PipenBuilderNullable({super.key, required this.builder});

  final Function(BuildContext context, O? state, B bloc) builder;

  @override
  Widget build(BuildContext context) => BlocBuilder<B, S>(
        builder: (context, state) => builder(
          context,
          state is O ? state as O : null,
          context.read<B>(),
        ),
      );
}
