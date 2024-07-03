import 'package:pipen/request_fail/pipen_request_fail_error.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

class PipenGraphqlRequestFail {
  static List<PipenRequestFailError> errors = [];

  /// Decode exception
  static decode(Object exception) {
    for (PipenRequestFailError error in errors) {
      bool valid = error.isException(exception);
      if (valid) {
        try {
          error.build(exception);
          throw exception;
        } catch (e) {
          rethrow;
        }
      }
    }

    throw exception;
  }

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
