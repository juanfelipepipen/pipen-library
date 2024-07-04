typedef GraphqlSuccessResponse<T> = Future<T> Function(Map<String, dynamic> params);
typedef GraphqlParams = Future<Map<String, dynamic>>;
