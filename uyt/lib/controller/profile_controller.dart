import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uyt/core/constant/route.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uyt/model/ProfileModel.dart';
//import '../models/profile_model.dart';

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
//import 'package:uyt/model/profile_model.dart';

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
class ProfileController extends GetxController with StateMixin<ProfileModel> {
  final int userId;

  ProfileController({required this.userId}) {
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    final url = Uri.parse('http://172.16.2.23:8000/api/parent/edit/$userId');
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

// class ProfileController extends GetxController with StateMixin<ProfileModel> {
//   final int userId;

//   ProfileController({required this.userId});

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserData();
//   }

//   void fetchUserData() async {
//     change(null, status: RxStatus.loading()); // إظهار تحميل البيانات
    
//     try {
//       // استدعاء الدالة من API لجلب بيانات المستخدم
//       final response = await ApiService.getUserProfile(userId);
//       if (response != null) {
//         change(response, status: RxStatus.success());
//       } else {
//         change(null, status: RxStatus.error("لم يتم العثور على البيانات"));
//       }
//     } catch (e) {
//       change(null, status: RxStatus.error("خطأ في الاتصال بالخادم"));
//     }
//   }
// }

// class ApiService {
//   static const String baseUrl = "http://192.168.43.207:8000/api/parent/edit";  // استبدل هذا بـ API الخاص بك

//   // دالة جلب البيانات الخاصة بالمستخدم
//   static Future<ProfileModel?> getUserProfile(int userId) async {
//     final url = Uri.parse('$baseUrl/$userId'); // صيغة الـ URL حسب الـ API الخاص بك
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       // تحويل الاستجابة إلى نموذج ProfileModel
//       print(response.statusCode);
//       print(response.body);
//       return ProfileModel.fromJson(json.decode(response.body));
//     } else {
//       // إذا حدث خطأ في جلب البيانات
//       return null;
//     }
//   }
// }






// abstract class  ProfileController extends GetxController{
//  goToEditeprofile();
// }
// class ProfileControllerImp extends ProfileController{
  
//   @override
//   goToEditeprofile() {
//     Get.toNamed(AppRoute.editprofile);
//   } 
// }