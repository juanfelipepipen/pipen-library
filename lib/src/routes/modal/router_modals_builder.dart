import 'package:flutter/material.dart';
import 'package:pipen/src/routes/theme/modal_route_theme.dart';
import 'modal_container.dart';

part 'type_safe_modal.dart';

class PipenRouterConfigs {
  static RouterModalsBuilders modalBuilder = _PipenModalBuilder();
}

abstract class RouterModalsBuilders {
  /// Handle on navigate to modal route (go operation)
  Function(BuildContext context, TypeSafeModalRoute route, Widget modal, ModalRouteTheme theme)
  get builder;

  /// Default method for show a modal
  @protected
  void show(BuildContext context, TypeSafeModalRoute route, Widget modal, ModalRouteTheme theme) {
    EdgeInsets padding = modal is RouteZeroPadding ? EdgeInsets.zero : EdgeInsets.all(25);

    if (modal case RoutePadding customPadding) {
      padding = customPadding.padding;
    }

    double borderRadius =
        route is RouteBorderRadius ? (route as RouteBorderRadius).borderRadius : 0;

    // Open modal
    showDialog<void>(
      context: context,
      useRootNavigator: true,
      barrierDismissible: modal is! RouteFixed,
      builder: (context) {
        return modal is CustomContentModal
            ? modal
            : Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
              // insetPadding: EdgeInsets.all(10),
              insetPadding: EdgeInsets.zero,
              child: ModalContainer(padding: padding, child: modal),
              // child: SizedBox(
              //   width: context.width,
              //   child: ModalContainer(padding: padding, child: modal.page(context)),
              // ),
            );
      },
    );
  }
}

class _PipenModalBuilder extends RouterModalsBuilders {
  @override
  get builder => show;
}
