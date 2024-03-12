import 'package:flutter/widgets.dart';

class PipenRow extends StatelessWidget {
  const PipenRow({
    super.key,
    this.padding,
    this.vertical,
    this.horizontal,
    this.mainAxisSize,
    required this.children,
  });

  const PipenRow.end({
    super.key,
    this.padding,
    this.mainAxisSize,
    required this.children,
    this.vertical = CrossAxisAlignment.end,
    this.horizontal = MainAxisAlignment.end,
  });

  const PipenRow.center({
    super.key,
    this.padding,
    this.mainAxisSize,
    required this.children,
    this.vertical = CrossAxisAlignment.center,
    this.horizontal = MainAxisAlignment.center,
  });

  final MainAxisAlignment? horizontal;
  final CrossAxisAlignment? vertical;
  final MainAxisSize? mainAxisSize;
  final List<Widget> children;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Row(
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          crossAxisAlignment: vertical ?? CrossAxisAlignment.start,
          mainAxisAlignment: horizontal ?? MainAxisAlignment.start,
          children: children,
        ),
      );
}
