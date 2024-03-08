import 'package:flutter/widgets.dart';

class PipenColumn extends StatelessWidget {
  PipenColumn({
    super.key,
    this.child,
    this.padding,
    this.vertical,
    this.children,
    this.horizontal,
    this.mainAxisSize,
  }) {
    assert(child != null || children != null);
  }

  factory PipenColumn.center({
    Key? key,
    Widget? child,
    EdgeInsets? padding,
    List<Widget>? children,
    MainAxisSize? mainAxisSize,
  }) =>
      PipenColumn(
        key: key,
        child: child,
        padding: padding,
        children: children,
        mainAxisSize: mainAxisSize,
        vertical: MainAxisAlignment.center,
        horizontal: CrossAxisAlignment.center,
      );

  factory PipenColumn.end({Key? key, Widget? child, List<Widget>? children, EdgeInsets? padding}) => PipenColumn(
        key: key,
        child: child,
        padding: padding,
        children: children,
        vertical: MainAxisAlignment.end,
        horizontal: CrossAxisAlignment.end,
      );

  final CrossAxisAlignment? horizontal;
  final MainAxisAlignment? vertical;
  final MainAxisSize? mainAxisSize;
  final List<Widget>? children;
  final EdgeInsets? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Column(
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          mainAxisAlignment: vertical ?? MainAxisAlignment.start,
          crossAxisAlignment: horizontal ?? CrossAxisAlignment.start,
          children: children ?? [child!],
        ),
      );
}
