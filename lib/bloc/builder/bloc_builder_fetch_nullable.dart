import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipen/cubit/cubit_fetch.dart';
import 'package:flutter/cupertino.dart';

typedef BlocFetchBuilderNullable<B extends FetchBlocStreamable<S>, S>
    = BlocBuilderFetchNullable<B, S>;

class BlocBuilderFetchNullable<B extends FetchBlocStreamable<S>, S> extends StatelessWidget {
  const BlocBuilderFetchNullable({super.key, required this.builder});

  final Function(BuildContext context, FetchState<S> state, B bloc, S? result) builder;

  @override
  Widget build(BuildContext context) => BlocBuilder<B, FetchState<S>>(
        builder: (context, state) => builder(
          context,
          state,
          context.read<B>(),
          state is FetchSuccess<S> ? (state).result : null,
        ),
      );
}
