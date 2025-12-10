import 'package:flutter/cupertino.dart';
import 'package:pipen/config/typedef.dart';
import 'package:pipen/src/extensions/interleave_list_extension.dart';

part 'pipen_table_rows.dart';
part 'pipen_table_columns.dart';

class PipenTable extends StatelessWidget {
  const PipenTable({
    super.key,
    this.alignment,
    this.spacing = 0,
    this.separator = 0,
    required this.rows,
    required this.columns,
  });

  /// Alignment for table rows
  final TableCellVerticalAlignment? alignment;

  /// Table columns
  final PipenTableColumnsList columns;

  /// Table rows
  final PipenTableRowsList rows;

  /// Spacing in vertical axis in every row
  final double spacing;

  /// Separator in horizontal axis
  final double separator;

  @override
  Widget build(BuildContext context) {
    final builder = _TableBuilder(
      rows: rows,
      columns: columns,
      spacing: spacing,
      separator: separator,
    );

    return Table(
      children: builder.rows,
      columnWidths: builder.columns,
      defaultVerticalAlignment: alignment ?? TableCellVerticalAlignment.top,
    );
  }
}

class _TableBuilder {
  factory _TableBuilder({
    required double spacing,
    required double separator,
    required PipenTableRowsList rows,
    required PipenTableColumnsList columns,
  }) {
    final tableColumns = _columnsBuild(
      tableColumns: columns,
      separator: separator,
    );

    final tableRows = _rowsBuilder(
      tableRows: rows,
      spacing: spacing,
      separator: separator,
      columns: tableColumns,
      tableColumns: columns,
    );

    return _TableBuilder._(rows: tableRows, columns: tableColumns);
  }

  _TableBuilder._({required this.rows, required this.columns});

  final Map<int, TableColumnWidth> columns;
  final List<TableRow> rows;

  /// Generate horizontal order for table columns
  static Map<int, TableColumnWidth> _columnsBuild({
    required double separator,
    required PipenTableColumnsList tableColumns,
  }) {
    return tableColumns
        .map(
          (column) => switch (column) {
            PipenTableColumnMin() => const IntrinsicColumnWidth(),
            PipenTableColumnExpanded() => const FlexColumnWidth(),
            PipenTableColumnWidth() => FixedColumnWidth(column.width),
          },
        )
        .toList()
        .interleave(FixedColumnWidth(separator))
        .asMap();
  }

  /// Generate rows table
  static List<TableRow> _rowsBuilder({
    required double spacing,
    required double separator,
    required PipenTableRowsList tableRows,
    required Map<int, TableColumnWidth> columns,
    required PipenTableColumnsList tableColumns,
  }) {
    List<TableRow> rows = [];

    for (PipenTableRow tableRow in tableRows) {
      final children = WidgetList.generate(tableRow.children.length, (index) {
        final align = tableColumns[index].align ?? Alignment.topLeft;
        return Align(alignment: align, child: tableRow.children[index]);
      }).interleave(SizedBox(width: spacing));
      rows.add(TableRow(children: children));
    }

    if (separator > 0 && rows.isNotEmpty) {
      final children = WidgetList.generate(
        rows.first.children.length,
        (_) => Container(height: spacing),
      );
      rows = rows.interleave(TableRow(children: children));
    }

    return rows;
  }
}
