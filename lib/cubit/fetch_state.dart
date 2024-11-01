part of 'cubit_fetch.dart';

@immutable
sealed class FetchState<R> {}

final class FetchLoading<R> extends FetchState<R> implements LoadingState {}

final class FetchPending<R> extends FetchState<R> {}

final class FetchSuccess<R> extends FetchState<R> {
  FetchSuccess(this.result);

  final R result;

  FetchSuccess<R> copy(R result) => FetchSuccess<R>(result);
}

final class FetchFail<R> extends FetchState<R> implements FailState {
  FetchFail(this.fail);

  @override
  final FailResult fail;
}

abstract class InitOnFetchPending {}
