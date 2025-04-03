import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';
import 'package:pipen_bloc/cubit/cubit_fetch.dart';
import 'package:flutter/material.dart';

extension TableExtension on List<TableRow> {
  /// Add spacer between every row in a table
  List<TableRow> spacer(double size) {
    if (length < 2) return this;

    final factor = first.children.length;
    final spacer = TableRow(children: List.generate(factor, (_) => SizedBox(height: size)));

    return [
      for (int i = 0; i < length; i++) ...[this[i], if (i < length - 1) spacer],
    ];
  }

  /// Add spacer between every row in a table
  List<TableRow> topSpacer(double size) {
    List<TableRow> rows = [...this];

    for (final row in rows) {
      for (int i = 0; i < row.children.length; i++) {
        row.children[i] = Padding(
          padding: EdgeInsets.symmetric(vertical: size),
          child: row.children[i],
        );
      }
    }

    return rows;
  }

  List<TableRow> divider({Color? color}) {
    if (isEmpty && length < 2) return this;
    final separator = TableRow(
      children:
          Iterable.generate(
            first.children.length,
            (_) => Container(
              height: 1,
              width: double.infinity,
              color: (color ?? Colors.black).withValues(alpha: 0.2),
            ),
          ).toList(),
    );

    return [
      first,
      for (int i = 1; i < length; i++) ...[if (i != 1) separator, this[i]],
    ];
  }

  /// Add skeleton line on rows
  void skeleton(dynamic condition, {int? columns, int? number}) {
    bool loading = false;

    if (condition is FetchLoading) {
      loading = true;
    }
    if (condition case bool condition) {
      loading = condition;
    }

    if (loading && isNotEmpty || columns != null) {
      // Number of columns in every row
      int columnsFactor = columns ?? first.children.length;

      // Find child with SizedBox type for exclude skeleton
      List<int> sizedBoxIndexes =
          first.children
              .asMap()
              .entries
              .where((entry) => entry.value is SizedBox)
              .map((entry) => entry.key)
              .toList();

      skeleton() => TableRow(
        children: [
          ...Iterable.generate(columnsFactor, (index) {
            if (sizedBoxIndexes.contains(index)) {
              return SizedBox.shrink();
            }
            return SkeletonLine(style: SkeletonLineStyle(borderRadius: BorderRadius.circular(20)));
          }),
        ],
      );

      addAll(Iterable.generate(number ?? 3, (_) => skeleton()));
    }
  }
}
