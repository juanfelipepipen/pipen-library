import 'package:async/async.dart';

extension ListCancelableOperationExtension on List<CancelableOperation> {
  /// Cancel all operation from list
  void cancel() {
    for (CancelableOperation operation in this) {
      operation.cancel();
    }
  }
}
