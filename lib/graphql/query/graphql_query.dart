import 'package:pipen/graphql/pipen_graphql_response.dart';
import 'package:pipen/graphql/pipen_graphql_client.dart';
import 'package:pipen/graphql/graphql_interface.dart';
import 'package:graphql/client.dart';

abstract class GraphqlQuery<T> implements GraphQlInterface<T> {
  /// Get query options
  Future<QueryOptions<Object?>> get options async => QueryOptions(
        document: gql(document),
        variables: await variables,
      );

  /// Execute query
  Future<T> request() async {
    QueryOptions<Object?> options = await this.options;
    GraphQLClient client = await PipenGraphqlClient.getFromInstance(this);
    QueryResult result = await client.query(options);

    try {
      PipenGraphqlResponse response = PipenGraphqlResponse<T>(instance: this, result: result);
      return await response.process(onSuccess);
    } catch (e) {
      rethrow;
    }
  }
}
