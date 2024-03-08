abstract class FormuxInput<T> {
  String? get error => _messages.isNotEmpty ? _messages.first : null;

  /// Display error
  bool get display => !pass && errors && required;
  bool required, errors = false, _loading = false, displayOnUpdate;

  /// Error messages
  List<String> get messages => _messages;
  List<String> _messages = [];

  /// Input passed
  bool get pass => _messages.isEmpty;

  bool get isLoading => _loading;

  /// Input value
  T get value => _value;
  late T _value;

  FormuxInput({required T value, this.required = true, this.displayOnUpdate = false}) {
    _value = value;
    validate();
    hideErrors();
  }

  /// [Abstract] Input validator
  void validator();

  /// [Abstract] Clear input
  void clear();

  /// [Setter] Set input value
  set value(T value) {
    _value = value;
    validate();
  }

  /// Validate input
  void validate() {
    _messages = [];
    validator();
    errors = true;
  }

  /// Add custom error
  FormuxInput<T> addError(String message) {
    _messages.add(message);
    errors = true;
    return this;
  }

  /// Assertion for invalidate input
  FormuxInput<T> assertion(bool condition, String message) {
    if (condition) {
      _messages.add(message);
    }
    return this;
  }

  /// Is loading flag
  FormuxInput<T> loading() {
    _loading = true;
    return this;
  }

  /// Is loaded flag
  FormuxInput<T> loaded() {
    _loading = false;
    return this;
  }

  /// Make input required
  FormuxInput<T> isRequired() {
    required = true;
    return this;
  }

  /// Show input errors
  FormuxInput<T> showErrors() {
    errors = true;
    return this;
  }

  /// Hide input errors
  FormuxInput<T> hideErrors() {
    errors = false;
    return this;
  }
}
