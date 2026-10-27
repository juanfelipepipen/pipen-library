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

  bool get _childTickersEnabled =>
      controller.controllerAnimation.status != AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();

    controller = SliceFromUpTransitionController(this, widget.duration);
    controller.controllerAnimation.addStatusListener(_onStatusChanged);

    if (widget.show) {
      controller.show();
    }
  }

  @override
  void dispose() {
    controller.controllerAnimation.removeStatusListener(_onStatusChanged);
    controller.controllerAnimation.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PipenSliceFromUp oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.duration != oldWidget.duration) {
      controller.controllerAnimation
        ..duration = widget.duration
        ..reverseDuration = widget.duration;
    }

    if (widget.show != oldWidget.show) {
      widget.show ? controller.show() : controller.hide();
    }
  }

  @override
  Widget build(BuildContext context) => SizeTransition(
    axis: widget.axis,
    sizeFactor: controller.animation,
    child: TickerMode(
      enabled: _childTickersEnabled,
      child: Container(
        alignment: widget.alignment,
        padding: widget.padding,
        child: widget.child,
      ),
    ),
  );

  void _onStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      setState(() {});
    }
  }
}
