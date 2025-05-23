import 'package:flutter/widgets.dart';

class PipenColumn extends StatelessWidget {
  PipenColumn({
    super.key,
    this.child,
    this.padding,
    this.spacing,
    this.vertical,
    this.children,
    this.listable,
    this.horizontal,
    this.mainAxisSize,
  }) {
    assert(child != null || children != null || listable != null);
  }

  const PipenColumn.center({
    super.key,
    this.child,
    this.padding,
    this.listable,
    this.spacing,
    this.children,
    this.mainAxisSize,
    this.vertical = MainAxisAlignment.center,
    this.horizontal = CrossAxisAlignment.center,
  });

  const PipenColumn.end({
    super.key,
    this.child,
    this.padding,
    this.listable,
    this.spacing,
    this.children,
    this.mainAxisSize,
    this.vertical = MainAxisAlignment.end,
    this.horizontal = CrossAxisAlignment.end,
  });

  const PipenColumn.min({
    super.key,
    this.child,
    this.padding,
    this.listable,
    this.spacing,
    this.children,
    this.vertical = MainAxisAlignment.start,
    this.horizontal = CrossAxisAlignment.start,
  }) : mainAxisSize = MainAxisSize.min;

  final CrossAxisAlignment? horizontal;
  final MainAxisAlignment? vertical;
  final Iterable<Widget>? listable;
  final MainAxisSize? mainAxisSize;
  final List<Widget>? children;
  final EdgeInsets? padding;
  final double? spacing;
  final Widget? child;

  List<Widget> get _children {
    if (children case List<Widget> children) {
      return children;
    } else if (child case Widget child) {
      return [child];
    } else {
      return (listable as Iterable<Widget>).toList();
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: padding ?? EdgeInsets.zero,
    child: Column(
      spacing: spacing ?? 0,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      mainAxisAlignment: vertical ?? MainAxisAlignment.start,
      crossAxisAlignment: horizontal ?? CrossAxisAlignment.start,
      children: _children,
    ),
  );
}
