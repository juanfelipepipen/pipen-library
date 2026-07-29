import 'package:flutter/cupertino.dart';
import 'package:pipen/controllers/context_controller.dart';
import 'package:pipen/extensions.dart';

abstract interface class ControllerDispose {
  void close();
}

class _ControllerProvider<T extends ContextController> extends InheritedWidget {
  const _ControllerProvider({
    super.key,
    required this.controller,
    required super.child,
  });

  final T controller;

  static T of<T extends ContextController>(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<_ControllerProvider<T>>();
    assert(provider != null, 'No ContextProvider<$T> found in context');
    return provider!.controller;
  }

  @override
  bool updateShouldNotify(covariant _ControllerProvider<T> oldWidget) {
    return oldWidget.controller != controller;
  }
}

class ControllerProvider<T extends ContextController> extends StatelessWidget {
  const ControllerProvider({
    super.key,
    required this.builder,
    required this.controller,
  });

  final Function(BuildContext context, T controller) builder;
  final T Function(BuildContext context) controller;

  static T of<T extends ContextController>(BuildContext context) {
    return _ControllerProvider.of<T>(context);
  }

  @override
  Widget build(BuildContext context) => _ControllerProvider<T>(
    controller: controller(context),
    child: _ControllerProviderLayout<T>(builder: builder),
  );
}

class _ControllerProviderLayout<T extends ContextController>
    extends StatefulWidget {
  const _ControllerProviderLayout({super.key, required this.builder});

  final Function(BuildContext context, T controller) builder;

  @override
  State<_ControllerProviderLayout<T>> createState() =>
      _ControllerProviderLayoutState<T>();
}

class _ControllerProviderLayoutState<T extends ContextController>
    extends State<_ControllerProviderLayout<T>> {
  VoidCallback? closeController;

  @override
  void didChangeDependencies() {
    final controller = context.controller<T>();

    if (controller case ControllerDispose controller) {
      closeController = controller.close;
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    closeController?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, context.controller<T>());
}
