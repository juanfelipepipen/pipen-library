class GraphqlInputErrorException implements Exception {
  GraphqlInputErrorException({required this.code});

  String code;

  @override
  String toString() => 'Graphql error code: $code';
}
