import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:flutter/cupertino.dart';

class PipenSkeletonizer extends StatefulWidget {
  const PipenSkeletonizer({
    super.key,
    this.state,
    this.loading,
    this.alignment,
    required this.child,
  });

  final Alignment? alignment;
  final FetchState? state;
  final bool? loading;
  final Widget child;

  @override
  State<PipenSkeletonizer> createState() => _PipenSkeletonizerState();
}

class _PipenSkeletonizerState extends State<PipenSkeletonizer> {
  @override
  Widget build(BuildContext context) => Align(
    alignment: widget.alignment ?? Alignment.topLeft,
    child: Skeleton(
      isLoading: (widget.state != null && widget.state is! FetchSuccess) || widget.loading == true,
      skeleton: widget.child,
      child: widget.child,
    ),
  );
}
