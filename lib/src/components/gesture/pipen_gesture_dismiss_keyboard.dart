import 'package:flutter/widgets.dart';

class PipenGestureDismissKeyboard extends StatelessWidget {
  const PipenGestureDismissKeyboard({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: .translucent,
    onTap: () {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    },
    child: child,
  );
}
