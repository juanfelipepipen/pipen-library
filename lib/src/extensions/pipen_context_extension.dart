import 'package:flutter/material.dart';

extension PipenContextExtension on BuildContext {
  /// Context height
  double get height => MediaQuery.sizeOf(this).height;

  /// Context width
  double get width => MediaQuery.sizeOf(this).width;

  /// Check if current theme is dark mode
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  /// Get the current theme data
  ThemeData get theme => Theme.of(this);

  /// Get the current text theme data
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get the theme colors scheme
  ColorScheme get themeColors => Theme.of(this).colorScheme;
}
