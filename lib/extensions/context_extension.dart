import 'package:flutter/widgets.dart';

extension ContextExtension on BuildContext {
  /// Context height
  double get height => MediaQuery.sizeOf(this).height;

  /// Context width
  double get width => MediaQuery.sizeOf(this).width;
}
