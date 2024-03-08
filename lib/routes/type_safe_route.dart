import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';

abstract class TypeSafeRoute {
  @protected
  late Map<String, dynamic> queryParameters;
  @protected
  late Map<String, String> pathParameters;
  @protected
  String name, path;
  @protected
  Object? extra;

  TypeSafeRoute({
    required this.name,
    required this.path,
    Map<String, String>? pathParameters,
    Map<String, dynamic>? queryParameters,
  }) {
    this.pathParameters = pathParameters ?? {};
    this.queryParameters = queryParameters ?? {};
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

  /// Back or go
  void back(BuildContext context) =>
      Navigator.of(context).canPop() ? Navigator.of(context).pop() : go(context);
}
