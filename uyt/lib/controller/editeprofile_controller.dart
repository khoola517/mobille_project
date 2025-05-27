import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileEditController extends GetxController {
  Future<void> updateProfile({
    required int userId,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) async {
    final url = Uri.parse('http://172.16.2.254:8000/api/parent/update/$userId');

    final body = jsonEncode({
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone_number": phoneNumber,
      "location_id": 1,
    });

    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        Get.snackbar("نجاح", "تم تحديث البيانات");
        print(response.statusCode);
        print(response.body);
      } else {
        print(response.statusCode);
        Get.snackbar("خطأ", "فشل التحديث: ${response.body}");
      }
    } catch (e) {
      Get.snackbar("استثناء", "حدث خطأ: $e");
    }
  }
}