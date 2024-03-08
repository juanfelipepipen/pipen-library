import 'package:flutter/cupertino.dart';

class FormuxUiSwitchButton extends StatelessWidget {
  const FormuxUiSwitchButton(
      {super.key, this.value = false, this.onChange, this.activeColor, this.enabled = true});

  final Function(bool value)? onChange;
  final bool value, enabled;
  final Color? activeColor;

  Color get color => activeColor ?? CupertinoColors.activeBlue;

  @override
  Widget build(BuildContext context) => CupertinoSwitch(
        value: value,
        activeColor: enabled ? color : CupertinoColors.systemGrey,
        onChanged: (bool value) {
          if (enabled) {
            onChange?.call(value);
          }
        },
      );
}
