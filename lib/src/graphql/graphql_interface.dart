import 'package:pipen/src/graphql/base/graphql_types.dart';

abstract class GraphQlInterface<T> {
  /// GraphQl request query
  String get document;

  /// Callback for after request execution
  GraphqlSuccessResponse<T> get onSuccess;
}
