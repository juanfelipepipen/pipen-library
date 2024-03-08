import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';

class PipenPageRightToLeftTransition extends CustomTransitionPage {
  const PipenPageRightToLeftTransition({required this.page})
      : super(
          child: page,
          transitionsBuilder: transitionsBuilderAnimation,
        );

  final Widget page;

  static Widget transitionsBuilderAnimation(context, animation, secondaryAnimation, child) {
    const end = Offset.zero;
    const curve = Curves.ease;
    const begin = Offset(1, 0);
    Animatable<Offset> tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(position: animation.drive(tween), child: child);
  }
}
