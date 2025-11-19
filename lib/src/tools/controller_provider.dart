import 'package:flutter/cupertino.dart';
import 'package:pipen/controllers/context_controller.dart';

class _ControllerProvider<T extends ContextController> extends InheritedWidget {
  final T contextController;

  const _ControllerProvider({
    super.key,
    required this.contextController,
    required super.child,
  });

  static T of<T extends ContextController>(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<_ControllerProvider<T>>();
    assert(provider != null, 'No ContextProvider<$T> found in context');
    return provider!.contextController;
  }

  @override
  bool updateShouldNotify(covariant _ControllerProvider<T> oldWidget) {
    return oldWidget.contextController != contextController;
  }
}

class ControllerProvider<T extends ContextController> extends StatelessWidget {
  const ControllerProvider({
    super.key,
    required this.builder,
    required this.controller,
  });

  final Function(BuildContext context) builder;
  final T Function(BuildContext context) controller;

  static T of<T extends ContextController>(BuildContext context) {
    return _ControllerProvider.of<T>(context);
  }

  @override
  Widget build(BuildContext context) => _ControllerProvider<T>(
    contextController: controller(context),
    child: builder(context),
  );
}
