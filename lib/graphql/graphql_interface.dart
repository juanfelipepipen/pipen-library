import 'package:pipen/graphql/base/graphql_types.dart';

abstract class GraphQlInterface<T> {
  /// GraphQl request query
  String get document;

  /// GraphQl params by reference
  GraphqlParams get variables;

  /// Callback for after request execution
  GraphqlSuccessResponse<T> get onSuccess;
}
