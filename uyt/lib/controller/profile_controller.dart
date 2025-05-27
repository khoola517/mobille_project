import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uyt/core/constant/route.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uyt/model/ProfileModel.dart';

class ProfileController extends GetxController with StateMixin<ProfileModel> {
  final int userId;

  ProfileController({required this.userId}) {
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    final url = Uri.parse('http://192.168.1.100:8000/api/parent/edit/$userId');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final user = ProfileModel.fromJson(data);
        change(user, status: RxStatus.success());
        print(response.body);
        print(response.statusCode);
      } else {
        change(null, status: RxStatus.error("فشل في جلب البيانات"));
      }
    } catch (e) {
      change(null, status: RxStatus.error("خطأ: $e"));
    }
  }
}
