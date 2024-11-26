import 'package:pipen/components/builders/builder/pipen_builder_when.dart';
import 'package:pipen/components/builders/conditions/if.dart';
import 'package:pipen/extensions/context_extension.dart';
import 'package:pipen/components/row/pipen_row.dart';
import 'package:pipen/abstract/loading_state.dart';
import 'package:flutter/material.dart';

class PipenPrimaryButton extends StatelessWidget {
  const PipenPrimaryButton({
    super.key,
    this.icon,
    this.side,
    this.state,
    this.onPressed,
    this.textColor,
    required this.title,
    this.backgroundColor,
  }) : _maxSize = true;

  const PipenPrimaryButton.min({
    super.key,
    this.icon,
    this.side,
    this.state,
    this.onPressed,
    this.textColor,
    required this.title,
    this.backgroundColor,
  }) : _maxSize = false;

  final Color? backgroundColor, textColor;
  final VoidCallback? onPressed;
  final BorderSide? side;
  final IconData? icon;
  final dynamic state;
  final String title;
  final bool _maxSize;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        width: _maxSize ? double.infinity : null,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            side: side,
            backgroundColor: backgroundColor ?? context.themeColors.primary,
          ),
          child: If(
            condition: state is LoadingState,
            def: PipenRow(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: textColor ?? context.themeColors.surface,
                  ),
                ),
                When<IconData>(
                  value: icon,
                  child: (icon) => Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(
                      icon,
                      color: textColor ?? context.themeColors.surface,
                    ),
                  ),
                ),
              ],
            ),
            child: SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(
                color: textColor ?? context.themeColors.surface,
              ),
            ),
          ),
        ),
      );
}
