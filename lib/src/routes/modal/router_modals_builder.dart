import 'dart:async';

import 'package:pipen/extensions.dart';
import 'package:pipen/src/routes/modal/pipen_modals_handler.dart';
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
  Future<T?> Function<T>(
    BuildContext context,
    TypeSafeModalRoute route,
    Widget modal,
    ModalRouteTheme theme,
  )
  get builder;

  /// Default method for show a modal
  @protected
  Future<T?> show<T>(
    BuildContext context,
    TypeSafeModalRoute route,
    Widget modal,
    ModalRouteTheme theme,
  ) {
    // Open modal
    return showGeneralDialog<T>(
      context: context,
      barrierLabel: 'Dismiss',
      useRootNavigator: true,
      transitionBuilder: theme.transition.builder,
      barrierDismissible: theme.barrierDismissible,
      pageBuilder: (context, animation, secondaryAnimation) {
        return modal is CustomContentModal
            ? modal
            : Dialog(
              insetPadding: theme.margin,
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
