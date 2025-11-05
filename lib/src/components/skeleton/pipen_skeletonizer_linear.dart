import 'package:flutter/material.dart';
import 'package:pipen/components.dart';
import 'package:pipen_bloc/pipen_bloc.dart';

class PipenSkeletonizerLinear extends StatefulWidget {
  PipenSkeletonizerLinear({
    super.key,
    this.state,
    this.loading,
    this.alignment,
    this.child,
    this.builder,
  }) {
    assert(builder != null || child != null);
  }

  final Widget Function(bool isLoading)? builder;
  final Alignment? alignment;
  final FetchState? state;
  final bool? loading;
  final Widget? child;

  @override
  State<PipenSkeletonizerLinear> createState() =>
      _PipenSkeletonizerLinearState();
}

class _PipenSkeletonizerLinearState extends State<PipenSkeletonizerLinear> {
  @override
  Widget build(BuildContext context) => PipenSkeletonizer(
    state: widget.state,
    loading: widget.loading,
    alignment: widget.alignment,
    builder:
        (isLoading) => Container(
          decoration: BoxDecoration(
            color: isLoading ? Colors.black : null,
            borderRadius: BorderRadius.circular(100),
          ),
          child: widget.child,
        ),
  );
}
