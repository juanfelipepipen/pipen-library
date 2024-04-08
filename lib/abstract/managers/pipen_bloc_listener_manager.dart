import 'package:pipen/abstract/models/pipen_bloc_listener_ignore_exceptions.dart';
import 'package:pipen/abstract/models/pipen_bloc_listener_exceptions.dart';
import 'package:pipen/abstract/fail_state.dart';
import 'package:pipen/models/fail_result.dart';
import 'package:flutter/widgets.dart';

abstract class PipenBlocListenerManager<T> {
  PipenBlocListenerManager(this.context, this.state) {
    /// Handle listen action on state change
    listen();

    /// Handle exceptions manager
    if (state case FailState state) {
      _isException(state);
    }
  }

  /// Parent context
  final BuildContext context;

  /// Current state on BLoC
  final T state;

  /// [Getter] Handle exception managers
  Function(FailResult fail) get onExceptions;

  /// [Abstract] Listen changes on BLoC state
  void listen();

  /// [Event] On state
  void on<E>(Function(E state) onState) {
    if (this.state is E) {
      onState.call(this.state as E);
    }
  }

  /// [Event] On state do
  void only<E>(Function() onState) {
    if (this.state is E) {
      onState.call();
    }
  }

  /// [Event] Navigator pop
  void pop() => Navigator.of(context).pop();

  /// [Event] Handle on exceptions
  void fail() {
    if (state case FailState state) {
      onExceptions(state.fail);
    }
  }

  /// Handle exceptions manager or use case
  void _isException(FailState state) {
    if (this case PipenBlocListenerExceptions instance) {
      instance.exception(state.fail.exception);
    } else if (this is! PipenBlocListenerIgnoreExceptions) {
      onExceptions(state.fail);
    }
  }
}
