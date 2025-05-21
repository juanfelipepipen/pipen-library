import 'package:pipen/src/graphql/base/graphql_types.dart';

/// Set the document variables from a map
abstract class GraphqlVariables {
  GraphqlParams get variables;
}
