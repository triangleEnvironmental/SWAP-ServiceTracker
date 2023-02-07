import 'package:flutter/material.dart';
import 'package:moderator_app/app/constants/index.dart';

class AnimatedMarker extends StatefulWidget {
  const AnimatedMarker({Key? key}) : super(key: key);

  @override
  AnimatedMarkerState createState() => AnimatedMarkerState();
}

class AnimatedMarkerState extends State<AnimatedMarker> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  lift() {
    _controller.animateTo(1, curve: Curves.easeOut);
  }

  drop() {
    _controller.animateBack(0, curve: Curves.easeIn);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    const height = 30.0;

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        var value = _controller.value;
        return Stack(
          children: [
            const SizedBox(
              height: height * 2,
            ),
            Positioned.fill(
              child: Align(
                alignment: const Alignment(0, 0.02),
                child: Container(
                  width: (height / 2) * (0.7 + (0.4 * value)),
                  height: (height / 5) * (0.7 + (0.4 * value)),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6 - (0.35 * value)),
                    borderRadius: const BorderRadius.all(Radius.elliptical(5000, 2000)),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, value * -10),
              child: Image.asset(
                AppStrings.mapMarkerDefault,
                height: height,
              ),
            ),
          ],
        );
      },
    );
  }
}

