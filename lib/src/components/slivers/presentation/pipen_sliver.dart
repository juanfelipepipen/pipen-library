import 'package:flutter/cupertino.dart';
import 'package:pipen/components.dart';
import 'package:pipen/config/typedef.dart';
import 'package:pipen/extensions.dart';

class PipenSliver extends StatelessWidget {
  const PipenSliver({
    super.key,
    this.spacing,
    this.physics,
    this.controller,
    EdgeInsets? padding,
    required this.slivers,
  }) : padding = padding ?? EdgeInsets.zero;

  final ScrollController? controller;
  final List<PipenSlivers> slivers;
  final ScrollPhysics? physics;
  final EdgeInsets padding;
  final double? spacing;

  static PipenSliversFill fill({required Widget child, EdgeInsets? padding}) {
    return PipenSliversFill(child: child, padding: padding);
  }

  static PipenSliversFillEnd fillEnd({
    required Widget child,
    EdgeInsets? padding,
  }) {
    return PipenSliversFillEnd(child: child, padding: padding);
  }

  static PipenSliversMin min({required Widget child, EdgeInsets? padding}) {
    return PipenSliversMin(child: child, padding: padding);
  }

  static PipenSliversColumnMin columnMin({
    required WidgetList children,
    EdgeInsets? padding,
    double? spacing,
    CrossAxisAlignment? horizontal,
    MainAxisAlignment? vertical,
  }) {
    return PipenSliversColumnMin(
      padding: padding,
      children: children,
      horizontal: horizontal,
      vertical: vertical,
      spacing: spacing,
    );
  }

  static PipenSliversColumnFill columnFill({
    required WidgetList children,
    EdgeInsets? padding,
    double? spacing,
    CrossAxisAlignment? horizontal,
    MainAxisAlignment? vertical,
  }) {
    return PipenSliversColumnFill(
      padding: padding,
      children: children,
      horizontal: horizontal,
      vertical: vertical,
      spacing: spacing,
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetList slivers =
        this.slivers
            .map(
              (sliver) => SliverPadding(
                padding: padding,
                sliver: switch (sliver) {
                  PipenSliversFillEnd() => SliverFillRemaining(
                    hasScrollBody: false,
                    fillOverscroll: false,
                    child: PipenColumn.end(
                      padding: sliver.padding,
                      child: sliver.child,
                    ),
                  ),
                  PipenSliversMin() => SliverToBoxAdapter(
                    child: Padding(
                      padding: sliver.padding ?? EdgeInsets.zero,
                      child: sliver.child,
                    ),
                  ),
                  PipenSliversFill() => SliverFillRemaining(
                    hasScrollBody: false,
                    fillOverscroll: false,
                    child: Padding(
                      padding: sliver.padding ?? EdgeInsets.zero,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: sliver.child,
                      ),
                    ),
                  ),
                  PipenSliversColumnFill() => SliverFillRemaining(
                    hasScrollBody: false,
                    fillOverscroll: false,
                    child: PipenColumn(
                      padding: sliver.padding,
                      spacing: sliver.spacing,
                      vertical: sliver.vertical,
                      horizontal: sliver.horizontal,
                      children: sliver.children,
                    ),
                  ),
                  PipenSliversColumnMin() => SliverToBoxAdapter(
                    child: PipenColumn(
                      spacing: sliver.spacing,
                      horizontal: sliver.horizontal,
                      vertical: sliver.vertical,
                      padding: sliver.padding,
                      mainAxisSize: MainAxisSize.min,
                      children: sliver.children,
                    ),
                  ),
                },
              ),
            )
            .toList();

    // Add spacing
    if (spacing case double spacing) {
      slivers = slivers.intersperse<Widget>(
        SliverPadding(
          padding: EdgeInsets.only(bottom: spacing),
          sliver: SliverToBoxAdapter(),
        ),
      );
    }

    return CustomScrollView(
      controller: controller,
      physics: physics ?? ClampingScrollPhysics(),
      slivers: slivers,
    );
  }
}
