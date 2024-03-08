import 'package:flutter/widgets.dart';

class PipenDivider extends StatelessWidget {
  const PipenDivider({this.margin = EdgeInsets.zero, this.color, super.key});

  final EdgeInsets margin;
  final Color? color;

  @override
  Widget build(BuildContext context) => Container(
        height: 1,
        margin: margin,
        color: color ?? const Color.fromRGBO(226, 226, 226, 1),
      );
}
