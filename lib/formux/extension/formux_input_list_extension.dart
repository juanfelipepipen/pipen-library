import 'package:pipen/formux/abstract/formux_input.dart';

extension FormuxInputListExtension on List<FormuxInput> {
  /// Loading inputs
  void loading() {
    for (FormuxInput input in this) {
      input.loading();
    }
  }

  /// Loaded inputs
  void loaded() {
    for (FormuxInput input in this) {
      input.loaded();
    }
  }

  /// Clear inputs
  void clearInputs() {
    for (FormuxInput input in this) {
      input.clear();
    }
  }

  /// Required
  void required([bool isRequired = true]) {
    for (FormuxInput input in this) {
      input.required = isRequired;
      input.clear();
    }
  }

  /// Not required
  void notRequired() => required(false);
}
