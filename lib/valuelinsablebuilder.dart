import 'package:flutter/material.dart';

class ValueListneableBuilderWidget extends StatefulWidget {
  const ValueListneableBuilderWidget({super.key});

  @override
  State<ValueListneableBuilderWidget> createState() =>
      _ValueListneableBuilderWidgetState();
}

class _ValueListneableBuilderWidgetState
    extends State<ValueListneableBuilderWidget> {
  final obscurePass = ValueNotifier<bool>(false);
  final passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: obscurePass,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: value,
                controller: passcontroller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () => obscurePass.value = !obscurePass.value,
                      icon: value
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
