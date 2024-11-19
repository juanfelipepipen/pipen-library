import 'package:pipen/components/builders/builder/pipen_bloc_builder.dart';
import 'package:pipen/cubit/cubit_fetch.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';

typedef BlocFetchBuilder<B extends FetchBlocStreamable<S>, S> = PipenFetchBuilder<B, S>;

class PipenFetchBuilder<B extends StateStreamable<FetchState<S>>, S> extends StatelessWidget {
  const PipenFetchBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, FetchState<S> state, B bloc) builder;

  @override
  Widget build(BuildContext context) => PipenBlocBuilder<B, FetchState<S>>(
        builder: builder,
      );
}
