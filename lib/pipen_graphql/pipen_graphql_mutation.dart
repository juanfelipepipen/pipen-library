import 'package:graphql/client.dart';
import 'package:pipen/pipen_graphql/pipen_graphql_client.dart';
import 'package:pipen/pipen_graphql/graphql_interface.dart';
import 'package:pipen/pipen_graphql/pipen_graphql_error.dart';

abstract class PipenGraphqlMutation<T> implements GraphQlInterface<T> {
  /// [Getter] Get mutation options
  Future<MutationOptions<Object?>> get options async => MutationOptions(
        document: gql(document),
        variables: await variables,
      );

  /// [Event] Send request query
  Future<T> request() async {
    MutationOptions<Object?> options = await this.options;
    QueryResult result = await PipenGraphqlClient.client.mutate(options);

    try {
      if (result.exception case OperationException exception) {
        RequestFail.printOutError(exception);
        // RequestFail.decode(exception);
      }
      return await onSuccess(result.data ?? {});
    } catch (e) {
      rethrow;
    }
  }
}
