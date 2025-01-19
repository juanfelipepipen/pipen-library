import 'package:flutter/widgets.dart';

class PipenRow extends StatelessWidget {
  PipenRow({
    super.key,
    this.child,
    this.margin,
    this.vertical,
    this.children,
    this.spacing,
    this.listable,
    this.horizontal,
    this.mainAxisSize,
  }) {
    assert(child != null || children != null || listable != null);
  }

  const PipenRow.end({
    super.key,
    this.child,
    this.margin,
    this.listable,
    this.spacing,
    this.children,
    this.mainAxisSize,
    this.vertical = CrossAxisAlignment.end,
    this.horizontal = MainAxisAlignment.end,
  });

  const PipenRow.center({
    super.key,
    this.child,
    this.margin,
    this.children,
    this.spacing,
    this.listable,
    this.mainAxisSize,
    this.vertical = CrossAxisAlignment.center,
    this.horizontal = MainAxisAlignment.center,
  });

  final MainAxisAlignment? horizontal;
  final CrossAxisAlignment? vertical;
  final Iterable<Widget>? listable;
  final MainAxisSize? mainAxisSize;
  final List<Widget>? children;
  final EdgeInsets? margin;
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
        padding: margin ?? EdgeInsets.zero,
        child: Row(
          spacing: spacing ?? 0,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          crossAxisAlignment: vertical ?? CrossAxisAlignment.start,
          mainAxisAlignment: horizontal ?? MainAxisAlignment.start,
          children: _children,
        ),
      );
}
