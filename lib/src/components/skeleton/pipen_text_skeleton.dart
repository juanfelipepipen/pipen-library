import 'package:flutter/material.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:pipen/extensions.dart';
import '../../../components.dart';

class PipenTextSkeleton extends StatelessWidget {
  const PipenTextSkeleton({
    super.key,
    this.value,
    this.style,
    this.state,
    this.builder,
    this.loading,
    this.textAlign,
    this.fromValue,
    this.minHeight,
    this.borderRadius,
    this.skeletonWith,
    this.defaultValue,
    this.defaultStyle,
    this.alignment = Alignment.centerLeft,
  });

  const PipenTextSkeleton.right({
    super.key,
    this.value,
    this.style,
    this.state,
    this.builder,
    this.loading,
    this.textAlign,
    this.fromValue,
    this.minHeight,
    this.borderRadius,
    this.skeletonWith,
    this.defaultStyle,
    this.defaultValue,
  }) : alignment = Alignment.centerRight;

  final String Function(String value)? builder;
  final double? skeletonWith, minHeight;
  final TextStyle? style, defaultStyle;
  final String? value, defaultValue;
  final bool? loading, fromValue;
  final TextAlign? textAlign;
  final double? borderRadius;
  final Alignment alignment;
  final FetchState? state;

  String? get _value {
    if (builder != null && value != null) {
      return builder!(value!);
    }
    return value ?? defaultValue;
  }

  TextStyle? get _style {
    if (value == null && !_loading && defaultValue != null) {
      return style?.merge(defaultStyle);
    }
    return style;
  }

  bool get _loading =>
      state is FetchLoading ||
      loading == true ||
      (fromValue == true && value == null) ||
      value == null && state == null;

  @override
  Widget build(BuildContext context) => PipenSkeletonizer(
    loading: _loading,
    alignment: alignment,
    builder:
        (isLoading) => IntrinsicHeight(
          child: Container(
            alignment: alignment,
            width: isLoading ? skeletonWith ?? double.infinity : null,
            decoration: BoxDecoration(
              color: isLoading ? Colors.black : null,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              _value ?? '',
              textAlign: textAlign,
              style: _style ?? context.textTheme.bodyMedium,
            ),
          ),
        ),
  );
}
