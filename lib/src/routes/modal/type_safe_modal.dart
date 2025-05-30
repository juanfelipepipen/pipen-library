part of 'router_modals_builder.dart';

/// barrierDismissible = true
interface class RouteFixed {}

/// insetPadding = EdgeInsets.zero
abstract class RouteZeroPadding {}

/// borderRadius value
abstract class RouteBorderRadius {
  double get borderRadius;
}

/// Custom insetPadding
abstract class RoutePadding {
  EdgeInsets get padding;
}

/// Custom insetPadding
abstract class RouteInsetPadding {
  EdgeInsets Function(BuildContext) get insetPadding;
}

/// Custom insetPadding
abstract class RouteTransition {
  RouteTransitionBuilder get transitionBuilder;
}

/// Don't use default modal alert dialog scaffold
interface class CustomContentModal {}

/// Route of modal type
abstract class TypeSafeModalRoute {
  Widget Function(BuildContext) get page;

  /// Navigate to modal route
  void go(BuildContext context) {
    final page = this.page(context);
    final theme = ModalRouteTheme.fromRoute(context, this);
    PipenRouterConfigs.modalBuilder.builder(context, this, page, theme);
  }

  /// Replace current modal
  void goReplace(BuildContext context) {
    Navigator.of(context).pop();
    go(context);
  }
}
