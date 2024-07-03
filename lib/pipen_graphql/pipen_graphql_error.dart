import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

class RequestFail {
  /// Decode exception
  // static decode(Object exception) {
  //   List<RequestFailError> errors = [
  //     RequestFailErrorSessionExpired(),
  //     RequestFailErrorInputException(),
  //   ];
  //
  //   for (RequestFailError error in errors) {
  //     bool valid = error.isException(exception);
  //     if (valid) {
  //       try {
  //         error.build(exception);
  //       } catch (e) {
  //         RequestFailService.handle(e);
  //         rethrow;
  //       }
  //     }
  //   }
  //
  //   throw exception;
  // }

  /// Print error output
  static printOutError(OperationException exception) {
    if (kDebugMode) {
      print('-------------------------------- GraphQL Exception --------------------------------');
      print(DateTime.now().toIso8601String());
      print(exception.linkException.toString());
      print(exception.graphqlErrors);
      print('-----------------------------------------------------------------------------------');
    }
  }
}
