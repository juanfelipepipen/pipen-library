import 'package:pipen/request_fail/pipen_request_fail_error.dart';
import 'package:graphql/client.dart';
import 'package:pipen/src/graphql/exceptions/graphql_error_code.dart';

class ErrorCodeStrategy extends PipenRequestFailError {
  @override
  bool isException(exception) {
    if (exception is! OperationException) return false;
    if (exception.graphqlErrors.isEmpty) return false;
    return exception.graphqlErrors.first.extensions?['reason'] == 'ERROR_CODE';
  }

  @override
  void build(exception) {
    exception = exception as OperationException;
    String errorCode = exception.graphqlErrors.first.message;
    throw GraphqlErrorCode(errorCode);
  }
}
