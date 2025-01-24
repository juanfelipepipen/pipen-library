import 'package:pipen/graphql/query/graphql_query.dart';

abstract class GraphqlQueryVoid extends GraphqlQuery<void> {
  @override
  get onSuccess => (params) async {};
}
