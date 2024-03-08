import '../../../valuable/valuable.dart';
import '../formux_input.dart';

abstract class FormuxInputValuableAbstract extends FormuxInput<Valuable?> {
  FormuxInputValuableAbstract({required super.value, List<Valuable>? items, super.required}) {
    if (items != null) {
      _items = items;
    }
  }

  List<Valuable> get items => _items;
  List<Valuable> _items = [];

  /// Get the current value index from items list
  int? getValueIndexList() {
    if (value != null && _items.isNotEmpty) {
      int index = _items.indexWhere((element) => element.value == value!.value);
      return index > -1 ? index : null;
    }
    return null;
  }

  /// Add items to items list
  void addItem(Valuable item) => _items.add(item);

  /// Add items to items list from valuable values
  void addItemValues({required String title, required String value}) =>
      _items.add(Valuable(title: title, value: value));

  /// Set all items list
  void addItems(List<Valuable> items) => _items = items;

  /// Clear items list
  void clearItems() => _items = [];

  /// Get items length
  int getItemsLength() => _items.length;

  Valuable? getItem(int index) => _items.length >= index ? _items[index] : null;
}
