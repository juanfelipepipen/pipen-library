import 'package:pipen/src/components/scaffold/app/state/pipen_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:pipen/routes.dart';

class ModalRouteTheme {
  ModalRouteTheme({
    required this.barrierDismissible,
    required this.borderRadius,
    required this.insetPadding,
    required this.padding,
    RouteTransitionBuilder? transition,
  }) : transition = transition ?? FadeRouteTransition();

  final RouteTransitionBuilder transition;
  final EdgeInsets padding, insetPadding;
  final BorderRadius borderRadius;
  final bool barrierDismissible;

  factory ModalRouteTheme.fromRoute(BuildContext context, TypeSafeModalRoute route) {
    final routeTheme = PipenTheme.of(context).themes.routeTheme;

    // Padding
    EdgeInsets padding =
        route is RouteZeroPadding
            ? EdgeInsets.zero
            : PipenTheme.of(context).themes.routeTheme?.padding ?? EdgeInsets.zero;
    if (route case RoutePadding customPadding) padding = customPadding.padding;

    // Barrier dismissible
    final barrierDismissible = route is RouteFixed ? true : routeTheme?.barrierDismissible ?? true;

    // Border radius
    BorderRadius borderRadius = routeTheme?.borderRadius ?? BorderRadius.zero;
    if (route case RouteBorderRadius routeBorderRadius) {
      borderRadius = BorderRadius.circular(routeBorderRadius.borderRadius);
    }

    // Inset padding
    EdgeInsets insetPadding = routeTheme?.insetPadding ?? EdgeInsets.zero;
    if (route case RouteInsetPadding routeInsetPadding) {
      insetPadding = routeInsetPadding.insetPadding(context);
    }

    // Transition
    RouteTransitionBuilder transition = routeTheme?.transition ?? FadeRouteTransition();
    if (route case RouteTransition routeTransition) transition = routeTransition.transitionBuilder;

    return ModalRouteTheme(
      padding: padding,
      transition: transition,
      insetPadding: insetPadding,
      borderRadius: borderRadius,
      barrierDismissible: barrierDismissible,
    );
  }

  factory ModalRouteTheme.styleFrom({
    EdgeInsets? padding,
    EdgeInsets? insetPadding,
    bool? barrierDismissible,
    BorderRadius? borderRadius,
    RouteTransitionBuilder? transition,
  }) => ModalRouteTheme(
    transition: transition,
    padding: padding ?? EdgeInsets.zero,
    insetPadding: insetPadding ?? EdgeInsets.zero,
    barrierDismissible: barrierDismissible ?? true,
    borderRadius: borderRadius ?? BorderRadius.circular(25),
  );

  ModalRouteTheme copyWith({
    EdgeInsets? padding,
    EdgeInsets? insetPadding,
    bool? barrierDismissible,
    RouteTransitionBuilder? transition,
  }) => ModalRouteTheme(
    borderRadius: borderRadius,
    padding: padding ?? this.padding,
    transition: transition ?? this.transition,
    insetPadding: insetPadding ?? this.insetPadding,
    barrierDismissible: barrierDismissible ?? this.barrierDismissible,
  );
}
