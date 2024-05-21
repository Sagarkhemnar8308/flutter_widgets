import 'package:flutter/material.dart';
import 'package:flutter_widget/clippath.dart';
import 'package:flutter_widget/getx/repo.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = true.obs;
  TextEditingController numberController = TextEditingController();
  TextEditingController passController = TextEditingController();

  loginfun() async {
    try {
      isLoading(true);
      var result = await RemoteServices.postUser(
        number: numberController.text.toString(),
        pass: passController.text.toString(),
      );
      if (result != null && result.status == true) {
        Get.to(const ClipPathWidget());
        print('Login Response: $result');
      } else {
        print('Login failed');
      }
    } finally {
      isLoading(false);
    }
  }
}
