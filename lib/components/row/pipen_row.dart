import 'package:flutter/widgets.dart';

class PipenRow extends StatelessWidget {
  const PipenRow({super.key, required this.children, this.horizontal, this.vertical, this.padding});

  const PipenRow.end({
    super.key,
    this.padding,
    required this.children,
    this.vertical = CrossAxisAlignment.end,
    this.horizontal = MainAxisAlignment.end,
  });

  const PipenRow.center({
    super.key,
    this.padding,
    required this.children,
    this.vertical = CrossAxisAlignment.center,
    this.horizontal = MainAxisAlignment.center,
  });

  final MainAxisAlignment? horizontal;
  final CrossAxisAlignment? vertical;
  final List<Widget> children;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Row(
          crossAxisAlignment: vertical ?? CrossAxisAlignment.start,
          mainAxisAlignment: horizontal ?? MainAxisAlignment.start,
          children: children,
        ),
      );
}
