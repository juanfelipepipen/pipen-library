import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pipen/routes.dart';
import 'package:pipen/src/tools/value_provider.dart';

class PipenModalsHandler extends StatefulWidget {
  const PipenModalsHandler({super.key, required this.child});

  final Widget child;

  @override
  State<PipenModalsHandler> createState() => _PipenModalsHandlerState();
}

class _PipenModalsHandlerState extends State<PipenModalsHandler> {
  late PipenModalController controller;

  @override
  void initState() {
    super.initState();
    controller = PipenModalController();
    controller.stream.listen(_onModal);
  }

  /// Open modal and complete operation
  void _onModal(PipenModalCreator modalCreator) {
    modalCreator.complete(context);
  }

  @override
  Widget build(BuildContext context) => ValueProvider<PipenModalController>(
    value: controller,
    child: widget.child,
  );
}

class PipenModalController {
  final _streamController = StreamController<PipenModalCreator>.broadcast();

  Stream<PipenModalCreator> get stream => _streamController.stream;

  void show<T>(PipenModalCreator<T> modalCreator) {
    _streamController.add(modalCreator);
  }

  void dispose() {
    _streamController.close();
  }
}

class PipenModalCreator<T> {
  PipenModalCreator({
    required this.page,
    required this.theme,
    required this.route,
    required this.completer,
  });

  final Widget page;
  final ModalRouteTheme theme;
  final TypeSafeModalRoute route;
  final Completer<T?> completer;

  /// Open modal and complete operation
  void complete(BuildContext context) async {
    final result = await open(context);
    return completer.complete(result);
  }

  /// Open modal and return result
  Future<T?> open(BuildContext context) async {
    return await PipenRouterConfigs.modalBuilder.builder<T>(
      context,
      route,
      page,
      theme,
    );
  }
}
