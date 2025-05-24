
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/reset_password.dart';
import 'reset_password.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'reset_password.dart';

class PasswordController {
  Future<bool> changePassword({
    required int userId,
    required ResetPassword resetPassword,
  }) async {
    final url = Uri.parse('http://172.16.2.23:8000/api/parent/changePassword/$userId');

    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(resetPassword.toJson()),
    );

    if (response.statusCode == 200) {
      print('✅ Password changed');
      print(response.statusCode);
      return true;
    } else {
      print('❌ Failed: ${response.statusCode} - ${response.body}');
      return false;
    }
  }
}


// class PasswordController {
//   Future<bool> changePassword({
//     //required String token,
//     required int userId,
//     required ResetPassword resetPassword,
//   }) async {
//     final url = Uri.parse('http://192.168.43.207:8000/api/parent/changePassword/$userId');

//     final response = await http.patch(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         //'Authorization': 'Bearer $token',
//       },
//       body: jsonEncode(resetPassword.toJson()),
//     );

//     if (response.statusCode == 200) {
//       print('Password changed successfully!');
//       return true;
//     } else {
//       print('Failed to change password: ${response.statusCode} - ${response.body}');
//       return false;
//     }
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../model/reset_password.dart';
// //import '../models/reset_password_model.dart';

// class ResetPasswordController extends GetxController {
//   final oldPasswordController = TextEditingController();
//   final newPasswordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   var isLoading = false.obs;

//   Future<void> resetPassword(int userId) async {
//     isLoading.value = true;

//     final model = ResetPasswordModel(
//       oldPassword: oldPasswordController.text,
//       password: newPasswordController.text,
//       passwordConfirmation: confirmPasswordController.text,
//     );

//     final url = Uri.parse('http://192.168.43.207:8000/api/parent/changePassword/$userId');

//     try {
//       final response = await http.patch(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode(model.toJson()),
//       );

//       isLoading.value = false;

//       if (response.statusCode == 200) {
//         Get.snackbar("نجاح", "تم تغيير كلمة المرور بنجاح",
//             snackPosition: SnackPosition.BOTTOM);
//         Get.back();
//       } else {
//         Get.snackbar("خطأ", "فشل في التحديث: ${response.statusCode}",
//             snackPosition: SnackPosition.BOTTOM);
//       }
//     } catch (e) {
//       isLoading.value = false;
//       Get.snackbar("خطأ", "حدث خطأ أثناء الاتصال بالسيرفر",
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }

//   @override
//   void onClose() {
//     oldPasswordController.dispose();
//     newPasswordController.dispose();
//     confirmPasswordController.dispose();
//     super.onClose();
//   }
// }
