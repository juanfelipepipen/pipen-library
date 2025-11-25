import 'package:pipen/src/graphql/base/graphql_requester.dart';
import 'package:pipen/src/graphql/graphql_config.dart';
import 'package:graphql/client.dart';

abstract class GraphqlMutation<T> extends GraphqlRequester<T> {
  /// [Event] Send request query
  Future<T> request() async {
    final options = MutationOptions(
      document: getDocument(),
      variables: await getVariables(),
    );
    final client = await GraphqlConfig.getFromInstance(this);
    final result = await client.mutate(options);
    return await decode(result);
  }
}
