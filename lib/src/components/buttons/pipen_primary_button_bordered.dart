import 'package:pipen/src/components/buttons/pipen_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:pipen/extensions.dart';

class PipenPrimaryButtonBordered extends StatelessWidget {
  const PipenPrimaryButtonBordered({
    super.key,
    this.state,
    this.height,
    this.onPressed,
    this.borderColor,
    required this.title,
  });

  final VoidCallback? onPressed;
  final Color? borderColor;
  final double? height;
  final dynamic state;
  final String title;

  @override
  Widget build(BuildContext context) => PipenPrimaryButton(
    title: title,
    height: height,
    onPressed: onPressed,
    backgroundColor: Colors.white,
    textColor: borderColor ?? context.themeColors.primary,
    side: BorderSide(width: 2, color: borderColor ?? context.themeColors.primary),
  );
}
