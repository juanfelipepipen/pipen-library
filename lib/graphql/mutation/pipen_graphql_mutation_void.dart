import 'package:pipen/graphql/mutation/pipen_graphql_mutation.dart';

abstract class PipenGraphqlMutationVoid extends PipenGraphqlMutation {
  @override
  get onSuccess => (params) async {};
}
