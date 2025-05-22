import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class PipenLottie extends StatefulWidget {
  const PipenLottie({super.key, this.repeat = false, required this.asset, this.height});

  final double? height;
  final String asset;
  final bool repeat;

  @override
  State<PipenLottie> createState() => _PipenLottieState();
}

class _PipenLottieState extends State<PipenLottie> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Lottie.asset(
        widget.asset,
        height: widget.height,
        controller: _controller,
        onLoaded: (composition) {
          if (widget.repeat) {
            _controller
              ..duration = composition.duration
              ..repeat();
          } else {
            _controller
              ..duration = composition.duration
              ..forward();
          }
        },
      );
}
