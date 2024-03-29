import 'package:flutter/cupertino.dart';
import '../../../valuable/valuable.dart';

class FormuxUiDropdownCupertino extends StatelessWidget {
  const FormuxUiDropdownCupertino({super.key, this.onChange, required this.selectedItem, required this.items});

  final Function(Valuable? value)? onChange;
  final List<Valuable> items;
  final int selectedItem;

  @override
  Widget build(BuildContext context) => CupertinoPicker(
      squeeze: 1.2,
      itemExtent: 32.0,
      magnification: 1,
      useMagnifier: true,
      scrollController: FixedExtentScrollController(initialItem: selectedItem),
      onSelectedItemChanged: (int selectedItem) => onChange?.call(items[selectedItem]),
      children: List<Widget>.generate(items.length, (int index) => Center(child: Text(items[index].title))));
}
