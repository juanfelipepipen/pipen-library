import '../formux_input.dart';

abstract class FormuxInputIntegerAbstract extends FormuxInput<int?> {
  FormuxInputIntegerAbstract({required this.items, super.value, super.required});

  List<int> items;
}
