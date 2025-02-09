import 'package:pipen/exception/exception_strategy.dart';
import 'package:pipen/models/fail_result.dart';
import 'package:flutter/widgets.dart';

abstract class PipenExceptionManager {
  PipenExceptionManager.of(this.context, this.fail);

  final BuildContext context;
  final FailResult fail;

  /// [Getter] Call on unknown exception
  VoidCallback get onUnknown;

  /// [Getter] List of exceptions strategies
  List<ExceptionStrategy> get strategies;

  /// [Event] Decode notification
  void decode() {
    try {
      ExceptionStrategy strategy = strategies.firstWhere(
        (element) => element.callable(fail.exception),
      );
      strategy.handle(context, fail.exception);
    } catch (_) {
      onUnknown.call();
    }
  }
}
