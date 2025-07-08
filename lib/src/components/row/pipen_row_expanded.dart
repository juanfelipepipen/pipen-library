part of 'pipen_row.dart';

class _PipenRowExpanded extends StatelessWidget {
  const _PipenRowExpanded({required this.spacing, required this.children});

  final double spacing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) =>
      PipenRow(spacing: spacing, listable: children.map((e) => Expanded(child: e)));
}
