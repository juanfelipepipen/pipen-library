import 'package:pipen/components/scroll/pipen_scroll_override.dart';
import 'package:pipen/components/column/pipen_column.dart';
import 'package:flutter/material.dart';

class PipenScrollView extends StatefulWidget {
  PipenScrollView({
    super.key,
    this.child,
    this.children,
    this.scrollDirection,
    this.bottomSafeArea = false,
    this.padding = EdgeInsets.zero,
  }) {
    assert(children != null || child != null);
  }

  final List<Widget>? children;
  final Axis? scrollDirection;
  final bool bottomSafeArea;
  final EdgeInsets padding;
  final Widget? child;

  @override
  State<PipenScrollView> createState() => _PipenScrollViewState();
}

class _PipenScrollViewState extends State<PipenScrollView> {
  List<Widget> get children => widget.child != null ? [widget.child!] : widget.children!;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) => Scrollbar(
    thumbVisibility: true,
    controller: controller,
    child: PipenScrollOverride(
      child: SingleChildScrollView(
        controller: controller,
        scrollDirection: widget.scrollDirection ?? Axis.vertical,
        child: Padding(
          padding: widget.padding,
          child: PipenColumn(
            children: [...children, SizedBox(height: widget.bottomSafeArea ? 100 : 0)],
          ),
        ),
      ),
    ),
  );
}
