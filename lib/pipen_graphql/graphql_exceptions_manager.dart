import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

class GraphqlExceptionsManager {
  Map<String, dynamic> variables;
  QueryResult? result;
  Object request;

  GraphqlExceptionsManager(this.request, this.result, this.variables) {
    if (result?.exception != null) {
      manage();
    }
  }

  /// Determine exception to rethrow
  @protected
  void manage() {
    printOutError();

    // // GraphqlOnErrorEvent
    // if (result?.exception is OperationException && request is GraphqlOnErrorEvent) {
    //   (request as GraphqlOnErrorEvent).onError(result?.exception);
    // }
    //
    // // GraphqlOnErrorWithVariablesEvent
    // if (result?.exception is OperationException && request is GraphqlOnErrorWithVariablesEvent) {
    //   try {
    //     (request as GraphqlOnErrorWithVariablesEvent).onError(result?.exception, variables);
    //     throw GraphqlResultException(exception: result?.exception);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }
    //
    // // Not found resource
    // if (result?.exception?.graphqlErrors.first.message == 'NOT_FOUND') {
    //   throw GraphqlResourceNotFound();
    // }
    //
    // throw result?.exception ?? GraphqlResultException(exception: result?.exception);
  }

  /// Print error output
  @protected
  void printOutError() {
    if (kDebugMode) {
      print('-------------------------------- GraphQL Exception --------------------------------');
      print(DateTime.now().toIso8601String());
      print(result?.exception?.linkException.toString());
      print(result?.exception?.graphqlErrors);
      print('-----------------------------------------------------------------------------------');
    }
  }
}
