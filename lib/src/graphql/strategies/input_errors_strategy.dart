import 'package:pipen/src/graphql/request_fail/graphql_exception_strategy.dart';
import 'package:pipen/src/graphql/exceptions/graphql_validation_errors.dart';
import 'package:pipen/config/typedef.dart';
import 'package:graphql/client.dart';

class InputErrorsStrategy extends GraphqlExceptionStrategy {
  @override
  bool isException(exception) {
    if (exception is! OperationException) return false;
    if (exception.graphqlErrors.isEmpty) return false;
    return exception.graphqlErrors.first.extensions?['validation'] != null;
  }

  @override
  void build(exception) {
    List<RequestInputError> inputErrors = [];
    JsonMap validations = {};

    // Validate if response has validation errors list
    if (exception.graphqlErrors.first.extensions?['validation'] case JsonMap errors) {
      validations = errors;
    }

    // Map inputs from name
    for (String key in validations.keys) {
      // Map every input error and add to input error
      if (validations[key] case List<dynamic> errors) {
        if (errors.isNotEmpty) {
          inputErrors.add(
            RequestInputError(field: key, errors: errors.map<String>((e) => e.toString()).toList()),
          );
        }
      }
    }

    throw GraphqlValidationErrors(inputErrors);
  }
}
