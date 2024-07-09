import 'package:graphql/client.dart';

class PipenGraphqlClient {
  static GraphQLClient Function()? _builder;

  static GraphQLClient get client {
    if (_builder case GraphQLClient Function() builder) {
      return builder();
    }
    throw Exception('GraphQL client not available');
  }

  static set builder(GraphQLClient Function() builder) {
    _builder = builder;
  }
}
