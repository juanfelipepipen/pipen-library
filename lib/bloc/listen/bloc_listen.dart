import 'package:pipen/abstract/models/pipen_bloc_listener_ignore_exceptions.dart';
import 'package:pipen/bloc/listen/abstract/listener_exception_strategy.dart';
import 'package:pipen/abstract/models/pipen_bloc_listener_exceptions.dart';
import 'package:pipen/bloc/listen/abstract/cubit_formux_input_error.dart';
import 'package:cloux/managers/exceptions/input_errors_exception.dart';
import 'package:pipen/abstract/fail_state.dart';
import 'package:pipen/models/fail_result.dart';
import 'package:flutter/widgets.dart';

typedef Listen<T> = (BuildContext context, T state);

abstract class BlocListen<T> {
  BlocListen({required Listen<T> listen}) {
    /// Handle listen action on state change
    _listen = listen;
    this.listen();

    /// Handle exceptions manager
    if (state case FailState state) {
      _isException(state);
    }
  }

  /// Listenable state
  late Listen<T> _listen;

  /// Current state
  T get state => _listen.$2;

  /// Parent context
  BuildContext get context => _listen.$1;

  /// Exception strategies on fail state
  List<ListenerExceptionStrategy> errorStrategies = [];

  /// [Getter] Handle local exception managers
  Function(FailResult fail)? onExceptions;

  /// [Static] Handle static exception manager
  static Function(BuildContext context, FailResult fail)? exceptionManager;

  /// On Fail getter with local instance onException or global exception manager
  void _onFail(FailResult fail) {
    if (onExceptions != null) {
      onExceptions?.call(fail);
      return;
    }
    exceptionManager?.call(context, fail);
  }

  /// [Abstract] Listen changes on BLoC state
  void listen();

  /// [Event] On state
  void on<E>(Function(E state) onState) {
    if (state is E) {
      onState.call(state as E);
    }
  }

  /// [Event] On state do
  void only<E>(Function() onState) {
    if (state is E) {
      onState.call();
    }
  }

  /// Add exception strategy
  void strategy<E>(Function(E) strategy) {
    final exceptionStrategy = ListenerExceptionStrategy<E>(strategy: strategy);
    errorStrategies.add(exceptionStrategy);
  }

  /// [Event] Navigator pop
  void pop() => Navigator.of(context).pop();

  /// [Event] Handle on exceptions
  void fail() {
    if (state case FailState state) {
      _onFail(state.fail);
    }
  }

  /// Handle exceptions manager or use case
  void _isException(FailState state) {
    _exceptionStrategies(state.fail);

    if (this case PipenBlocListenerExceptions instance) {
      instance.exception(state.fail.exception);
    } else if (this is! PipenBlocListenerIgnoreExceptions) {
      _onFail(state.fail);
    }
  }

  /// Handle exception strategies
  void _exceptionStrategies(FailResult fail) {
    /// Form exception
    if (this case CubitFormuxInputError cubitFormuxInputError) {
      strategy<InputErrorsException>(cubitFormuxInputError.cubitForm.inputErrors);
    }

    /// Handle user exception strategies
    for (var strategy in errorStrategies) {
      final callable = strategy.callable(fail.exception);
      if (callable) {
        strategy.handle(context, fail.exception);
      }
    }
  }
}
