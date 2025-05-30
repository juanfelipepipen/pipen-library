import 'package:pipen/src/components/scaffold/app/state/pipen_theme.dart';
import 'package:pipen/src/components/theme/pipen_components_theme.dart';
import 'package:pipen/src/routes/theme/modal_route_theme.dart';
import 'package:flutter/cupertino.dart';

class PipenApp extends StatelessWidget {
  const PipenApp({super.key, this.routeTheme, this.componentsTheme, required this.child});

  final PipenComponentsTheme? componentsTheme;
  final ModalRouteTheme? routeTheme;
  final Widget child;

  @override
  Widget build(BuildContext context) =>
      PipenTheme(themes: (componentsTheme: componentsTheme, routeTheme: routeTheme), child: child);
}
