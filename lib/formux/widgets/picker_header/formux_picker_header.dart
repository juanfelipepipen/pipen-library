import 'package:pipen/components/row/pipen_row.dart';
import '../../models/formux_picker_style.dart';
import 'package:flutter/cupertino.dart';

class FormuxPickerHeader extends StatelessWidget {
  const FormuxPickerHeader({super.key, required this.style});

  final FormuxPickerStyle style;

  @override
  Widget build(BuildContext context) => PipenRow(
        padding: const EdgeInsets.symmetric(vertical: 5),
        children: [
          Expanded(
            child: CupertinoButton(
              alignment: Alignment.topLeft,
              onPressed: Navigator.of(context).pop,
              child: Text(
                style.cancelLabel,
                style: TextStyle(color: style.cancelColor),
              ),
            ),
          ),
          Expanded(
            child: CupertinoButton(
              onPressed: () {
                style.onAccept.call();
                Navigator.of(context).pop();
              },
              alignment: Alignment.topRight,
              child: Text(
                style.acceptLabel,
                style: TextStyle(color: style.acceptColor),
              ),
            ),
          )
        ],
      );
}
