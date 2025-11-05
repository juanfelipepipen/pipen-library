import 'package:flutter/material.dart';
import '../../../components.dart';

class PipenScrollView extends StatefulWidget {
  PipenScrollView({
    super.key,
    this.child,
    this.spacing,
    this.physics,
    this.children,
    this.controller,
    this.scrollDirection,
    this.thumbVisibility = true,
    this.bottomSafeArea = false,
    this.padding = EdgeInsets.zero,
  }) {
    assert(children != null || child != null);
  }

  final bool bottomSafeArea, thumbVisibility;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final List<Widget>? children;
  final Axis? scrollDirection;
  final EdgeInsets padding;
  final double? spacing;
  final Widget? child;

  @override
  State<PipenScrollView> createState() => _PipenScrollViewState();
}

class _PipenScrollViewState extends State<PipenScrollView> {
  List<Widget> get children =>
      widget.child != null ? [widget.child!] : widget.children!;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) => Scrollbar(
    thumbVisibility: widget.thumbVisibility,
    controller: widget.controller ?? controller,
    child: PipenScrollOverride(
      child: SingleChildScrollView(
        physics: widget.physics,
        padding: widget.padding,
        controller: widget.controller ?? controller,
        scrollDirection: widget.scrollDirection ?? Axis.vertical,
        child: PipenColumn(
          spacing: widget.spacing,
          children: [
            ...children,
            SizedBox(height: widget.bottomSafeArea ? 100 : 0),
          ],
        ),
      ),
    ),
  );
}
