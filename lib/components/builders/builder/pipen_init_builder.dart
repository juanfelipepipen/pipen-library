import 'package:flutter/widgets.dart';

class PipenInitBuilder extends StatefulWidget {
  const PipenInitBuilder({super.key, required this.child, this.init, this.changeDependencies});

  final VoidCallback? init, changeDependencies;
  final Widget child;

  @override
  State<PipenInitBuilder> createState() => _PipenInitBuilderState();
}

class _PipenInitBuilderState extends State<PipenInitBuilder> {
  @override
  void initState() {
    widget.init?.call();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    widget.changeDependencies?.call();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
