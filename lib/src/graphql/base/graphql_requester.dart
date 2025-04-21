import 'package:gql/ast.dart';
import 'package:graphql/client.dart';
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

  /// Get document with document vars support
  DocumentNode getDocument() {
    String document = this.document;

    if (this case GraphqlDocumentVars vars) {
      final params = vars.documentVars;
      final regex = RegExp(r'\[\[(.*?)\]\]');
      final parsedDocument = document.replaceAllMapped(regex, (match) {
        final key = match.group(1);
        return params[key] ?? match.group(0)!;
      });
      return gql(parsedDocument);
    }

    return gql(document);
  }
}
