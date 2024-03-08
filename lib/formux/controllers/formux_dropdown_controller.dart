import '../widgets/dropdown/formux_ui_dropdown_cupertino.dart';
import '../widgets/dropdown/formux_ui_dropdown_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../valuable/valuable.dart';

class FormuxDropdownController {
  FormuxDropdownController.of(this.context);

  String _cancelLabel = 'Cancel', _acceptLabel = 'Accept';
  Function(Valuable? value)? _onChange;
  Color _buttonsColor = Colors.black;
  VoidCallback? _onAccept;
  BuildContext context;

  /// Add On Change event
  FormuxDropdownController onChange(Function(Valuable? value) onChange) {
    _onChange = onChange;
    return this;
  }

  /// Cancel label
  FormuxDropdownController cancelLabel(String value) {
    _cancelLabel = value;
    return this;
  }

  /// Accept label
  FormuxDropdownController acceptLabel(String value) {
    _acceptLabel = value;
    return this;
  }

  /// Buttons color
  FormuxDropdownController buttonsColor(Color value) {
    _buttonsColor = value;
    return this;
  }

  /// Add On Accept event
  FormuxDropdownController onAccept(VoidCallback onAccept) {
    _onAccept = onAccept;
    return this;
  }

  /// Open picker
  void open({required List<Valuable> items, Valuable? value}) {
    if (items.isNotEmpty) {
      int selectedItem = items.indexWhere((element) => element.value == value?.value);
      openCupertinoPicker(items: items, selectedItem: selectedItem);
    }

    if (value != null) {
      _onChange?.call(value);
    }
  }

  /// Open cupertino picker
  @protected
  void openCupertinoPicker({required List<Valuable> items, required int selectedItem}) =>
      builder(FormuxUiDropdownCupertino(onChange: _onChange, selectedItem: selectedItem, items: items));

  /// Show cupertino modal popup
  @protected
  void builder(Widget child) => showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => FormuxUiDropdownBody(
          onAccept: _onAccept,
          cancelLabel: _cancelLabel,
          acceptLabel: _acceptLabel,
          buttonsColor: _buttonsColor,
          child: child));
}
