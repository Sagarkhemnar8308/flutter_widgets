import 'package:flutter/material.dart';

class SizeTranWidget extends StatefulWidget {
  const SizeTranWidget({super.key});

  @override
  State<SizeTranWidget> createState() => _SizeTranWidgetState();
}

class _SizeTranWidgetState extends State<SizeTranWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInExpo,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizeTransition(sizeFactor: _animation,child: const FlutterLogo(size: 300,)),
      ),
    );
  }
}
