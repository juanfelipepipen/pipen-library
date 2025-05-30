import 'package:flutter/cupertino.dart';

sealed class RouteTransitionBuilder {
  RouteTransitionsBuilder get builder;
}

class ScaleCurvedRouteTransition extends RouteTransitionBuilder {
  @override
  get builder =>
      (context, animation, secondaryAnimation, child) => ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
        child: child,
      );
}

class ScaleFadeRouteTransition extends RouteTransitionBuilder {
  @override
  get builder =>
      (context, animation, secondaryAnimation, child) => ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        child: FadeTransition(opacity: animation, child: child),
      );
}

class FadeRouteTransition extends RouteTransitionBuilder {
  @override
  get builder =>
      (context, animation, secondaryAnimation, child) => FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 0.9,
            end: 1.0,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
          child: child,
        ),
      );
}
