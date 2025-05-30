import 'package:pipen/controllers/slice_from_up_transition_controller.dart';
import 'package:flutter/widgets.dart';

class PipenSliceFromUp extends StatefulWidget {
  const PipenSliceFromUp({
    super.key,
    required this.child,
    this.show = false,
    this.axis = Axis.vertical,
    this.duration = const Duration(milliseconds: 200),
  });

  final Duration duration;
  final Widget child;
  final Axis axis;
  final bool show;

  @override
  State<PipenSliceFromUp> createState() => _PipenSliceFromUpState();
}

class _PipenSliceFromUpState extends State<PipenSliceFromUp>
    with TickerProviderStateMixin<PipenSliceFromUp> {
  late SliceFromUpTransitionController controller;

  @override
  void initState() {
    controller = SliceFromUpTransitionController(this, widget.duration, check);

    if (widget.show) {
      controller.show();
    }

    super.initState();
  }

  @override
  dispose() {
    controller.controllerAnimation.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PipenSliceFromUp oldWidget) {
    check();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => SizeTransition(
    sizeFactor: controller.animation,
    axis: widget.axis,
    child: Container(child: widget.child),
  );

  /// Check widget status
  void check() {
    if (widget.show != controller.showing) {
      setState(() => widget.show ? controller.show() : controller.hide());
    }
  }
}
