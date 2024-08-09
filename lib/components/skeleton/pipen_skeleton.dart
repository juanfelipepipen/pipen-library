import 'package:flutter/cupertino.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:pipen/abstract/loading_state.dart';

class PipenSkeleton extends StatelessWidget {
  const PipenSkeleton({
    super.key,
    this.state,
    this.width,
    this.height,
    this.isLoading,
    required this.skeleton,
    required this.child,
  });

  final Widget skeleton, child;
  final double? width, height;
  final bool? isLoading;
  final dynamic state;

  bool get _isLoading => isLoading == true || state is LoadingState;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
        child: Skeleton(
          isLoading: _isLoading,
          skeleton: skeleton,
          child: child,
        ),
      );
}
