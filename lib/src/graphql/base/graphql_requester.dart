import 'package:pipen/config/typedef.dart';
import 'package:graphql/client.dart';
import 'package:pipen/graphql.dart';
import 'package:gql/ast.dart';

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

    if (this case GraphqlDocumentVars documentVars) {
      return documentFrom(document: document, vars: documentVars.documentVars);
    }

    return gql(document);
  }

  /// Parse document with including document variables
  static DocumentNode documentFrom({required String document, JsonMap? vars}) {
    final params = vars ?? {};
    final regex = RegExp(r'\[\[(.*?)\]\]');
    final parsedDocument = document.replaceAllMapped(regex, (match) {
      final key = match.group(1);
      return params[key] ?? match.group(0)!;
    });
    return gql(parsedDocument);
  }

  /// Decode operation result or throw exception
  Future<T> decode(QueryResult result) async {
    return GraphqlResponseDecoder<T>(
      instance: this,
      result: result,
    ).decode(onSuccess);
  }
}
