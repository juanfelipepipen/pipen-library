import 'package:flutter/widgets.dart';

class PipenRow extends StatelessWidget {
  PipenRow({
    super.key,
    this.child,
    this.padding,
    this.vertical,
    this.listable,
    this.horizontal,
    this.mainAxisSize,
    required this.children,
  }) {
    assert(child != null || children != null || listable != null);
  }

  const PipenRow.end({
    super.key,
    this.child,
    this.padding,
    this.listable,
    this.children,
    this.mainAxisSize,
    this.vertical = CrossAxisAlignment.end,
    this.horizontal = MainAxisAlignment.end,
  });

  const PipenRow.center({
    super.key,
    this.child,
    this.padding,
    this.children,
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
  final EdgeInsets? padding;
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
        child: Row(
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          crossAxisAlignment: vertical ?? CrossAxisAlignment.start,
          mainAxisAlignment: horizontal ?? MainAxisAlignment.start,
          children: _children,
        ),
      );
}
