import 'dart:async';

import 'package:pipen/graphql.dart';
import 'package:pipen/src/graphql/request_fail/graphql_exception_converter.dart';
import 'package:pipen/src/graphql/strategies/input_errors_strategy.dart';
import 'package:pipen/src/graphql/strategies/error_code_strategy.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

class GraphqlRequestFail {
  static final StreamController<Object> _controller =
      StreamController<Object>();

  static Stream<Object> get stream => _controller.stream;

  /// List of error strategies
  static final List<GraphqlExceptionConverter> _errors = [
    ErrorCodeStrategy(),
    InputErrorsStrategy(),
  ];

  /// Add errors decoders
  static void errors(List<GraphqlExceptionConverter> errors) {
    _errors.addAll(errors);
  }

  /// Decode exception
  static void decode(dynamic exception) {
    try {
      throw _errors
          .firstWhere((e) => e.isException(exception))
          .build(exception);
    } catch (e) {
      if (e is StateError) throw exception;
      _controller.add(e);
      rethrow;
    }
  }

  /// Print error output
  static void printOutError(OperationException exception) {
    final dots = Iterable.generate(25, (_) => '-');
    final String lines = dots.join() + dots.join();
    final title = 'GraphQL Exception';

    if (kDebugMode) {
      debugPrint('$lines $title $lines');
      debugPrint(DateTime.now().toIso8601String());
      debugPrint(exception.graphqlErrors.toString());
      debugPrint(lines + lines);
    }
  }
}
