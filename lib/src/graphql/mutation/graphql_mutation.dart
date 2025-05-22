import 'package:pipen/src/graphql/graphql_response_decoder.dart';
import 'package:pipen/src/graphql/base/graphql_requester.dart';
import 'package:pipen/src/graphql/graphql_config.dart';
import 'package:graphql/client.dart';

abstract class GraphqlMutation<T> extends GraphqlRequester<T> {
  /// [Event] Send request query
  Future<T> request() async {
    final options = MutationOptions(document: getDocument(), variables: await getVariables());
    final client = await GraphqlConfig.getFromInstance(this);
    final result = await client.mutate(options);

    try {
      final response = GraphqlResponseDecoder<T>(instance: this, result: result);
      return await response.decode(onSuccess);
    } catch (e) {
      rethrow;
    }
  }
}
