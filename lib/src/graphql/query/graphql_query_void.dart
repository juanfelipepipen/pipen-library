import 'package:pipen/graphql.dart';

abstract class GraphqlQueryVoid extends GraphqlQuery<void> {
  @override
  get onSuccess => (response) async {};
}
