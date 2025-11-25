import 'package:flutter/material.dart';
import 'package:pipen/components.dart';
import 'package:pipen/extensions.dart';

part 'data/models/pipen_rich_text_base.dart';

class PipenTextRichSkeleton<T> extends StatelessWidget {
  const PipenTextRichSkeleton({
    super.key,
    this.style,
    this.alignment,
    this.skeletonPercent,
    required this.value,
    required this.builder,
  });

  final List<PipenTextRichBase> Function(T) builder;
  final double? skeletonPercent;
  final Alignment? alignment;
  final TextStyle? style;
  final T? value;

  bool get isLoading => value is! T || value == null;

  @override
  Widget build(BuildContext context) => PipenSkeletonizer(
    alignment: alignment,
    loading: isLoading,
    builder:
        (isLoading) => Container(
          alignment: alignment,
          width:
              skeletonPercent != null && isLoading
                  ? (context.width * skeletonPercent!)
                  : double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: isLoading ? Colors.black : null,
          ),
          child: Text.rich(
            style: style,
            TextSpan(
              children: [
                if (value case T value)
                  ...builder(value).map(
                    (e) => switch (e) {
                      PipenTextRich() => TextSpan(
                        text: e.text ?? e.hint,
                        style: e.style,
                      ),
                      PipenTextSpaceRich() => TextSpan(text: ' '),
                    },
                  ),
              ],
            ),
          ),
        ),
  );
}
