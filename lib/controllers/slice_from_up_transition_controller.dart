import 'package:flutter/cupertino.dart';
import 'animation_generator.dart';

class SliceFromUpTransitionController extends AnimationGeneration {
  /// [Getter] Animation finished
  bool get showing => controllerAnimation.status == AnimationStatus.completed;

  /// Animation controller
  late AnimationController controllerAnimation;

  /// Animation
  late Animation<double> animation;

  /// Handle on animation finished
  final Function()? onFinished;

  /// [Constructor]
  SliceFromUpTransitionController(super.ticker, super.duration, [this.onFinished]) {
    controllerAnimation = generateAnimationController();
    animation = generateAnimation(controllerAnimation);
  }

  /// Show animation
  void show() {
    if (controllerAnimation.status == AnimationStatus.dismissed) {
      controllerAnimation.forward().whenComplete(onFinished ?? () => null);
    }
  }

  /// Hide animation
  void hide() {
    if (controllerAnimation.status == AnimationStatus.completed) {
      controllerAnimation.animateBack(0, duration: super.duration).whenComplete(onFinished ?? () => null);
    }
  }
}
