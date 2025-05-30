import 'package:flutter/widgets.dart';

class PipenSkeletonList extends StatefulWidget {
  const PipenSkeletonList({required this.skeleton, this.number = 3, this.padding, super.key});

  final EdgeInsets? padding;
  final Widget skeleton;
  final int number;

  @override
  State<PipenSkeletonList> createState() => _PipenSkeletonListState();
}

class _PipenSkeletonListState extends State<PipenSkeletonList> {
  List<Widget> skeletons = [];

  @override
  void initState() {
    super.initState();
    _skeletons();
  }

  /// Get skeletons list
  void _skeletons() {
    for (int i = 0; i < widget.number; i++) {
      skeletons.add(Padding(padding: widget.padding ?? EdgeInsets.zero, child: widget.skeleton));
    }
  }

  @override
  Widget build(BuildContext context) => Column(children: skeletons);
}
