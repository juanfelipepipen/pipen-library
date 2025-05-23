import 'package:pipen/src/graphql/request_fail/graphql_exception_strategy.dart';
import 'package:pipen/src/graphql/strategies/input_errors_strategy.dart';
import 'package:pipen/src/graphql/strategies/error_code_strategy.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

class GraphqlRequestFail {
  /// List of error strategies
  static final List<GraphqlExceptionStrategy> _errors = [
    ErrorCodeStrategy(),
    InputErrorsStrategy(),
  ];

  /// Add errors decoders
  static errors(List<GraphqlExceptionStrategy> errors) {
    _errors.addAll(errors);
  }

  /// Decode exception
  static decode(dynamic exception) {
    try {
      _errors.firstWhere((e) => e.isException(exception)).build(exception);
    } catch (e) {
      if (e is StateError) throw exception;
      rethrow;
    }
  }

  /// Print error output
  static printOutError(OperationException exception) {
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
