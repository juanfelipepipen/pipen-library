import 'package:pipen/config/typedef.dart';

typedef GraphqlSuccessResponse<T> = Future<T> Function(JsonMap params);
typedef GraphqlParams = Future<JsonMap>;
