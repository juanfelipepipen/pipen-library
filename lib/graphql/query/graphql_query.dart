import 'package:pipen/graphql/pipen_graphql_response.dart';
import 'package:pipen/graphql/pipen_graphql_client.dart';
import 'package:pipen/graphql/graphql_interface.dart';
import 'package:graphql/client.dart';

abstract class GraphqlQuery<T> implements GraphQlInterface<T> {
  /// [Event] Send request query
  Future<T> request() async {
    final options = QueryOptions(document: gql(document), variables: await getVariables());
    final client = await PipenGraphqlClient.getFromInstance(this);
    final result = await client.query(options);

    try {
      final response = PipenGraphqlResponse<T>(instance: this, result: result);
      return await response.process(onSuccess);
    } catch (e) {
      rethrow;
    }
  }
}
