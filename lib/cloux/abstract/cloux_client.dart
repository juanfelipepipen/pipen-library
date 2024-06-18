import 'package:pipen/cloux/abstract/cloux_query_params.dart';
import 'package:pipen/cloux/configs/cloux_config.dart';
import 'package:pipen/cloux/withs/params_without_null.dart';
import 'package:pipen/cloux/withs/print_response.dart';
import 'package:json_pretty/json_pretty.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class ClouxClient {
  /// Get dio client
  Dio getDioClient() {
    BaseOptions options = BaseOptions(
      baseUrl: ClouxConfig.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
    );
    return Dio(options);
  }

  /// Get query params
  Map<String, dynamic>? queryParams() {
    if (this case ClouxQueryParams instance) {
      return instance.queryParameters;
    }
    return null;
  }

  /// Print response
  void printResponse(Response response) {
    if (this is PrintResponse) {
      output(response.data);
    }
  }

  /// Print response JSON output
  void output(Map<dynamic, dynamic> response) => debugPrint(
        prettyPrintJson(
          jsonEncode(response),
        ),
      );

  /// Sanitize params
  Map<String, dynamic> paramsSanitize(Map<String, dynamic> params) {
    if (this is ParamsWithoutNull) {
      Map<String, dynamic> sanitize = {};

      for (String key in params.keys) {
        if (params[key] != null) {
          sanitize[key] = params[key];
        }
      }
    }

    return params;
  }
}
