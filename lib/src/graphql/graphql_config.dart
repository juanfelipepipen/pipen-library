import 'dart:async';

import 'package:pipen/src/graphql/exceptions/graphql_client_not_found.dart';
import 'package:pipen/src/graphql/base/graphql_authenticate.dart';
import 'package:pipen/src/graphql/base/graphql_timeout.dart';
import 'package:pipen/config/typedef.dart';
import 'package:graphql/client.dart';

class GraphqlConfig {
  /// Graphql clients with auth and without credentials
  static Future<GraphQLClient> Function()? withAuth, withoutAuth;

  /// Intercept params previous to send request
  static JsonMap Function(JsonMap params, dynamic instance)? paramsInterceptor;

  /// Default timeout
  static Duration defaultTimeout = Duration(seconds: 5);

  /// Get the GraphQL client from parent instance
  static Future<GraphQLClient> getFromInstance(dynamic instance) async {
    GraphQLClient? client;
    Duration? timeout;

    /// Get client with auth or without
    if (instance is GraphqlAuthenticate) {
      client = await GraphqlConfig.withAuth?.call();
    } else {
      client = await GraphqlConfig.withoutAuth?.call();
    }

    /// GraphQL client not found
    if (client == null) throw GraphqlClientNotFound();

    /// Custom timeout duration
    if (instance case GraphqlTimeout graphqlTimeout) {
      timeout = graphqlTimeout.duration;
    } else {
      timeout = client.queryManager.requestTimeout;
    }

    return GraphQLClient(
      link: client.link,
      cache: client.cache,
      defaultPolicies: client.defaultPolicies,
      queryRequestTimeout: timeout ?? defaultTimeout,
    );
  }
}
