import 'package:flutter/widgets.dart';

class ValueProvider<T> extends InheritedWidget {
  const ValueProvider({super.key, required this.value, required super.child});

  final T value;

  static T of<T>(BuildContext context) {
    final ValueProvider<T>? provider =
        context.dependOnInheritedWidgetOfExactType<ValueProvider<T>>();
    if (provider == null) {
      throw FlutterError(
        'No se encontró un ValueProvider<$T> en el árbol de widgets.\n'
        'Asegúrate de envolver tu widget con un ValueProvider<$T>.\n'
        'Por ejemplo:\n'
        '  ValueProvider<$T>(value: ..., child: MiWidget())',
      );
    }
    return provider.value;
  }

  static T? maybeOf<T>(BuildContext context) {
    final ValueProvider<T>? provider =
        context
                .getElementForInheritedWidgetOfExactType<ValueProvider<T>>()
                ?.widget
            as ValueProvider<T>?;
    return provider?.value;
  }

  @override
  bool updateShouldNotify(ValueProvider<T> oldWidget) {
    return oldWidget.value != value;
  }
}
