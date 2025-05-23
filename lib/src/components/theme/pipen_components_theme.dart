import 'dart:ui';

class PipenComponentsTheme {
  PipenComponentsTheme({this.primaryButton});

  final PipenPrimaryButtonTheme? primaryButton;
}

class PipenPrimaryButtonTheme {
  PipenPrimaryButtonTheme({this.height, this.textStyle, this.background});

  final TextStyle? textStyle;
  final Color? background;
  final double? height;
}
