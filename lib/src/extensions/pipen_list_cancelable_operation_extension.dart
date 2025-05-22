import 'package:async/async.dart';

extension PipenListCancelableOperationExtension on List<CancelableOperation> {
  /// Cancel all operation from list
  void cancel() {
    for (CancelableOperation operation in this) {
      operation.cancel();
    }
  }

  /// Add operation to list and remove when is finish
  void addWait<T>(
    Future<T> future, {
    required Function(T result) onSuccess,
    Function(dynamic e, dynamic s)? onError,
  }) {
    CancelableOperation<T> operation = CancelableOperation.fromFuture(future);

    add(operation);
    int index = indexOf(operation);

    this[index].value
        .then((result) {
          onSuccess(result);
          removeAt(index);
        })
        .catchError((e, s) {
          onError?.call(e, s);
          removeAt(index);
        });
  }
}
