import 'package:flutter/material.dart';
import 'package:pipen/controllers/context_controller.dart';
import 'package:pipen/tools.dart';

extension PipenContextExtension on BuildContext {
  /// Context media query height
  double get height => MediaQuery.sizeOf(this).height;

  /// Context media query width
  double get width => MediaQuery.sizeOf(this).width;

  /// Check if current theme is dark mode
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  /// Get the current theme data
  ThemeData get theme => Theme.of(this);

  /// Get the current text theme data
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Get the theme colors scheme
  ColorScheme get themeColors => Theme.of(this).colorScheme;

  /// Find value provided on context
  T value<T>() => ValueProvider.of<T>(this);

  /// Get a context controller provided on scope
  T controller<T extends ContextController>() => ControllerProvider.of<T>(this);
}
