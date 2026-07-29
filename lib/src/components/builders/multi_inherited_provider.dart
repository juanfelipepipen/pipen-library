import 'package:flutter/cupertino.dart';

class MultiInheritedProvider extends StatelessWidget {
  final List<Widget Function(Widget child)> providers;
  final Widget child;

  const MultiInheritedProvider({
    required this.providers,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return providers.reversed.fold(child, (acc, provider) => provider(acc));
  }
}
