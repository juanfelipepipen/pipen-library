import '../widgets/picker_header/formux_picker_header.dart';
import '../models/formux_picker_style.dart';
import 'package:flutter/cupertino.dart';

class DatePickerController {
  BuildContext context;

  DatePickerController.of(this.context);

  /// Open picker
  void open({DateTime? date, required FormuxPickerStyle style, required Function(DateTime? date) onChange}) => display(
      style: style,
      child: CupertinoDatePicker(
        initialDateTime: date,
        onDateTimeChanged: onChange,
        mode: CupertinoDatePickerMode.date,
      ));

  /// Display picker
  @protected
  void display({required Widget child, required FormuxPickerStyle style}) => showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoPopupSurface(
            child: FormuxPickerHeader(style: style, child: child),
          ));
}
