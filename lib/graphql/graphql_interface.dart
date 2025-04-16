import 'package:pipen/config/typedef.dart';
import 'package:pipen/graphql/base/graphql_types.dart';
import 'package:pipen/graphql/base/graphql_variables.dart';
import 'package:pipen/graphql/pipen_graphql_client.dart';

abstract class GraphQlInterface<T> {
  /// GraphQl request query
  String get document;

  /// Callback for after request execution
  GraphqlSuccessResponse<T> get onSuccess;

  /// Get request variables
  Future<JsonMap> getVariables() async {
    JsonMap variables = {};
    final paramsInterceptor = PipenGraphqlClient.paramsInterceptor;

    if (this case GraphqlVariables graphqlVariables) {
      variables = await graphqlVariables.variables;
    }

    if (paramsInterceptor != null) {
      final variablesIntercepted = paramsInterceptor(variables, this);
      variables = {...variables, ...variablesIntercepted};
    }
    return variables;
  }
}
