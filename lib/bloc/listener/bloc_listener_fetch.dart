import 'package:pipen/bloc/listen/bloc_listen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipen/cubit/cubit_fetch.dart';

class BlocListenerFetch<B extends StateStreamable<FetchState<S>>, S>
    extends BlocListenerBase<B, FetchState<S>> {
  BlocListenerFetch({
    super.key,
    super.bloc,
    super.child,
    super.listenWhen,
    required BlocListen<FetchState<S>> listener,
  }) : super(
          listener: (context, state) {
            listener.handle(listen: (context, state));
          },
        );
}
