import 'package:pipen/extensions/context_extension.dart';
import 'package:pipen_bloc/abstract/loading_state.dart';
import 'package:flutter/material.dart';

class PipenPrimaryButton extends StatelessWidget {
  const PipenPrimaryButton({
    super.key,
    this.icon,
    this.side,
    this.state,
    this.textColor,
    this.onPressed,
    this.iconAlignment,
    required this.title,
    this.backgroundColor,
  }) : _maxSize = true;

  const PipenPrimaryButton.min({
    super.key,
    this.icon,
    this.side,
    this.state,
    this.textColor,
    this.onPressed,
    this.iconAlignment,
    required this.title,
    this.backgroundColor,
  }) : _maxSize = false;

  final Color? backgroundColor, textColor;
  final IconAlignment? iconAlignment;
  final VoidCallback? onPressed;
  final BorderSide? side;
  final IconData? icon;
  final dynamic state;
  final bool _maxSize;
  final String title;

  bool get isLoading => state is LoadingState;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 40,
    width: _maxSize ? double.infinity : null,
    child: ElevatedButton.icon(
      onPressed: onPressed,
      iconAlignment: IconAlignment.end,
      style: ElevatedButton.styleFrom(
        side: side,
        alignment: Alignment.center,
        backgroundColor: backgroundColor ?? context.themeColors.primary,
      ),
      label:
          !isLoading
              ? Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  color: textColor ?? context.themeColors.surface,
                ),
              )
              : SizedBox.square(
                dimension: 18,
                child: CircularProgressIndicator(color: textColor ?? context.themeColors.surface),
              ),
      icon: !isLoading ? Icon(icon, color: textColor ?? context.themeColors.surface) : null,
    ),
  );
}
