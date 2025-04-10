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
    for (final row in this) {
      for (int i = 0; i < row.children.length; i++) {
        row.children[i] = Padding(
          padding: EdgeInsets.symmetric(vertical: size),
          child: row.children[i],
        );
      }
    }
    return this;
  }

  List<TableRow> divider({Color? color, int lastIndex = -1}) {
    if (isEmpty && length < 1) return this;

    final separator = TableRow(
      children: [
        ...Iterable.generate(
          first.children.length,
          (_) => Container(
            height: 1,
            width: double.infinity,
            color: (color ?? Colors.black).withValues(alpha: 0.2),
          ),
        ),
      ],
    );

    int inserts = length - 1;

    while (inserts > 0) {
      inserts--;
      lastIndex = lastIndex + 2;
      insert(lastIndex, separator);
    }

    return this;
  }

  List<TableRow> tableDivider() {
    return divider(lastIndex: 0);
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
