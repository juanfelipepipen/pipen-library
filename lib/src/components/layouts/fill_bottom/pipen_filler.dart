import 'package:flutter/cupertino.dart';
import '../../../../components.dart';

class PipenFiller extends StatelessWidget {
  PipenFiller({
    super.key,
    this.top,
    this.bottom,
    this.padding,
    this.topSpacing,
    this.topPadding,
    this.topChildren,
    this.bottomChildren,
  }) {
    assert(top != null || topChildren != null);
    assert(bottom != null || bottom != null);
  }

  final List<Widget>? topChildren, bottomChildren;
  final EdgeInsets? padding, topPadding;
  final Widget? top, bottom;
  final double? topSpacing;

  @override
  Widget build(BuildContext context) => CustomScrollView(
    physics: const ClampingScrollPhysics(),
    slivers: [
      SliverToBoxAdapter(
        child: PipenColumn(
          child: top,
          padding: topPadding,
          spacing: topSpacing,
          children: topChildren,
        ),
      ),
      SliverFillRemaining(
        hasScrollBody: false,
        fillOverscroll: false,
        child: PipenColumn.end(padding: padding, children: bottomChildren, child: bottom),
      ),
    ],
  );
}
