import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipen/cubit/cubit_fetch.dart';

typedef BlocListenerFetch<B extends StateStreamable<FetchState<S>>, S>
    = BlocListener<B, FetchState<S>>;
