import 'package:flutter/material.dart';

class FormuxUiTextField extends StatefulWidget {
  const FormuxUiTextField({
    this.hintText,
    this.focusNode,
    this.maxLines,
    this.onChanged,
    this.maxLength,
    this.fontWeight,
    this.onSubmitted,
    this.keyboardType,
    this.hintFontWeight,
    required this.value,
    this.textSize = 16,
    this.enable = true,
    this.required = false,
    this.autofocus = false,
    this.obscureText = false,
    this.contentPaddingLeft = 8,
    super.key,
  });

  final FontWeight? fontWeight, hintFontWeight;
  final double textSize, contentPaddingLeft;
  final bool required, obscureText, enable;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLength, maxLines;
  final Function()? onSubmitted;
  final FocusNode? focusNode;
  final String? hintText;
  final bool autofocus;
  final String value;

  @override
  State<FormuxUiTextField> createState() => _SimpleTextFieldRawState();
}

class _SimpleTextFieldRawState extends State<FormuxUiTextField> {
  TextEditingController controller = TextEditingController();
  late FocusNode focusNode;

  @override
  void initState() {
    controller.text = widget.value;
    focusNode = FocusNode();

    if (widget.autofocus) {
      focusNode.requestFocus();
    }

    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant FormuxUiTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    didUpdateTextFromInput();
  }

  /// Update controller text from input text
  @protected
  void didUpdateTextFromInput() {
    if (widget.value != controller.text) {
      setState(() {
        controller.text = widget.value;
        controller.selection = TextSelection(
          baseOffset: widget.value.length,
          extentOffset: widget.value.length,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) => TextField(
        cursorHeight: 20,
        autocorrect: false,
        controller: controller,
        cursorColor: Colors.black,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines ?? 1,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode ?? focusNode,
        onSubmitted: (value) => widget.onSubmitted?.call(),
        onChanged: (value) => widget.onChanged?.call(value),
        style: TextStyle(
          fontSize: widget.textSize,
          fontWeight: widget.fontWeight,
        ),
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          enabled: widget.enable,
          border: InputBorder.none,
          alignLabelWithHint: true,
          hintText: widget.hintText,
          counter: const Offstage(),
          contentPadding: EdgeInsets.only(
            top: 4,
            left: widget.contentPaddingLeft,
          ),
          hintStyle: TextStyle(
            fontSize: widget.textSize,
            fontWeight: widget.hintFontWeight,
            color: widget.enable ? Colors.grey : Colors.grey.withOpacity(0.4),
          ),
        ),
      );
}
