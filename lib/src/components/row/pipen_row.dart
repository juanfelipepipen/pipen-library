import 'package:flutter/widgets.dart';

part 'pipen_row_expanded.dart';

class PipenRow extends StatelessWidget {
  PipenRow({
    super.key,
    this.child,
    this.padding,
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
    this.padding,
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
    this.padding,
    this.children,
    this.spacing,
    this.listable,
    this.mainAxisSize,
    this.vertical = CrossAxisAlignment.center,
    this.horizontal = MainAxisAlignment.center,
  });

  const PipenRow.min({
    super.key,
    this.child,
    this.padding,
    this.listable,
    this.spacing,
    this.children,
    this.vertical = CrossAxisAlignment.start,
    this.horizontal = MainAxisAlignment.start,
  }) : mainAxisSize = MainAxisSize.min;

  final MainAxisAlignment? horizontal;
  final CrossAxisAlignment? vertical;
  final Iterable<Widget>? listable;
  final MainAxisSize? mainAxisSize;
  final List<Widget>? children;
  final EdgeInsets? padding;
  final double? spacing;
  final Widget? child;

  /// Row with expanded in every widget in children
  static Widget expanded({double spacing = 0, required List<Widget> children}) =>
      _PipenRowExpanded(spacing: spacing, children: children);

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
      spacing: spacing ?? 0,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      crossAxisAlignment: vertical ?? CrossAxisAlignment.start,
      mainAxisAlignment: horizontal ?? MainAxisAlignment.start,
      children: _children,
    ),
  );
}
