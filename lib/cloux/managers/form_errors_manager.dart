import 'package:pipen/cloux/managers/exceptions/input_errors_exception.dart';
import 'package:pipen/cloux/managers/models/input_error.dart';

class FormErrorsManager {
  FormErrorsManager(this.data);

  Map<dynamic, dynamic> data;

  /// Process input errors
  void handle() {
    List<InputError> errors = [];

    /// Map errors
    if (data['errors'] is Map<String, dynamic>) {
      Map<String, dynamic> errorsMap = data['errors'] as Map<String, dynamic>;
      for (var key in errorsMap.keys) {
        if (errorsMap[key] is List<dynamic>) {
          InputError error = InputError.fromList(field: key, errors: errorsMap[key]);
          errors.add(error);
        }
      }
    }

    /// Throw errors
    if (errors.isNotEmpty) {
      throw InputErrorsException(errors: errors);
    }
  }
}
