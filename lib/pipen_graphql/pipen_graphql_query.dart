import 'package:graphql/client.dart';
import 'package:pipen/pipen_graphql/pipen_graphql_client.dart';
import 'package:pipen/pipen_graphql/graphql_interface.dart';
import 'package:pipen/pipen_graphql/pipen_graphql_error.dart';

abstract class PipenGraphqlQuery<T> implements GraphQlInterface<T> {
  /// Get query options
  Future<QueryOptions<Object?>> get options async => QueryOptions(
        document: gql(document),
        variables: await variables,
      );

  /// Execute query
  Future<T> request() async {
    QueryOptions<Object?> options = await this.options;
    QueryResult result = await PipenGraphqlClient.client.query(options);

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
