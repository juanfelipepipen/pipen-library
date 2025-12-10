import 'package:flutter/cupertino.dart';

class PipenExpand extends StatelessWidget {
  const PipenExpand({super.key, required this.child, this.expand = true});

  final Widget child;
  final bool expand;

  @override
  Widget build(BuildContext context) => expand ? Expanded(child: child) : child;
}
