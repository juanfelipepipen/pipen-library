import 'package:swipe_refresh/swipe_refresh.dart';
import '../scroll/pipen_scroll_override.dart';
import 'package:flutter/material.dart';
import '../column/pipen_column.dart';
import 'dart:async';

class PipenSwipe extends StatefulWidget {
  PipenSwipe({
    super.key,
    this.child,
    this.onInit,
    this.gap = 0,
    this.children,
    this.onRefresh,
    this.controller,
    this.spacing = 0,
    this.padding = EdgeInsets.zero,
  }) {
    assert(children != null || child != null);
  }

  final VoidCallback? onRefresh, onInit;
  final ScrollController? controller;
  final List<Widget>? children;
  final double gap, spacing;
  final EdgeInsets padding;
  final Widget? child;

  @override
  State<PipenSwipe> createState() => _PipenSwipeState();
}

class _PipenSwipeState extends State<PipenSwipe> {
  final _controller = StreamController<SwipeRefreshState>.broadcast();
  ScrollController scrollController = ScrollController();

  Stream<SwipeRefreshState> get _stream => _controller.stream;

  @override
  void initState() {
    super.initState();
    widget.onInit?.call();
  }

  @override
  Widget build(BuildContext context) => Scrollbar(
    thumbVisibility: true,
    controller: scrollController,
    child: PipenScrollOverride(
      child: SwipeRefresh.cupertino(
        stateStream: _stream,
        padding: widget.padding,
        scrollController: scrollController,
        onRefresh: () {
          Future.delayed(
            const Duration(milliseconds: 300),
            () => _controller.sink.add(SwipeRefreshState.hidden),
          );
          widget.onRefresh?.call();
        },
        children: [
          PipenColumn(spacing: widget.spacing, children: widget.children ?? [widget.child!]),
          SizedBox(height: widget.gap),
        ],
      ),
    ),
  );
}
