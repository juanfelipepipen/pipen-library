import 'package:pipen/components/buttons/pipen_primary_button.dart';
import 'package:pipen/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class PipenButtonBordered extends StatelessWidget {
  const PipenButtonBordered({super.key, required this.title, this.onPressed, this.borderColor, this.state});

  final VoidCallback? onPressed;
  final Color? borderColor;
  final dynamic state;
  final String title;

  @override
  Widget build(BuildContext context) => PipenPrimaryButton(
    title: title,
    onPressed: onPressed,
    textColor: borderColor ?? context.themeColors.primary,
    backgroundColor: Colors.white,
    side: BorderSide(
      width: 2,
      color: borderColor ?? context.themeColors.primary,
    ),
  );
}
