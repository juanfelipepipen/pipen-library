import 'package:flutter/widgets.dart';

abstract class TypeSafeCustomModalRoute {
  Widget get modal;

  /// Open modal
  void go(BuildContext context) {
    // context.open.modal(modal);
  }
}
