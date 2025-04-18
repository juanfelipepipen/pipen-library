import 'package:pipen/src/graphql/base/graphql_requester.dart';
import 'package:pipen/src/graphql/pipen_graphql_response.dart';
import 'package:pipen/src/graphql/graphql_config.dart';
import 'package:graphql/client.dart';

abstract class GraphqlQuery<T> extends GraphqlRequester<T> {
  /// [Event] Send request query
  Future<T> request() async {
    final options = QueryOptions(document: gql(document), variables: await getVariables());
    final client = await GraphqlConfig.getFromInstance(this);
    final result = await client.query(options);

    try {
      final response = PipenGraphqlResponse<T>(instance: this, result: result);
      return await response.process(onSuccess);
    } catch (e) {
      rethrow;
    }
  }
}
