import 'package:pipen/controllers/slice_from_up_transition_controller.dart';
import 'package:flutter/widgets.dart';

class PipenSliceFromUp extends StatefulWidget {
  const PipenSliceFromUp({
    super.key,
    this.padding,
    this.alignment,
    required this.child,
    this.show = false,
    Axis? axis,
    Duration? duration,
  }) : axis = axis ?? .vertical,
       duration = duration ?? const Duration(milliseconds: 350);

  factory PipenSliceFromUp.show({
    Alignment? alignment,
    EdgeInsets? padding,
    Duration? duration,
    required Widget child,
    Axis? axis,
  }) => PipenSliceFromUp(
    show: true,
    padding: padding,
    alignment: alignment,
    axis: axis,
    duration: duration,
    child: child,
  );

  final Alignment? alignment;
  final EdgeInsets? padding;
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
    axis: widget.axis,
    sizeFactor: controller.animation,
    child: Container(
      alignment: widget.alignment,
      padding: widget.padding,
      child: widget.child,
    ),
  );

  /// Check widget status
  void check() {
    if (widget.show != controller.showing) {
      setState(() => widget.show ? controller.show() : controller.hide());
    }
  }
}
