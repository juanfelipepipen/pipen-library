import 'package:pipen/src/graphql/request_fail/graphql_exception_strategy.dart';
import 'package:pipen/src/graphql/exceptions/graphql_error_code.dart';
import 'package:graphql/client.dart';

class ErrorCodeStrategy extends GraphqlExceptionStrategy {
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
