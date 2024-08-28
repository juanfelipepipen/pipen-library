import 'package:flutter/widgets.dart';

class PipenColumn extends StatelessWidget {
  PipenColumn({
    super.key,
    this.child,
    this.margin,
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
    EdgeInsets? padding,
    List<Widget>? children,
    MainAxisSize? mainAxisSize,
    Iterable<Widget>? listable,
  }) =>
      PipenColumn(
        key: key,
        child: child,
        margin: padding,
        listable: listable,
        children: children,
        mainAxisSize: mainAxisSize,
        vertical: MainAxisAlignment.center,
        horizontal: CrossAxisAlignment.center,
      );

  factory PipenColumn.end({
    Key? key,
    Widget? child,
    EdgeInsets? padding,
    List<Widget>? children,
    MainAxisSize? mainAxisSize,
    Iterable<Widget>? listable,
  }) =>
      PipenColumn(
        key: key,
        child: child,
        margin: padding,
        children: children,
        listable: listable,
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
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          mainAxisAlignment: vertical ?? MainAxisAlignment.start,
          crossAxisAlignment: horizontal ?? CrossAxisAlignment.start,
          children: _children,
        ),
      );
}
