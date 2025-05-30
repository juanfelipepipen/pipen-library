import 'package:pipen/src/components/theme/pipen_components_theme.dart';
import 'package:pipen/src/routes/theme/modal_route_theme.dart';
import 'package:flutter/cupertino.dart';

typedef PipenThemes = ({PipenComponentsTheme? componentsTheme, ModalRouteTheme? routeTheme});

class PipenTheme extends InheritedWidget {
  const PipenTheme({super.key, required this.themes, required super.child});

  final PipenThemes themes;

  static PipenTheme? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PipenTheme>();
  }

  static PipenTheme of(BuildContext context) {
    final PipenTheme? result = maybeOf(context);
    assert(result != null, 'No Themes found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PipenTheme oldWidget) => themes != oldWidget.themes;
}
