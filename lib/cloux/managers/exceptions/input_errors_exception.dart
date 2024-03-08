import 'package:pipen/formux/abstract/type/formux_input_id.dart';
import 'package:pipen/cloux/managers/models/input_error.dart';

class InputErrorsException implements Exception {
  InputErrorsException({required this.errors});

  List<InputError> errors;

  /// Add error to form
  void form(FormuxInputId form) {
    for (String field in form.ids.keys) {
      int index = errors.indexWhere((element) => element.field == field);
      if (index > -1) {
        String error = errors[index].errors.first;
        form.ids[field]?.addError(error);
        errors.removeAt(index);
      }
    }
  }
}
