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

/// Don't use default modal alert dialog scaffold
interface class CustomContentModal {}

/// Route of modal type
abstract class TypeSafeModalRoute {
  Widget Function(BuildContext) get page;

  /// Navigate to modal route
  void go(BuildContext context) {
    PipenModalsBuilders.modalBuilder(context, this);
  }
}
