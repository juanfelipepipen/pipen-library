import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipen/cubit/cubit_fetch.dart';

// class BlocListenerFetch<B extends StateStreamable<FetchState<S>>, S> extends BlocListener<B, FetchState<S>> {
//   const BlocListenerFetch({super.key, required super.child, required super.listener});
// }

typedef BlocListenerFetch<B extends StateStreamable<FetchState<S>>, S>
    = BlocListener<B, FetchState<S>>;
