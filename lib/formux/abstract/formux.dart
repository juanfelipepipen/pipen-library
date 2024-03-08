import '../exceptions/formux_failed_pass_exception.dart';
import 'package:flutter/foundation.dart';
import '../../valuable/valuable.dart';
import 'formux_input.dart';

abstract class Formux {
  bool get hasId => id != null;

  String? id;

  /// [Getter] All inputs passed
  bool get passed => inputs.every((input) {
        if (input.required) {
          return input.pass;
        }
        return true;
      });

  List<FormuxInput> get inputs;

  /// Check if form pass validations
  void pass() {
    if (!passed) {
      showErrors();
      throw FormuxFailedPassException();
    }
  }

  /// Validate inputs
  Formux validate() {
    for (FormuxInput input in inputs) {
      input.validate();
    }
    return this;
  }

  /// Check if form is invalid, show errors and return status
  bool valid() {
    if (!passed) {
      showErrors();
    }
    return passed;
  }

  /// Is loading form
  dynamic loading() {
    for (FormuxInput input in inputs) {
      input.loading();
    }
    return this;
  }

  /// Is loading form
  dynamic loaded() {
    for (FormuxInput input in inputs) {
      input.loaded();
    }
    return this;
  }

  /// Hide input errors
  void hideErrors() {
    for (FormuxInput input in inputs) {
      input.hideErrors();
    }
  }

  /// Show errors
  void showErrors() {
    for (FormuxInput input in inputs) {
      input.showErrors();
    }
  }

  /// Map inputs and print
  void toMap() {
    Map<String, dynamic> values = {};
    int i = 0;

    for (FormuxInput input in inputs) {
      i++;
      values[i.toString()] = getInputValue(input.value);
    }

    if (kDebugMode) {
      print(values);
    }
  }

  /// Get input value in string
  String getInputValue(dynamic value) {
    if (value is Valuable) {
      return value.value;
    }

    return value.toString();
  }
}
