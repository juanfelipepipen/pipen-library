import 'package:pipen/graphql/mutation/graphql_mutation.dart';

abstract class GraphqlMutationVoid extends GraphqlMutation<void> {
  @override
  get onSuccess => (params) async {};
}
