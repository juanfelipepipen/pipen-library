import 'package:pipen/components/builders/builder/pipen_builder_when.dart';
import 'package:pipen/components/column/pipen_column.dart';
import 'package:flutter/widgets.dart';

class PipenGap extends StatelessWidget {
  const PipenGap.verySmall({super.key, this.child}) : size = 4;

  const PipenGap.small({super.key, this.child}) : size = smallSize;

  const PipenGap.medium({super.key, this.child}) : size = mediumSize;

  const PipenGap.large({super.key, this.child}) : size = largeSize;

  const PipenGap.separator({super.key, this.child}) : size = separatorSize;

  const PipenGap.form({super.key, this.child}) : size = formSize;

  static const double verySmallSize = 4;
  static const double smallSize = 10;
  static const double separatorSize = 14;
  static const double mediumSize = 20;
  static const double largeSize = 50;
  static const double formSize = 37;

  final Widget? child;
  final double size;

  @override
  Widget build(BuildContext context) => PipenColumn(
        children: [
          SizedBox.square(
            dimension: size,
          ),
          When<Widget>(
            value: child,
            child: (child) => Padding(
              padding: EdgeInsets.only(bottom: size),
              child: child,
            ),
          ),
        ],
      );
}
