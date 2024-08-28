import 'package:pipen/components/column/pipen_column.dart';
import 'package:swipe_refresh/swipe_refresh.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class PipenSwipe extends StatefulWidget {
  PipenSwipe({
    super.key,
    this.child,
    this.onInit,
    this.gap = 0,
    this.children,
    this.controller,
    this.onRefresh,
    this.padding = EdgeInsets.zero,
  }) {
    assert(children != null || child != null);
  }

  final VoidCallback? onRefresh, onInit;
  final ScrollController? controller;
  final List<Widget>? children;
  final EdgeInsets padding;
  final Widget? child;
  final double gap;

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
  Widget build(BuildContext context) => SwipeRefresh.cupertino(
        stateStream: _stream,
        scrollController: widget.controller,
        onRefresh: () {
          Future.delayed(const Duration(milliseconds: 300),
              () => _controller.sink.add(SwipeRefreshState.hidden));
          widget.onRefresh?.call();
        },
        children: [
          PipenColumn(
            margin: widget.padding,
            children: widget.children ?? [widget.child!],
          ),
          SizedBox(
            height: widget.gap,
          )
        ],
      );
}
