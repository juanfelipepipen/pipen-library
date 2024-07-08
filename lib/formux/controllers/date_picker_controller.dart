import '../widgets/picker_header/formux_picker_header.dart';
import 'package:pipen/components/column/pipen_column.dart';
import 'package:pipen/controllers/context_controller.dart';
import 'package:pipen/extensions/context_extension.dart';
import '../models/formux_picker_style.dart';
import 'package:flutter/cupertino.dart';

class DatePickerController extends ContextController {
  DatePickerController.of(super.context) : super.of();

  /// Open picker
  void open({
    DateTime? date,
    required FormuxPickerStyle style,
    required Function(DateTime? date) onChange,
  }) =>
      display(
        style: style,
        child: CupertinoDatePicker(
          initialDateTime: date,
          onDateTimeChanged: onChange,
          mode: CupertinoDatePickerMode.date,
        ),
      );

  /// Display picker
  @protected
  void display({required Widget child, required FormuxPickerStyle style}) {
    FocusScope.of(context).unfocus();
    showCupertinoModalPopup<void>(
      context: context,
      builder: (context) => CupertinoPopupSurface(
        child: Container(
          height: context.height * 0.4,
          color: context.themeColors.surface,
          child: PipenColumn(
            children: [
              FormuxPickerHeader(style: style),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
