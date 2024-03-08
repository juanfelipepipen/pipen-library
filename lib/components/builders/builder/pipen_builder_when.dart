import 'package:skeletons/skeletons.dart';
import 'package:flutter/widgets.dart';

class PipenBuilderWhen<W> extends StatelessWidget {
  const PipenBuilderWhen({
    super.key,
    this.height,
    this.skeleton,
    this.loading = false,
    required this.child,
    required this.value,
  });

  final Function(W on) child;
  final Widget? skeleton;
  final double? height;
  final dynamic value;
  final bool loading;

  bool get buildNow => value is W && !loading;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: skeleton != null
            ? Skeleton(
                skeleton: skeleton!,
                isLoading: !buildNow,
                child: buildNow ? child.call(value as W) : const SizedBox.shrink(),
              )
            : buildNow
                ? child.call(value as W)
                : const SizedBox.shrink(),
      );
}
