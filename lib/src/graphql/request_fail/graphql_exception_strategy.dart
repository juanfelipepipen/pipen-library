abstract class GraphqlExceptionStrategy {
  /// Validate if exception is convertible
  bool isException(dynamic exception);

  /// Build the new exception
  void build(dynamic exception);
}
