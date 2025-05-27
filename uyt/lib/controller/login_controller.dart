import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uyt/view/screen/homepage.dart';

class AuthController extends GetxController {
  static const String endpoinr = "/api/login";
  static const String baseUrl = "http://192.168.1.100:8000/api/login";
  var isLoading = false.obs;
  Future<void> login(String username, String password) async {
    isLoading(true);
    try {
      isLoading(true);

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      print('Request body: ${jsonEncode({
            'username': username,
            'password': password
          })}');

      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        //Get.offAllNamed(AppRoute.homepage);

        if (token != null) {
          print('Token: $token');
          print('Success: $data');

          print('true : ${response.statusCode}');
          Get.off(HomePage(), arguments: token);
        } else {
          Get.snackbar('خطأ', 'فشل تسجيل الدخول: لا يوجد توكن TOKEN $token');
        }
      } else {
        print('Error: ${response.statusCode}');
        Get.snackbar('خطأ', 'فشل تسجيل الدخول: بيانات غير صحيحة');
      }
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ أثناء kkkkkkkkkkkkkkk! ${e}');
      print(e);

      //print('Error type: ${e.runtimeType}');
      //print(e);
    } finally {
      isLoading(false);
    }
  }
}

class LoginControllerImp extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController password;

  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  void login() {
    var fromdata = formstate.currentState;
    if (fromdata!.validate()) {
      final authController = Get.find<AuthController>();
      authController.login(username.text, password.text);
    } else {
      print("not valid");
    }
  }
}
