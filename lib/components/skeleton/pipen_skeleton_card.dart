import 'package:pipen/components/skeleton/pipen_skeleton_list.dart';
import 'package:skeletons/skeletons.dart';
import 'package:flutter/widgets.dart';

class PipenSkeletonCard extends StatelessWidget {
  const PipenSkeletonCard({this.height = 40, this.padding, this.total = 1, super.key});

  final EdgeInsets? padding;
  final double height;
  final int total;

  @override
  Widget build(BuildContext context) => PipenSkeletonList(
        number: total,
        skeleton: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: SkeletonLine(
            style: SkeletonLineStyle(
              height: height,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
}
