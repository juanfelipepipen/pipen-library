import 'package:pipen/src/components/theme/pipen_components_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:pipen/routes.dart';

class PipenApp extends StatelessWidget {
  const PipenApp({super.key, this.routeTheme, this.componentsTheme});

  final PipenComponentsTheme? componentsTheme;
  final PipenRouteTheme? routeTheme;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _PipenAppLayout extends StatefulWidget {
  const _PipenAppLayout({this.routeTheme, this.componentsTheme});

  final PipenComponentsTheme? componentsTheme;
  final PipenRouteTheme? routeTheme;

  @override
  State<_PipenAppLayout> createState() => _PipenAppLayoutState();
}

class _PipenAppLayoutState extends State<_PipenAppLayout> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
