import 'dart:convert';
import 'dart:developer';
import 'package:flutter_widget/getx/loginmodel.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  // static Future<List<Result>?> fetchProducts() async {
  //   var response = await client.get(Uri.parse(
  //       'https://adminapp.tech/zepto/api/homeData?userid=67'));
  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //      final homeData = HomeData.fromJson(json.decode(jsonString));
  //     return homeData.result;
  //   } else {
  //     //show error message
  //     return null;
  //   }
  // }

   static Future<LoginModel?> postUser({String? number, String? pass}) async {
    var response = await client.post(Uri.parse(
        'https://adminapp.tech/zepto/vapi/login?phone=$number&password=$pass'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
       log(jsonString);
      return LoginModel.fromJson(json.decode(jsonString));
    } else {
      // Show error message
      return null;
    }
  }
}