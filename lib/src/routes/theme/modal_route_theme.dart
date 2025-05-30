import 'package:pipen/src/components/scaffold/app/state/pipen_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:pipen/routes.dart';

class ModalRouteTheme {
  ModalRouteTheme({
    this.width,
    required this.padding,
    required this.borderRadius,
    required this.insetPadding,
    required this.barrierDismissible,
    RouteTransitionBuilder? transition,
  }) : transition = transition ?? FadeRouteTransition();

  final RouteTransitionBuilder transition;
  final EdgeInsets padding, insetPadding;
  final BorderRadius borderRadius;
  final bool barrierDismissible;
  final double? width;

  factory ModalRouteTheme.fromRoute(BuildContext context, TypeSafeModalRoute route) {
    final routeTheme =
        PipenTheme.maybeOf(context)?.themes.routeTheme ?? ModalRouteTheme.styleFrom();

    // Padding
    EdgeInsets padding = route is RouteZeroPadding ? EdgeInsets.zero : routeTheme.padding;
    if (route case RoutePadding customPadding) padding = customPadding.padding;

    // Barrier dismissible
    final barrierDismissible = route is RouteFixed ? true : routeTheme.barrierDismissible;

    // Border radius
    BorderRadius borderRadius = routeTheme.borderRadius;
    if (route case RouteBorderRadius routeBorderRadius) {
      borderRadius = BorderRadius.circular(routeBorderRadius.borderRadius);
    }

    // Inset padding
    EdgeInsets insetPadding = routeTheme.insetPadding;
    if (route case RouteInsetPadding routeInsetPadding) {
      insetPadding = routeInsetPadding.insetPadding(context);
    }

    // Transition
    RouteTransitionBuilder transition = routeTheme.transition;
    if (route case RouteTransition routeTransition) transition = routeTransition.transitionBuilder;

    // Width
    final width = routeTheme.width;

    return ModalRouteTheme(
      width: width,
      padding: padding,
      transition: transition,
      insetPadding: insetPadding,
      borderRadius: borderRadius,
      barrierDismissible: barrierDismissible,
    );
  }

  factory ModalRouteTheme.styleFrom({
    double? width,
    EdgeInsets? padding,
    EdgeInsets? insetPadding,
    bool? barrierDismissible,
    BorderRadius? borderRadius,
    RouteTransitionBuilder? transition,
  }) => ModalRouteTheme(
    width: width,
    padding: padding ?? EdgeInsets.zero,
    insetPadding: insetPadding ?? EdgeInsets.zero,
    barrierDismissible: barrierDismissible ?? true,
    transition: transition ?? FadeRouteTransition(),
    borderRadius: borderRadius ?? BorderRadius.circular(25),
  );

  ModalRouteTheme copyWith({
    double? width,
    EdgeInsets? padding,
    EdgeInsets? insetPadding,
    bool? barrierDismissible,
    RouteTransitionBuilder? transition,
  }) => ModalRouteTheme(
    width: width ?? this.width,
    borderRadius: borderRadius,
    padding: padding ?? this.padding,
    transition: transition ?? this.transition,
    insetPadding: insetPadding ?? this.insetPadding,
    barrierDismissible: barrierDismissible ?? this.barrierDismissible,
  );
}
