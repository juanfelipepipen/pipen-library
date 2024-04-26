import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';

abstract class PipenTypeSafeRoute {
  @protected
  late Map<String, dynamic> queryParameters;
  @protected
  late Map<String, String> pathParameters;
  @protected
  String name, path;
  @protected
  Object? extra;

  PipenTypeSafeRoute({
    this.extra,
    required this.name,
    required this.path,
    Map<String, dynamic>? extraParams,
    Map<String, String>? pathParameters,
    Map<String, dynamic>? queryParameters,
  }) {
    this.pathParameters = pathParameters ?? {};
    this.queryParameters = queryParameters ?? {};

    if (extraParams != null) {
      extra = extraParams;
    }
  }

  /// Go to the route
  void go(BuildContext context) => context.goNamed(
        name,
        extra: extra,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      );

  /// Push the route
  void push(BuildContext context) => context.pushNamed(
        name,
        extra: extra,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      );

  /// Push and replace the route
  void pushReplacementNamed(BuildContext context) => context.pushReplacementNamed(
        name,
        extra: extra,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
      );

  /// Push and pop the current route
  void pushAndPop(BuildContext context) {
    Navigator.of(context).pop();
    push(context);
  }

  /// Back or go
  void back(BuildContext context) =>
      Navigator.of(context).canPop() ? Navigator.of(context).pop() : go(context);
}
