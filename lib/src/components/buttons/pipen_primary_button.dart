import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:pipen/extensions.dart';
import 'package:flutter/material.dart';

class PipenPrimaryButton extends StatelessWidget {
  const PipenPrimaryButton({
    super.key,
    this.icon,
    this.side,
    this.title,
    this.state,
    this.shape,
    this.height,
    this.padding,
    this.textStyle,
    this.textColor,
    this.onPressed,
    this.borderRadius,
    this.iconAlignment,
    this.backgroundColor,
    bool? maxSize,
  }) : _maxSize = maxSize ?? true;

  const PipenPrimaryButton.min({
    super.key,
    this.icon,
    this.side,
    this.title,
    this.state,
    this.shape,
    this.height,
    this.padding,
    this.textColor,
    this.onPressed,
    this.textStyle,
    this.borderRadius,
    this.iconAlignment,
    this.backgroundColor,
  }) : _maxSize = false;

  final Color? backgroundColor, textColor;
  final IconAlignment? iconAlignment;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final TextStyle? textStyle;
  final double? borderRadius;
  final EdgeInsets? padding;
  final BorderSide? side;
  final IconData? icon;
  final double? height;
  final dynamic state;
  final bool _maxSize;
  final String? title;

  bool get isLoading => state is LoadingState;

  OutlinedBorder? get border {
    if (shape != null) {
      return shape;
    }
    return borderRadius != null
        ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!))
        : null;
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height ?? 40,
    width: _maxSize ? double.infinity : null,
    child: ElevatedButton.icon(
      onPressed: onPressed,
      iconAlignment: iconAlignment ?? IconAlignment.end,
      icon: !isLoading ? Icon(icon, color: textColor ?? context.themeColors.surface) : null,
      style: ElevatedButton.styleFrom(
        side: side,
        shape: border,
        padding: padding,
        alignment: Alignment.center,
        backgroundColor: backgroundColor ?? context.themeColors.primary,
      ),
      label:
          !isLoading
              ? Text(
                title ?? '',
                style:
                    textStyle?.copyWith(color: textColor ?? context.themeColors.surface) ??
                    context.textTheme.titleMedium?.copyWith(
                      color: textColor ?? context.themeColors.surface,
                    ),
              )
              : SizedBox.square(
                dimension: 18,
                child: CircularProgressIndicator(color: textColor ?? context.themeColors.surface),
              ),
    ),
  );
}
