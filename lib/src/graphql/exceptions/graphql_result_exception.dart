import 'package:graphql/client.dart';

class GraphqlResultException implements Exception {
  OperationException? exception;

  GraphqlResultException({this.exception});
}
