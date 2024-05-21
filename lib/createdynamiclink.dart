import 'package:flutter/material.dart';
import 'package:flutter_widget/services/link_services.dart';

class CreateDynamicLink extends StatefulWidget {
  const CreateDynamicLink({super.key});

  @override
  State<CreateDynamicLink> createState() => _CreateDynamicLinkState();
}

class _CreateDynamicLinkState extends State<CreateDynamicLink> {

void createDynamicLink() async{
    DynamicLinkService.instance.createDynamicLink();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          createDynamicLink();
        },
        child: Center(
          child: Text("Generate Link"),
        ),
      ),
    );
  }
}