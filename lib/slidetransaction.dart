import 'package:flutter/material.dart';

class SlidetranWidget extends StatefulWidget {
  const SlidetranWidget({super.key});

  @override
  State<SlidetranWidget> createState() => _SlidetranWidgetState();
}

class _SlidetranWidgetState extends State<SlidetranWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 3),
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation =
      Tween<Offset>(begin: Offset.zero, end: Offset(0, 1.5)).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticIn,
    ),
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FlutterLogo(
        size: 200,
      ),
    );
  }
}
