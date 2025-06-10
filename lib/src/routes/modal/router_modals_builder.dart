import 'package:pipen/src/routes/transitions/route_transition_builder.dart';
import 'package:pipen/src/routes/theme/modal_route_theme.dart';
import 'package:flutter/material.dart';
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
    // Open modal
    showGeneralDialog<void>(
      context: context,
      barrierLabel: 'Dismiss',
      useRootNavigator: true,
      transitionBuilder: theme.transition.builder,
      barrierDismissible: theme.barrierDismissible,
      pageBuilder: (context, animation, secondaryAnimation) {
        return modal is CustomContentModal
            ? modal
            : Dialog(
              insetPadding: theme.insetPadding,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: theme.borderRadius),
              child: SizedBox(
                width: theme.width,
                child: ModalContainer(padding: theme.padding, child: modal),
              ),
            );
      },
    );
  }
}

/// Default modal builder
class _PipenModalBuilder extends RouterModalsBuilders {
  @override
  get builder => show;
}
