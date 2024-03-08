import 'package:pipen/components/gesture/pipen_gesture_tap.dart';
import '../../controllers/formux_dropdown_controller.dart';
import '../../../valuable/valuable.dart';
import 'package:flutter/material.dart';

class FormuxUiDropdown extends StatefulWidget {
  const FormuxUiDropdown({
    super.key,
    this.items,
    this.value,
    this.label,
    this.onChange,
    this.enabled = true,
    required this.builder,
    required this.cancelLabel,
    required this.acceptLabel,
    required this.buttonsColor,
  });

  final Function(Valuable? value)? onChange;
  final Function(String? value) builder;
  final String cancelLabel, acceptLabel;
  final List<Valuable>? items;
  final Color buttonsColor;
  final Valuable? value;
  final String? label;
  final bool enabled;

  @override
  State<FormuxUiDropdown> createState() => _FormuxUiDropdownState();
}

class _FormuxUiDropdownState extends State<FormuxUiDropdown> {
  List<Valuable> get items => widget.items ?? [];
  Valuable? selected;

  @override
  Widget build(BuildContext context) => PipenGestureTap(
        onTap: () => widget.enabled
            ? FormuxDropdownController.of(context)
                .cancelLabel(widget.cancelLabel)
                .acceptLabel(widget.acceptLabel)
                .buttonsColor(widget.buttonsColor)
                .onAccept(() => widget.onChange?.call(selected))
                .onChange((value) => setState(() => selected = value))
                .open(items: items, value: widget.value)
            : null,
        child: widget.builder.call(widget.value?.title),
      );
}
