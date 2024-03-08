import 'package:flutter/widgets.dart';

abstract class ExceptionStrategy {
  /// Prepare exception strategy
  void handle(BuildContext context, dynamic exception);

  /// Check if exceptions has strategy
  bool callable(dynamic exception);
}
