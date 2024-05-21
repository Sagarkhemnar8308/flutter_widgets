import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class DecrementIntent extends Intent {
  const DecrementIntent();
}

class ShortCutWidget extends StatefulWidget {
  const ShortCutWidget({super.key});

  @override
  State<ShortCutWidget> createState() => _ShortCutWidgetState();
}

class _ShortCutWidgetState extends State<ShortCutWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shortcuts(
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.arrowUp): const IncrementIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowDown): const IncrementIntent(),
        },
        child: Actions(
          actions: {
            IncrementIntent: CallbackAction(
              onInvoke: (intent) {
                setState(() {
                  count = count + 1;
                });
                return null;
              },
            ),
            DecrementIntent: CallbackAction(
              onInvoke: (intent) {
                setState(() {
                  count = count - 1;
                });
                return null;
              },
            )
          },
          child: Focus(
            child: Center(
              child: Text(
                count.toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
