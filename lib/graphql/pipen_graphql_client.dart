import 'package:pipen/graphql/exceptions/graphql_client_not_found.dart';
import 'package:pipen/graphql/base/graphql_authenticate.dart';
import 'package:pipen/graphql/base/graphql_timeout.dart';
import 'package:graphql/client.dart';

class PipenGraphqlClient {
  /// Graphql clients with auth and without credentials
  static Future<GraphQLClient> Function()? withAuth, withoutAuth;

  /// Get the GraphQL client from parent instance
  static Future<GraphQLClient> getFromInstance(dynamic instance) async {
    Duration timeout = Duration(seconds: 5);
    GraphQLClient? client;

    if (instance is GraphqlAuthenticate) {
      client = await PipenGraphqlClient.withAuth?.call();
    } else {
      client = await PipenGraphqlClient.withoutAuth?.call();
    }

    /// GraphQL client not found
    if (client == null) throw GraphqlClientNotFound();

    /// Custom timeout duration
    if (instance case GraphqlTimeout graphqlTimeout) {
      timeout = graphqlTimeout.duration;
    }

    return GraphQLClient(
      link: client.link,
      cache: client.cache,
      queryRequestTimeout: timeout,
      defaultPolicies: client.defaultPolicies,
    );
  }
}
