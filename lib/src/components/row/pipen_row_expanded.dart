part of 'pipen_row.dart';

class _PipenRowExpanded extends StatelessWidget {
  const _PipenRowExpanded({
    this.padding,
    this.vertical,
    this.horizontal,
    required this.spacing,
    required this.children,
  });

  final MainAxisAlignment? horizontal;
  final CrossAxisAlignment? vertical;
  final List<Widget> children;
  final EdgeInsets? padding;
  final double spacing;

  @override
  Widget build(BuildContext context) => PipenRow(
    padding: padding,
    spacing: spacing,
    vertical: vertical,
    horizontal: horizontal,
    listable: children.map((e) => Expanded(child: e)),
  );
}
