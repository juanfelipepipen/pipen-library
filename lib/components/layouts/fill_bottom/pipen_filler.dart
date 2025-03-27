import 'package:flutter/cupertino.dart';
import 'package:pipen/components/column/pipen_column.dart';

class PipenFiller extends StatelessWidget {
  PipenFiller({super.key, this.top, this.bottom, this.topChildren, this.bottomChildren}) {
    assert(top != null || topChildren != null);
    assert(bottom != null || bottom != null);
  }

  final List<Widget>? topChildren, bottomChildren;
  final Widget? top, bottom;

  @override
  Widget build(BuildContext context) => CustomScrollView(
    physics: const ClampingScrollPhysics(),
    slivers: [
      SliverToBoxAdapter(child: PipenColumn(child: top, children: topChildren)),
      SliverFillRemaining(
        hasScrollBody: false,
        fillOverscroll: false,
        child: PipenColumn.end(children: bottomChildren, child: bottom),
      ),
    ],
  );
}
