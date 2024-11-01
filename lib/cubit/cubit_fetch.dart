import 'package:pipen/abstract/loading_state.dart';
import 'package:pipen/abstract/fail_state.dart';
import 'package:pipen/models/fail_result.dart';
import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fetch_state.dart';

part 'cubit_fetch_resolver.dart';

abstract class CubitFetch<R> extends Cubit<FetchState<R>> {
  CubitFetch({bool pending = false}) : super(pending ? FetchPending<R>() : FetchLoading<R>());

  bool init = false;

  @protected
  Future<R> get resolver;

  CancelableOperation<R>? _resolver;

  /// Fetch resolver
  void fetch() {
    if (state is! LoadingState || !init) {
      init = true;
      emit(FetchLoading<R>());
      _resolver = CancelableOperation.fromFuture(resolver);
      _resolver?.value.then((result) {
        emit(FetchSuccess<R>(result));
      }).catchError((e, s) {
        emit(FetchFail<R>(FailResult(e, s)));
      });
    }
  }

  @override
  Future<void> close() {
    _resolver?.cancel();
    return super.close();
  }
}

abstract class CubitFetchPending<R> extends CubitFetch<R> {
  CubitFetchPending() : super(pending: true);
}
