import 'package:flutter/widgets.dart';

class AnimationGeneration {
  /// Ticker provider
  final TickerProvider ticker;

  /// Animation duration
  final Duration duration;

  /// [Constructor]
  AnimationGeneration(this.ticker, this.duration);

  /// Generate animation controller
  @protected
  AnimationController generateAnimationController() =>
      AnimationController(vsync: ticker, duration: duration, reverseDuration: duration);

  /// Generate animation
  @protected
  CurvedAnimation generateAnimation(AnimationController controller) =>
      CurvedAnimation(parent: controller, curve: Curves.fastLinearToSlowEaseIn);
}
