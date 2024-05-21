import 'package:flutter/material.dart';

class ClipPathWidget extends StatefulWidget {
  const ClipPathWidget({super.key});

  @override
  State<ClipPathWidget> createState() => _ClipPathWidgetState();
}

class _ClipPathWidgetState extends State<ClipPathWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff821976),
      body: ClipPath(
        clipper: MyClipper(),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          color: const Color(0xffC0256E),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 20,
        size.height - 10,
        size.width / 2,
        size.height - 20,
      )
      ..quadraticBezierTo(
        3 / 4 * size.width,
        size.height,
        size.width,
        size.height - 10,
      )
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
