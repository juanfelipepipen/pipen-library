part of 'pipen_row.dart';

class _PipenRowExpanded extends StatelessWidget {
  const _PipenRowExpanded({
    this.padding,
    this.vertical,
    this.horizontal,
    this.intrinsicHeight,
    required this.spacing,
    required this.children,
  });

  final MainAxisAlignment? horizontal;
  final CrossAxisAlignment? vertical;
  final bool? intrinsicHeight;
  final List<Widget> children;
  final EdgeInsets? padding;
  final double spacing;

  Widget get _row => PipenRow(
    padding: padding,
    spacing: spacing,
    vertical: vertical,
    horizontal: horizontal,
    listable: children.map((e) => Expanded(child: e)),
  );

  @override
  Widget build(BuildContext context) =>
      intrinsicHeight == true ? IntrinsicHeight(child: _row) : _row;
}
