import '../../../column/pipen_column.dart';
import 'package:flutter/cupertino.dart';

part 'list_builder.dart';

class PipenListBuilder extends StatefulWidget {
  const PipenListBuilder({super.key, required this.builder});

  final ListBuilder builder;

  @override
  State<PipenListBuilder> createState() => _PipenListBuilderState();
}

class _PipenListBuilderState extends State<PipenListBuilder> {
  late ListBuilder maker;
  Iterable<Widget> children = [];

  @override
  void initState() {
    super.initState();
    maker = widget.builder;
    skeletons();
  }

  @override
  void didUpdateWidget(covariant PipenListBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (maker.items != widget.builder.items) {
      setState(() => maker.items = widget.builder.items);
      widgets();
    }
  }

  /// Generate skeletons
  void skeletons() {
    if (maker.items?.isEmpty == null) {
      children = maker.build();
    }
  }

  /// Generate children widgets
  void widgets() {
    if (maker.items?.isNotEmpty == false || maker.items?.isNotEmpty == null) {
      setState(() => children = []);
    }
    children = maker.build();
  }

  @override
  Widget build(BuildContext context) => PipenColumn(listable: children);
}
