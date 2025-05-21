/// Error code from response with format FAIL_CODE
class GraphqlErrorCode implements Exception {
  const GraphqlErrorCode(this.errorCode);

  final String errorCode;
}
