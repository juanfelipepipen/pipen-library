import 'package:pipen/cloux/configs/cloux_config.dart';
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

  /// Print response JSON output
  void output(Map<dynamic, dynamic> response) => debugPrint(
        prettyPrintJson(
          jsonEncode(response),
        ),
      );
}
