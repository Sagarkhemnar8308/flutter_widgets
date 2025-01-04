import 'dart:async';
import 'package:flutter/material.dart';

class FlickCardAnimation extends StatefulWidget {
  @override
  _FlickCardAnimationState createState() => _FlickCardAnimationState();
}

class _FlickCardAnimationState extends State<FlickCardAnimation> {
  int currentIndex = 0;

  List<Map<String, String>> cardData = [
    {"name": "Person 1", "prize": "₹12,000", "time": "Yesterday"},
    {"name": "Person 2", "prize": "₹34,000", "time": "Yesterday"},
    {"name": "Person 3", "prize": "₹25,000", "time": "Today"},
  ];

  @override
  void initState() {
    super.initState();
    _startAutoFlick();
  }

  void _startAutoFlick() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % cardData.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade900,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 300,
          child: Stack(
            children: [
              for (int i = 0; i < cardData.length; i++)
                if (i == currentIndex)
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    transitionBuilder: (child, animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 1), // Starts from below
                          end: Offset.zero, // Ends at its position
                        ).animate(animation),
                        child: child,
                      );
                    },
                    child: _buildCard(cardData[i], key: ValueKey(i)),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(Map<String, String> data, {required Key key}) {
    return Container(
      key: key,
      height: 180,
      width: 300,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade300,
            child: Icon(Icons.person, size: 30, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 10),
          Text(
            data['name']!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "🎉 Wins 🎉 ${data['prize']}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            data['time']!,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
