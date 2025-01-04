import 'package:flutter/material.dart';
import 'package:in_app_notification/in_app_notification.dart';

class InAppNotify extends StatefulWidget {
  const InAppNotify({super.key});

  @override
  State<InAppNotify> createState() => _InAppNotifyState();
}

class _InAppNotifyState extends State<InAppNotify> {
  List<Color> winCardGradient = [
    const Color.fromRGBO(252, 63, 25, 1),
    const Color.fromRGBO(252, 63, 25, 1),
    const Color(0xFFFF0051),
    const Color(0xFFFFAE00),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () async {
                await InAppNotification.show(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: winCardGradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kalyan Market Result",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Date: 12-12-2021",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Time: 12:00 PM",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "123 6X XXX",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  context: context,
                  duration: const Duration(seconds: 2),
                );
              },
              child: const Text('Click Me !'),
            )
          ],
        ),
      ),
    );
  }

  
}
