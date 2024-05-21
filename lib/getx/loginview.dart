import 'package:flutter/material.dart';
import 'package:flutter_widget/getx/login.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final LoginController logincontroller= Get.put(LoginController());

  final mobilecontroller= TextEditingController();
    final password= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller:logincontroller.numberController ,
          ),
          TextFormField(
            controller:logincontroller.passController ,
          ),

          ElevatedButton(onPressed: (){
           logincontroller.loginfun();
          }, child: Text('Login'),)
        ],
      ),
    );
  }
}