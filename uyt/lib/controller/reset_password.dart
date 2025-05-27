
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
    final url = Uri.parse('http://172.16.2.254:8000/api/parent/changePassword/$userId');

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

