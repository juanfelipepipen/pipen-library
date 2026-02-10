import 'package:pipen/src/components/scaffold/app/state/pipen_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:pipen/routes.dart';

class ModalRouteTheme {
  ModalRouteTheme({
    this.width,
    this.backgroundColor,
    required this.margin,
    required this.padding,
    required this.borderRadius,
    required this.barrierDismissible,
    RouteTransitionBuilder? transition,
  }) : transition = transition ?? FadeRouteTransition();

  final RouteTransitionBuilder transition;
  final EdgeInsets padding, margin;
  final BorderRadius borderRadius;
  final bool barrierDismissible;
  final Color? backgroundColor;
  final double? width;

  factory ModalRouteTheme.fromRoute(
    BuildContext context,
    TypeSafeModalRoute route,
  ) {
    final routeTheme =
        PipenTheme.maybeOf(context)?.themes.routeTheme ??
        ModalRouteTheme.styleFrom();

    // Padding
    EdgeInsets padding =
        route is RouteZeroPadding ? EdgeInsets.zero : routeTheme.padding;
    if (route case RoutePadding customPadding) padding = customPadding.padding;

    // Barrier dismissible
    final barrierDismissible =
        route is RouteFixed ? true : routeTheme.barrierDismissible;

    // Border radius
    BorderRadius borderRadius = routeTheme.borderRadius;
    if (route case RouteBorderRadius routeBorderRadius) {
      borderRadius = BorderRadius.circular(routeBorderRadius.borderRadius);
    }

    // Margin
    EdgeInsets margin = routeTheme.margin;
    if (route case RouteMargin routeInsetPadding) {
      margin = routeInsetPadding.margin(context);
    }

    // Transition
    RouteTransitionBuilder transition = routeTheme.transition;
    if (route case RouteTransition routeTransition) {
      transition = routeTransition.transitionBuilder;
    }

    // Width
    final width = routeTheme.width;

    // Background color
    final backgroundColor = routeTheme.backgroundColor;

    return ModalRouteTheme(
      width: width,
      padding: padding,
      transition: transition,
      margin: margin,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      barrierDismissible: barrierDismissible,
    );
  }

  factory ModalRouteTheme.styleFrom({
    double? width,
    EdgeInsets? padding,
    Color? backgroundColor,
    EdgeInsets? insetPadding,
    bool? barrierDismissible,
    BorderRadius? borderRadius,
    RouteTransitionBuilder? transition,
  }) => ModalRouteTheme(
    width: width,
    backgroundColor: backgroundColor,
    padding: padding ?? EdgeInsets.zero,
    margin: insetPadding ?? EdgeInsets.zero,
    barrierDismissible: barrierDismissible ?? true,
    transition: transition ?? FadeRouteTransition(),
    borderRadius: borderRadius ?? BorderRadius.circular(25),
  );

  ModalRouteTheme copyWith({
    double? width,
    EdgeInsets? padding,
    EdgeInsets? insetPadding,
    bool? barrierDismissible,
    Color? backgroundColor,
    RouteTransitionBuilder? transition,
  }) => ModalRouteTheme(
    width: width ?? this.width,
    borderRadius: borderRadius,
    margin: insetPadding ?? margin,
    padding: padding ?? this.padding,
    backgroundColor: backgroundColor,
    transition: transition ?? this.transition,
    barrierDismissible: barrierDismissible ?? this.barrierDismissible,
  );
}
