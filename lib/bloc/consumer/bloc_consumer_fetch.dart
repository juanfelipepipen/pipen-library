import 'package:pipen/bloc/consumer/bloc_consumer_p.dart';
import 'package:pipen/cubit/cubit_fetch.dart';
import 'package:bloc/bloc.dart';

typedef BlocConsumerFetch<B extends StateStreamable<FetchState<S>>, S>
    = BlocConsumerP<B, FetchState<S>>;
