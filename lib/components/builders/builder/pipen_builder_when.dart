import 'package:skeletons/skeletons.dart';
import 'package:flutter/widgets.dart';

class PipenBuilderWhen<W> extends StatelessWidget {
  const PipenBuilderWhen({
    super.key,
    this.deny,
    this.height,
    this.margin,
    this.skeleton,
    this.loading = false,
    required this.value,
    required this.child,
  });

  final Widget Function(W on) child;
  final Widget? skeleton, deny;
  final EdgeInsets? margin;
  final double? height;
  final dynamic value;
  final bool loading;

  bool get buildNow => value is W && !loading;

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        margin: margin ?? EdgeInsets.zero,
        child: skeleton != null
            ? Skeleton(
                skeleton: skeleton!,
                isLoading: !buildNow,
                child: buildNow ? child.call(value as W) : const SizedBox.shrink(),
              )
            : buildNow
                ? child.call(value as W)
                : deny ?? const SizedBox.shrink(),
      );
}
