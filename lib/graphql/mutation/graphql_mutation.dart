import 'package:pipen/graphql/pipen_graphql_response.dart';
import 'package:pipen/graphql/pipen_graphql_client.dart';
import 'package:pipen/graphql/graphql_interface.dart';
import 'package:graphql/client.dart';

abstract class GraphqlMutation<T> implements GraphQlInterface<T> {
  /// [Getter] Get mutation options
  Future<MutationOptions<Object?>> get options async => MutationOptions(
        document: gql(document),
        variables: await variables,
      );

  /// [Event] Send request query
  Future<T> request() async {
    MutationOptions<Object?> options = await this.options;
    GraphQLClient client = await PipenGraphqlClient.getFromInstance(this);
    QueryResult result = await client.mutate(options);

    try {
      PipenGraphqlResponse response = PipenGraphqlResponse<T>(instance: this, result: result);
      return await response.process(onSuccess);
    } catch (e) {
      rethrow;
    }
  }
}
