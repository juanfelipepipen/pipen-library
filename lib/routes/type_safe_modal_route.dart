import 'package:flutter/widgets.dart';

abstract class TypeSafeModalRoute {
  Widget get modal;

  /// Go to the route
  void go(BuildContext context) {
    //context.modal.show(modal);
  }
}
