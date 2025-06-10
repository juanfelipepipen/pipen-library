import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:flutter/widgets.dart';

typedef When<T> = PipenBuilderWhen<T>;
typedef WhenFetchSuccess<T> = PipenBuilderWhen<FetchSuccess<T>>;

enum SkeletonType { shimmer, simple }

sealed class _SkeletonType<W> {}

class _SkeletonShimmer<W> extends _SkeletonType<W> {
  _SkeletonShimmer({required this.skeleton});

  final Widget skeleton;
}

class _SkeletonSimple<W> extends _SkeletonType<W> {
  _SkeletonSimple({required this.skeleton});

  final Widget skeleton;
}

class _SkeletonNone<W> extends _SkeletonType<W> {}

class PipenBuilderWhen<W> extends StatelessWidget {
  const PipenBuilderWhen({
    super.key,
    this.deny,
    this.height,
    this.width,
    this.margin,
    this.skeleton,
    this.minHeight,
    this.alignment,
    this.loading = false,
    this.skeletonType = SkeletonType.shimmer,
    required this.value,
    required this.child,
  });

  final double? height, width, minHeight;
  final Widget Function(W on) child;
  final SkeletonType skeletonType;
  final Widget? skeleton, deny;
  final Alignment? alignment;
  final EdgeInsets? margin;
  final dynamic value;
  final bool loading;

  bool get _isLoaded => value is W && !loading;

  _SkeletonType<W> get _skeletonMode {
    if (skeletonType == SkeletonType.shimmer && skeleton != null) {
      return _SkeletonShimmer<W>(skeleton: skeleton!);
    }

    if (skeletonType == SkeletonType.simple && skeleton != null) {
      return _SkeletonSimple<W>(skeleton: skeleton!);
    }

    return _SkeletonNone<W>();
  }

  @override
  Widget build(BuildContext context) => Container(
    width: width,
    alignment: alignment,
    margin: margin ?? EdgeInsets.zero,
    height: minHeight == null ? height : null,
    constraints: height == null && minHeight != null ? BoxConstraints(minHeight: minHeight!) : null,
    child: switch (_skeletonMode) {
      /// Skeleton
      _SkeletonShimmer(skeleton: Widget skeleton) => Skeleton(
        skeleton: skeleton,
        isLoading: !_isLoaded,
        child: _isLoaded ? child.call(value as W) : const SizedBox.shrink(),
      ),

      /// Simple
      _SkeletonSimple(skeleton: Widget skeleton) => AnimatedSwitcher(
        duration: Duration(milliseconds: 150),
        transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
        child: _isLoaded ? child.call(value as W) : skeleton,
      ),

      /// None
      _SkeletonNone() => _isLoaded ? child.call(value as W) : deny ?? const SizedBox.shrink(),
    },
  );
}
