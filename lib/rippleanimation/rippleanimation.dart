import 'package:flutter/material.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({super.key});

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<double> listRadius = [130.0, 170.0, 210.0, 240.0, 290.0];

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animation = Tween<double>(begin: 0.0, end: 10).animate(_animationController);

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward();
   _animationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: listRadius.map((radius) {
            final scale = _animation.value;
            final opacity = (1.0 - (scale - 1) / 9).clamp(0.0, 1.0);
            return Container(
              height: radius * scale,
              width: radius * scale,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.withOpacity(opacity),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
