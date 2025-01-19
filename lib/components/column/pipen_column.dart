import 'package:flutter/widgets.dart';

class PipenColumn extends StatelessWidget {
  PipenColumn({
    super.key,
    this.child,
    this.margin,
    this.spacing,
    this.vertical,
    this.children,
    this.listable,
    this.horizontal,
    this.mainAxisSize,
  }) {
    assert(child != null || children != null || listable != null);
  }

  factory PipenColumn.center({
    Key? key,
    Widget? child,
    double? spacing,
    EdgeInsets? padding,
    List<Widget>? children,
    MainAxisSize? mainAxisSize,
    Iterable<Widget>? listable,
  }) =>
      PipenColumn(
        key: key,
        child: child,
        margin: padding,
        spacing: spacing,
        listable: listable,
        children: children,
        mainAxisSize: mainAxisSize,
        vertical: MainAxisAlignment.center,
        horizontal: CrossAxisAlignment.center,
      );

  factory PipenColumn.end({
    Key? key,
    Widget? child,
    double? spacing,
    EdgeInsets? padding,
    List<Widget>? children,
    MainAxisSize? mainAxisSize,
    Iterable<Widget>? listable,
  }) =>
      PipenColumn(
        key: key,
        child: child,
        margin: padding,
        spacing: spacing,
        listable: listable,
        children: children,
        mainAxisSize: mainAxisSize,
        vertical: MainAxisAlignment.end,
        horizontal: CrossAxisAlignment.end,
      );

  final CrossAxisAlignment? horizontal;
  final MainAxisAlignment? vertical;
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
        child: Column(
          spacing: spacing ?? 0,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          mainAxisAlignment: vertical ?? MainAxisAlignment.start,
          crossAxisAlignment: horizontal ?? CrossAxisAlignment.start,
          children: _children,
        ),
      );
}
