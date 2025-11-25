abstract class GraphqlExceptionConverter {
  /// Validate if exception is convertible
  bool isException(dynamic exception);

  /// Build the new exception
  Exception build(dynamic exception);
}
