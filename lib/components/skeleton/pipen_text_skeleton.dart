import 'package:pipen/components/builders/builder/pipen_builder_when.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:pipen/extensions/context_extension.dart';
import 'package:pipen_bloc/cubit/cubit_fetch.dart';
import 'package:flutter/cupertino.dart';

class PipenTextSkeleton extends StatelessWidget {
  const PipenTextSkeleton({
    super.key,
    this.value,
    this.style,
    this.state,
    this.builder,
    this.loading,
    this.minHeight,
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
    this.skeletonWith,
    this.defaultValue,
  }) : alignment = Alignment.centerRight;

  final String Function(String value)? builder;
  final double? skeletonWith, minHeight;
  final String? value, defaultValue;
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
  Widget build(BuildContext context) => When<String>(
        value: _loading ? null : _value,
        minHeight: style?.fontSize != null ? (style!.fontSize! + 3) : null,
        alignment: alignment,
        skeleton: SkeletonLine(
          style: SkeletonLineStyle(
            width: skeletonWith,
            alignment: alignment,
            borderRadius: BorderRadius.circular(10),
            height: style?.fontSize ?? context.textTheme.bodyMedium?.fontSize,
          ),
        ),
        child: (value) => Text(
          value,
          style: style ?? context.textTheme.bodyMedium,
        ),
      );
}
