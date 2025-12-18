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
abstract class RouteMargin {
  EdgeInsets Function(BuildContext) get margin;
}

/// Custom insetPadding
abstract class RouteTransition {
  RouteTransitionBuilder get transitionBuilder;
}

/// Don't use default modal alert dialog scaffold
interface class CustomContentModal {}

/// Route of modal type
abstract class TypeSafeModalRoute<T> {
  Widget Function(BuildContext) get page;

  /// Navigate to modal route
  Future<T?> go(BuildContext context) {
    FocusScope.of(context).unfocus();
    final page = this.page(context);
    final theme = ModalRouteTheme.fromRoute(context, this);
    final controller = context.maybeValue<PipenModalController>();
    final completer = Completer<T?>();
    final creator = PipenModalCreator<T>(
      page: page,
      route: this,
      theme: theme,
      completer: completer,
    );

    if (controller != null) {
      controller.show<T>(creator);
      return completer.future;
    }

    return creator.open(context);
  }

  /// Replace current modal
  void goReplace(BuildContext context) {
    Navigator.of(context).pop();
    go(context);
  }
}
