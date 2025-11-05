import 'package:flutter/material.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:pipen/extensions.dart';
import '../../../components.dart';

class PipenTextSkeleton extends StatefulWidget {
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
    this.defaultValue,
  }) : alignment = Alignment.centerRight;

  final String Function(String value)? builder;
  final double? skeletonWith, minHeight;
  final String? value, defaultValue;
  final bool? loading, fromValue;
  final TextAlign? textAlign;
  final double? borderRadius;
  final Alignment alignment;
  final FetchState? state;
  final TextStyle? style;

  String? get _value {
    if (builder != null && value != null) {
      return builder!(value!);
    }

    return value ?? defaultValue;
  }

  bool get _loading =>
      state is FetchLoading ||
      loading == true ||
      (fromValue == true && value == null) ||
      value == null;

  @override
  State<PipenTextSkeleton> createState() => _PipenTextSkeletonState();
}

class _PipenTextSkeletonState extends State<PipenTextSkeleton> {
  @override
  Widget build(BuildContext context) => PipenSkeletonizer(
    loading: widget._loading,
    alignment: widget.alignment,
    builder:
        (isLoading) => IntrinsicHeight(
          child: Container(
            alignment: widget.alignment,
            width: isLoading ? widget.skeletonWith ?? double.infinity : null,
            decoration: BoxDecoration(
              color: isLoading ? Colors.black : null,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              widget._value ?? '',
              textAlign: widget.textAlign,
              style: widget.style ?? context.textTheme.bodyMedium,
            ),
          ),
        ),
  );
}
