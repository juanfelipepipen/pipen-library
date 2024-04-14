import '../managers/exception_manager.dart';
import '../managers/headers_manager.dart';
import '../abstract/cloux_client.dart';
import '../abstract/cloux_base.dart';

import 'package:dio/dio.dart';

abstract class ClouxPut<R> extends ClouxClient implements ClouxBase<R> {
  @override
  Future<R> request() async {
    try {
      Dio client = getDioClient();
      client.options.headers = HeadersManager.headersFromInstance(this);
      Response response = await client.put(path, data: params, queryParameters: queryParams());
      printResponse(response);
      return this.response(response.data);
    } catch (e) {
      ExceptionManager(e).handle(this);
      rethrow;
    }
  }
}
