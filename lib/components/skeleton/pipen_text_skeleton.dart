import 'package:pipen/components/builders/builder/pipen_builder_when.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:pipen/extensions/context_extension.dart';
import 'package:pipen_bloc/cubit/cubit_fetch.dart';
import 'package:flutter/cupertino.dart';

class PipenTextSkeleton extends StatefulWidget {
  const PipenTextSkeleton({
    super.key,
    this.value,
    this.style,
    this.state,
    this.builder,
    this.loading,
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
    this.minHeight,
    this.borderRadius,
    this.skeletonWith,
    this.defaultValue,
  }) : alignment = Alignment.centerRight;

  final String Function(String value)? builder;
  final double? skeletonWith, minHeight;
  final String? value, defaultValue;
  final double? borderRadius;
  final Alignment alignment;
  final FetchState? state;
  final TextStyle? style;
  final bool? loading;

  String? get _value {
    if (builder != null && value != null) {
      return builder!(value!);
    }
    return value ?? defaultValue;
  }

  bool get _loading {
    return state is FetchLoading || loading == true;
  }

  @override
  State<PipenTextSkeleton> createState() => _PipenTextSkeletonState();
}

class _PipenTextSkeletonState extends State<PipenTextSkeleton> {
  TextStyle? textStyle;
  double? height;

  @override
  void initState() {
    super.initState();
    textStyle = widget.style ?? context.textTheme.bodyMedium;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
            skeleton: SkeletonLine(
              style: SkeletonLineStyle(
                height: height,
                width: widget.skeletonWith,
                alignment: widget.alignment,
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              ),
            ),
            child: (value) => Text(value, style: widget.style ?? context.textTheme.bodyMedium),
          )
          : SizedBox.shrink();
}
