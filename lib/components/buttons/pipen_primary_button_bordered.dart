import 'package:pipen/components/buttons/pipen_primary_button.dart';
import 'package:pipen/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PipenPrimaryButtonBordered extends StatelessWidget {
  const PipenPrimaryButtonBordered({
    super.key,
    this.state,
    this.onPressed,
    this.borderColor,
    required this.title,
  });

  final VoidCallback? onPressed;
  final Color? borderColor;
  final dynamic state;
  final String title;

  @override
  Widget build(BuildContext context) => PipenPrimaryButton(
        title: title,
        onPressed: onPressed,
        backgroundColor: Colors.white,
        textColor: borderColor ?? context.themeColors.primary,
        side: BorderSide(
          width: 2,
          color: borderColor ?? context.themeColors.primary,
        ),
      );
}
