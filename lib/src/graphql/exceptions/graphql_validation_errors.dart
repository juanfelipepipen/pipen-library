/// Validation inputs errors
class GraphqlValidationErrors implements Exception {
  const GraphqlValidationErrors(this.errors);

  final List<RequestInputError> errors;

  @override
  String toString() => errors.map((e) => '${e.field}: ${e.errors.first}').join('\n');
}

class RequestInputError {
  RequestInputError({required this.field, required this.errors});

  final String field;
  final List<String> errors;
}
