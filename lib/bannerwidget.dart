import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Banner(
          textDirection: TextDirection.ltr,
          color: Colors.white,
          message: "10 %off",
          textStyle: TextStyle(
            color: Colors.black
          ),
          location: BannerLocation.topStart,
          child: Container(
            alignment: Alignment.center,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Column(
              children: [
                Text("data"),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
