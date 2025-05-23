import 'package:pipen/src/graphql/base/graphql_response_output.dart';
import 'package:pipen/src/graphql/graphql_request_fail.dart';
import 'package:pipen/src/graphql/base/graphql_types.dart';
import 'package:json_pretty/json_pretty.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'dart:convert';

class GraphqlResponseDecoder<T> {
  GraphqlResponseDecoder({required this.result, required this.instance});

  final QueryResult result;
  final dynamic instance;

  Future<T> decode(GraphqlSuccessResponse<T> onSuccess) async {
    _process();
    return await onSuccess(result.data ?? {});
  }

  /// Handle result process
  void _process() {
    if (result.exception case OperationException exception) {
      _exception(exception);
    } else {
      _output(result.data);
    }
  }

  /// Process exception
  void _exception(OperationException exception) {
    GraphqlRequestFail.printOutError(exception);
    GraphqlRequestFail.decode(exception);
  }

  /// Output response
  void _output(Map<dynamic, dynamic>? response) {
    if (instance is GraphqlResponseOutput && response != null) {
      debugPrint(prettyPrintJson(jsonEncode(response)));
    }
  }
}
