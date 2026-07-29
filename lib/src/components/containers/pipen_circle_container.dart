import 'package:flutter/material.dart';
import 'package:pipen/components.dart';

class PipenCircleContainer extends StatelessWidget {
  const PipenCircleContainer({
    super.key,
    this.loading,
    this.alignment,
    this.background,
    this.unShapeSkeleton,
    required this.size,
    required this.child,
  });

  final bool? loading, unShapeSkeleton;
  final Alignment? alignment;
  final Color? background;
  final Widget child;
  final double? size;

  @override
  Widget build(BuildContext context) => PipenSkeletonizer(
    alignment: alignment,
    loading: loading,
    child: Container(
      alignment: alignment,
      width: unShapeSkeleton != true ? size : null,
      height: unShapeSkeleton != true ? size : null,
      constraints: unShapeSkeleton == true && size != null
          ? .new(minWidth: size!, minHeight: size!)
          : null,
      decoration: BoxDecoration(
        shape: unShapeSkeleton == true && loading == false
            ? BoxShape.rectangle
            : BoxShape.circle,
        color: loading == true ? Colors.black : background,
      ),
      child: child,
    ),
  );
}
