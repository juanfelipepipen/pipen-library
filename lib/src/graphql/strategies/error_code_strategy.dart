import 'package:pipen/src/graphql/request_fail/graphql_exception_converter.dart';
import 'package:pipen/src/graphql/exceptions/graphql_error_code.dart';
import 'package:graphql/client.dart';

class ErrorCodeStrategy extends GraphqlExceptionConverter {
  @override
  bool isException(exception) {
    if (exception is! OperationException) return false;
    if (exception.graphqlErrors.isEmpty) return false;
    return exception.graphqlErrors.first.extensions?['reason'] == 'ERROR_CODE';
  }

  @override
  Exception build(exception) {
    exception = exception as OperationException;
    String errorCode = exception.graphqlErrors.first.message;
    return GraphqlErrorCode(errorCode);
  }
}
