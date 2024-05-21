import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class RemoteConfigtest extends StatefulWidget {
  const RemoteConfigtest({super.key});

  @override
  State<RemoteConfigtest> createState() => _RemoteConfigtestState();
}

class _RemoteConfigtestState extends State<RemoteConfigtest> {
  var bannertext = "Hello World";

  @override
  void initState() {
    super.initState();
    final remoteConfig =FirebaseRemoteConfig.instance;
    remoteConfig.onConfigUpdated.listen((RemoteConfigUpdate event) async{
      await remoteConfig.activate();
      setState(() {
        bannertext=remoteConfig.getString("testing");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          bannertext,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
