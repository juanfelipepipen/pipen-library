import 'package:flutter/material.dart';
import 'modal_container.dart';

part 'type_safe_modal.dart';

class PipenModalsBuilders {
  /// Handle on navigate to modal route (go operation)
  static Function(BuildContext, TypeSafeModalRoute) get modalBuilder => (context, modal) {
    EdgeInsets padding = modal is RouteZeroPadding ? EdgeInsets.zero : EdgeInsets.all(25);

    if (modal case RoutePadding customPadding) {
      padding = customPadding.padding;
    }

    double borderRadius =
        modal is RouteBorderRadius ? (modal as RouteBorderRadius).borderRadius : 0;

    // Open modal
    showDialog<void>(
      context: context,
      useRootNavigator: true,
      barrierDismissible: modal is! RouteFixed,
      builder: (context) {
        return modal is CustomContentModal
            ? modal.page(context)
            : Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              ),
              // insetPadding: EdgeInsets.all(10),
              insetPadding: EdgeInsets.zero,
              child: ModalContainer(padding: padding, child: modal.page(context)),
              // child: SizedBox(
              //   width: context.width,
              //   child: ModalContainer(padding: padding, child: modal.page(context)),
              // ),
            );
      },
    );
  };
}
