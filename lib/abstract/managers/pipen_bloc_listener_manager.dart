import 'package:pipen/abstract/fail_state.dart';
import 'package:flutter/widgets.dart';

abstract class PipenBlocListenerManager<T> {
  PipenBlocListenerManager(this.context, this.state, {this.interceptExceptions = false}) {
    /// Handle listen action on state change
    listen();

    /// Handle exceptions manager
    if (!interceptExceptions && state is FailState) {
      exceptions(state as FailState);
    }
  }

  /// Flag for handle exceptions or intercept manually
  final bool interceptExceptions;

  /// Parent context
  final BuildContext context;

  /// Current state on BLoC
  final T state;

  /// [Abstract] Handle exception managers
  void exceptions(FailState state);

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
}
