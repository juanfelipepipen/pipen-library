import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:flutter/cupertino.dart';

class PipenSkeletonizer extends StatefulWidget {
  PipenSkeletonizer({
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
  State<PipenSkeletonizer> createState() => _PipenSkeletonizerState();
}

class _PipenSkeletonizerState extends State<PipenSkeletonizer> {
  @override
  Widget build(BuildContext context) {
    final isLoading =
        (widget.state != null && widget.state is! FetchSuccess) ||
        widget.loading == true;
    final child = widget.child ?? widget.builder!(isLoading);

    return Align(
      alignment: widget.alignment ?? Alignment.topLeft,
      child: Skeleton(
        isLoading:
            (widget.state != null && widget.state is! FetchSuccess) ||
            widget.loading == true,
        skeleton: child,
        child: child,
      ),
    );
  }
}
