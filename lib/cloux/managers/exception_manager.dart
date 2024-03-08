import 'package:pipen/cloux/managers/form_errors_manager.dart';
import 'package:pipen/cloux/withs/on_error.dart';
import 'package:dio/dio.dart';

class ExceptionManager {
  ExceptionManager(this.exception);

  Object exception;

  /// Handle exception
  void handle(dynamic instance) {
    if (exception is DioException) {
      dioException(exception as DioException, instance);
    }
  }

  /// Dio exception
  void dioException(DioException ex, dynamic instance) {
    ExceptionOutput.details('RESPONSE BODY', ex.response?.data);

    /// On error
    if (instance is OnError && ex.response?.data != null) {
      (instance).onError.call(ex.response!.data);
    }

    /// Process 422 errors
    if (ex.response?.statusCode == 422 && ex.response?.data != null) {
      FormErrorsManager(ex.response!.data).handle();
    }
  }
}
