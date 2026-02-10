import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeterminatorChrome {
  /// Set orientation vertical
  static void vertical() => SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// Set orientation horizontal
  static void horizontal() => SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  /// System UI overlay style
  static void overlayStyle({Brightness brightness = Brightness.light}) =>
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarIconBrightness: brightness,
          systemNavigationBarColor:
              brightness == Brightness.dark ? Colors.black : Colors.white,
        ),
      );
}
