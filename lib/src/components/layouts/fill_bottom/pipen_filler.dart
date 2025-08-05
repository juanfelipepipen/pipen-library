import 'package:flutter/material.dart';
import '../../../../components.dart';

class FillerArea {
  FillerArea({this.children, this.child, this.padding, this.spacing}) {
    assert(child != null || children != null);
  }

  final List<Widget>? children;
  final EdgeInsets? padding;
  final double? spacing;
  final Widget? child;
}

class PipenFiller extends StatefulWidget {
  const PipenFiller({
    super.key,
    this.physics,
    this.padding,
    this.controller,
    required this.top,
    required this.bottom,
  });

  final ScrollController? controller;
  final ScrollPhysics? physics;
  final FillerArea top, bottom;
  final EdgeInsets? padding;

  @override
  State<PipenFiller> createState() => _PipenFillerState();
}

class _PipenFillerState extends State<PipenFiller> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scrollbar(
    thumbVisibility: true,
    controller: scrollController,
    child: CustomScrollView(
      controller: scrollController,
      physics: widget.physics ?? const ClampingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: PipenColumn(
            child: widget.top.child,
            spacing: widget.top.spacing,
            padding: widget.padding ?? widget.top.padding,
            children: widget.top.children,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: false,
          child: PipenColumn(
            vertical: MainAxisAlignment.end,
            child: widget.bottom.child,
            spacing: widget.bottom.spacing,
            padding: widget.padding ?? widget.bottom.padding,
            children: widget.bottom.children,
          ),
        ),
      ],
    ),
  );
}
