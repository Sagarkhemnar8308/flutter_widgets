import 'package:flutter/material.dart';

class VerticalDividerWidget extends StatefulWidget {
  const VerticalDividerWidget({super.key});

  @override
  State<VerticalDividerWidget> createState() => _VerticalDividerWidgetState();
}

class _VerticalDividerWidgetState extends State<VerticalDividerWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: VerticalDivider(
          width: 2,
          indent: 3,
          endIndent: 3,
          thickness: 2,
          color: Colors.black,
        ),
      ),
    );
  }
}
