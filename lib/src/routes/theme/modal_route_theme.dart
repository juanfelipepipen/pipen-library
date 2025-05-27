import 'package:flutter/cupertino.dart';
import 'package:pipen/routes.dart';

class ModalRouteTheme {
  const ModalRouteTheme({required this.padding, required this.barrierDismissible});

  final EdgeInsets padding;
  final bool barrierDismissible;

  static ModalRouteTheme fromRoute(TypeSafeModalRoute route) {
    EdgeInsets padding = route is RouteZeroPadding ? EdgeInsets.zero : EdgeInsets.all(25);
    if (route case RoutePadding customPadding) padding = customPadding.padding;

    final barrierDismissible = route is! RouteFixed;

    return ModalRouteTheme(padding: padding, barrierDismissible: barrierDismissible);
  }
}
