import 'package:flutter/material.dart';

class VisibilityWidget extends StatefulWidget {
  const VisibilityWidget({super.key});

  @override
  State<VisibilityWidget> createState() => _VisibilityWidgetState();
}

class _VisibilityWidgetState extends State<VisibilityWidget> {
  bool visible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Visibility(
              visible:visible ,
              child: const Text("data"),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  visible=!visible;
                });
              },
              child: Text("data"))
          ],
        ),
      ),
    );
  }
}
