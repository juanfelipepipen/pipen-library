import 'package:pipen/bloc/builder/bloc_builder.dart';
import 'package:pipen/cubit/cubit_fetch.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';

class BlocBuilderFetch<B extends StateStreamable<FetchState<S>>, S> extends StatelessWidget {
  const BlocBuilderFetch({super.key, required this.builder});

  final Widget Function(BuildContext context, FetchState<S> state, B bloc) builder;

  @override
  Widget build(BuildContext context) => BlocBuilder<B, FetchState<S>>(
        builder: builder,
      );
}
