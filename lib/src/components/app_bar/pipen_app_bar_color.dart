import 'package:flutter/material.dart';

class PipenAppBarColor extends StatelessWidget implements PreferredSizeWidget {
  const PipenAppBarColor({this.color, super.key});

  final Color? color;

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) => AppBar(
    elevation: 0,
    toolbarHeight: 0,
    backgroundColor: color,
    foregroundColor: color,
    scrolledUnderElevation: 0,
  );
}
