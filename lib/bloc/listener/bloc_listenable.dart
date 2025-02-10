import 'package:pipen/bloc/listen/bloc_listen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenable<B extends StateStreamable<S>, S> extends BlocListenerBase<B, S> {
  BlocListenable({
    super.key,
    super.bloc,
    super.child,
    super.listenWhen,
    required BlocListen<S> listener,
  }) : super(listener: (context, state) {
          listener.handle(listen: (context, state));
        });
}
