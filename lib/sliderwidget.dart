import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double slidevalue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Slider(
          value: slidevalue,
          divisions: 100,
          max: 100,
          label: slidevalue.round().toString(),
          onChanged: (value) {
            setState(() {
              slidevalue=value;
            });
          },
        ),
      ),
    );
  }
}
