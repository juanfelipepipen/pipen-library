import 'package:pipen/graphql.dart';

abstract class GraphqlMutationVoid extends GraphqlMutation<void> {
  @override
  get onSuccess => (response) async {};
}
