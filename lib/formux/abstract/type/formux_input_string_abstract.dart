import '../formux_input.dart';

abstract class FormuxInputStringAbstract extends FormuxInput<String> {
  FormuxInputStringAbstract({super.value = '', super.required});

  String? get valueOrNull => value.isEmpty ? null : value;
}
