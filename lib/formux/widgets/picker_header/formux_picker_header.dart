import '../../models/formux_picker_style.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormuxPickerHeader extends StatelessWidget {
  const FormuxPickerHeader({
    super.key,
    required this.child,
    required this.style,
  });

  final FormuxPickerStyle style;
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CupertinoButton(
                    alignment: Alignment.topLeft,
                    onPressed: () => Navigator.of(context).pop(),
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
            ),
            Expanded(child: child)
          ],
        ),
      );
}
