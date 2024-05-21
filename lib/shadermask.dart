import 'package:flutter/material.dart';

class ShaderMaskWidget extends StatefulWidget {
  const ShaderMaskWidget({super.key});

  @override
  State<ShaderMaskWidget> createState() => _ShaderMaskWidgetState();
}

class _ShaderMaskWidgetState extends State<ShaderMaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const RadialGradient(
              colors: [Colors.red, Colors.orange, Colors.yellow],
              center: Alignment.topRight,
              radius: 0.5,
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          child: const Text(
            "Hello world ....",
            style: TextStyle(),
          ),
        ),
      ),
    );
  }
}
