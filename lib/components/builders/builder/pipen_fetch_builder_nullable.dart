import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipen/cubit/cubit_fetch.dart';
import 'package:flutter/cupertino.dart';

typedef BlocFetchBuilderNullable<B extends FetchBlocStreamable<S>, S>
    = PipenFetchBuilderNullable<B, S>;

class PipenFetchBuilderNullable<B extends FetchBlocStreamable<S>, S> extends StatelessWidget {
  const PipenFetchBuilderNullable({super.key, required this.builder});

  final Function(BuildContext context, S? state, B bloc) builder;

  @override
  Widget build(BuildContext context) => BlocBuilder<B, FetchState<S>>(
        builder: (context, state) => builder(
          context,
          state is FetchSuccess<S> ? (state).result : null,
          context.read<B>(),
        ),
      );
}
