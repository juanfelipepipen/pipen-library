import 'package:flutter/widgets.dart';

class PipenGestureDismissKeyboard extends StatelessWidget {
  final Widget child;

  const PipenGestureDismissKeyboard({required this.child, super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: child,
      );
}
