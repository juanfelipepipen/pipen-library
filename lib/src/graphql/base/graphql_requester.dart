import 'package:pipen/config/typedef.dart';
import 'package:pipen/graphql.dart';

abstract class GraphqlRequester<T> extends GraphQlInterface<T> {
  /// Get request variables
  Future<JsonMap> getVariables() async {
    JsonMap variables = {};
    final paramsInterceptor = GraphqlConfig.paramsInterceptor;

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
