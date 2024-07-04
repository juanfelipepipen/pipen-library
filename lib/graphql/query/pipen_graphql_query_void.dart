import 'package:pipen/graphql/query/pipen_graphql_query.dart';

abstract class PipenGraphqlQueryVoid extends PipenGraphqlQuery<void> {
  @override
  get onSuccess => (params) async {};
}
