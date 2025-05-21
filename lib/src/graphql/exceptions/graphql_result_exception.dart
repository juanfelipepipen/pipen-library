import 'package:graphql/client.dart';

class GraphqlResultException implements Exception {
  GraphqlResultException({this.exception});

  final OperationException? exception;
}
