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

  bool get _loading {
    return state is FetchLoading || loading == true || (fromValue == true && value == null);
  }

  @override
  State<PipenTextSkeleton> createState() => _PipenTextSkeletonState();
}

class _PipenTextSkeletonState extends State<PipenTextSkeleton> {
  TextStyle? textStyle;
  double? height;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    textStyle = widget.style ?? context.textTheme.bodyMedium;
    calculateSize();
  }

  /// Calculate text height
  void calculateSize() {
    final painter = TextPainter(
      maxLines: 1,
      textDirection: TextDirection.ltr,
      text: TextSpan(text: 'A', style: textStyle),
    )..layout();

    setState(() => height = painter.height);
  }

  @override
  Widget build(BuildContext context) =>
      height != null
          ? When<String>(
            minHeight: height! + 3,
            alignment: widget.alignment,
            value: widget._loading ? null : widget._value,
            skeleton: Container(
              alignment: widget.alignment,
              height: height,
              width: widget.skeletonWith ?? double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(widget.borderRadius ?? (height ?? 20) / 2),
              ),
            ),
            child: (value) => Text(value, style: widget.style ?? context.textTheme.bodyMedium),
          )
          : SizedBox.shrink();
}
