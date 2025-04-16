import 'package:pipen/graphql/base/graphql_variables.dart';
import 'package:pipen/graphql/base/graphql_types.dart';
import 'package:pipen/graphql/graphql_config.dart';
import 'package:pipen/config/typedef.dart';

abstract class GraphQlInterface<T> {
  /// GraphQl request query
  String get document;

  /// Callback for after request execution
  GraphqlSuccessResponse<T> get onSuccess;
}
