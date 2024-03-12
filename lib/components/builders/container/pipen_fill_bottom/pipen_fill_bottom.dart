import 'package:flutter/cupertino.dart';

class PipenFillBottom extends StatelessWidget {
  const PipenFillBottom({super.key, required this.top, required this.bottom});

  final Widget top, bottom;

  @override
  Widget build(BuildContext context) => CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: top,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: false,
            child: bottom,
          )
        ],
      );
}
