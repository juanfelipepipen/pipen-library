import 'dart:ui';

class FormuxPickerStyle {
  final String cancelLabel, acceptLabel;
  final Color cancelColor, acceptColor;
  final VoidCallback onAccept;

  FormuxPickerStyle(
      {required this.cancelLabel,
      required this.acceptColor,
      required this.cancelColor,
      required this.acceptLabel,
      required this.onAccept});
}
