import 'package:pipen/graphql/exceptions/graphql_client_not_found.dart';
import 'package:pipen/graphql/base/pipen_graphql_authentication.dart';
import 'package:graphql/client.dart';

class PipenGraphqlClient {
  /// Graphql client with auth credentials
  static Future<GraphQLClient> Function()? withAuth;

  /// Graphql client without authentication
  static Future<GraphQLClient> Function()? withoutAuth;

  /// Get the GraphQL client from parent instance
  static Future<GraphQLClient> getFromInstance(dynamic instance) async {
    GraphQLClient? client = await PipenGraphqlClient.withoutAuth?.call();

    if (instance is PipenGraphqlAuthentication) {
      client = await PipenGraphqlClient.withAuth?.call();
    }

    if (client == null) {
      throw GraphqlClientNotFound();
    }

    return client;
  }
}
