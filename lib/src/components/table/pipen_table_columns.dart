part of 'pipen_table.dart';

typedef PipenTableColumnsList = List<PipenTableColumns>;

sealed class PipenTableColumns {
  /// Expanded column
  static PipenTableColumnExpanded expanded({Alignment? align}) =>
      PipenTableColumnExpanded(align: align);

  /// Minimum column width
  static PipenTableColumnMin min({Alignment? align}) =>
      PipenTableColumnMin(align: align);

  /// Fixed column width
  static PipenTableColumnWidth width(double width) =>
      PipenTableColumnWidth(width: width);

  PipenTableColumns({this.align});

  final Alignment? align;
}

class PipenTableColumnExpanded extends PipenTableColumns {
  PipenTableColumnExpanded({super.align});
}

class PipenTableColumnMin extends PipenTableColumns {
  PipenTableColumnMin({super.align});
}

class PipenTableColumnWidth extends PipenTableColumns {
  PipenTableColumnWidth({required this.width, super.align});

  final double width;
}
