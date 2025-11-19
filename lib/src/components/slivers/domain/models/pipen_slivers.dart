import 'package:flutter/cupertino.dart';
import 'package:pipen/config/typedef.dart';

sealed class PipenSlivers {}

class PipenSliversMin extends PipenSlivers {
  PipenSliversMin({required this.child, this.padding});

  final EdgeInsets? padding;
  final Widget child;
}

class PipenSliversFill extends PipenSlivers {
  PipenSliversFill({required this.child, this.padding});

  final EdgeInsets? padding;
  final Widget child;
}

class PipenSliversFillEnd extends PipenSliversFill {
  PipenSliversFillEnd({required super.child, super.padding});
}

class PipenSliversColumnFill extends PipenSlivers {
  PipenSliversColumnFill({
    this.padding,
    required this.children,
    this.spacing,
    this.horizontal,
    this.vertical,
  });

  final CrossAxisAlignment? horizontal;
  final MainAxisAlignment? vertical;
  final EdgeInsets? padding;
  final WidgetList children;
  final double? spacing;
}

class PipenSliversColumnMin extends PipenSlivers {
  PipenSliversColumnMin({
    this.padding,
    required this.children,
    this.spacing,
    this.horizontal,
    this.vertical,
  });

  final CrossAxisAlignment? horizontal;
  final MainAxisAlignment? vertical;
  final EdgeInsets? padding;
  final WidgetList children;
  final double? spacing;
}
