import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/profile_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/profile_controller.dart';
import 'package:uyt/model/ProfileModel.dart';
import 'package:uyt/core/constant/color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/profile_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/profile_controller.dart';
import 'package:uyt/core/constant/color.dart';
// class ProfileScreen extends StatelessWidget {
//   final int userId;

//   const ProfileScreen({super.key, required this.userId});

//   @override
//   Widget build(BuildContext context) {
//     // استخدام الـ userId في الـ ProfileScreen
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: ColorApp.primarycolor,
//       ),
//       body: Center(
//         child: Text('User ID: $userId'),
//       ),
//     );
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   final int userId;  // استلام الـ userId في الكونستركتور

//   const ProfileScreen({super.key, required this.userId}); // استلام الـ userId هنا

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProfileController(userId: userId)); // تمرير الـ userId إلى الكونترولر

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: ColorApp.primarycolor,
//       ),
//       body: controller.obx(
//         (user) {
//           if (user == null) {
//             return Center(child: Text('لا توجد بيانات للمستخدم'));
//           }
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("الاسم: ${user.person?.firstName} ${user.person?.lastName}", style: TextStyle(fontSize: 20)),
//                 const SizedBox(height: 10),
//                 Text("البريد: ${user.person?.email}", style: TextStyle(fontSize: 18)),
//                 const SizedBox(height: 10),
//                 Text("رقم الجوال: ${user.person?.phoneNumber}", style: TextStyle(fontSize: 18)),
//                 // أضف المزيد حسب الحاجة
//               ],
//             ),
//           );
//         },
//         onLoading: const Center(child: CircularProgressIndicator()),  // أثناء التحميل
//         onError: (error) => Center(child: Text("حدث خطأ: $error")),  // في حال حدوث خطأ
//         onEmpty: const Center(child: Text("لا توجد بيانات")),  // في حال كانت البيانات فارغة
//       ),
//     );
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   final int userId;  // استلام الـ userId في الكونستركتور

//   const ProfileScreen({super.key, required this.userId}); // استلام الـ userId هنا

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProfileController(userId: userId)); // تمرير الـ userId إلى الكونترولر

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: ColorApp.primarycolor,
//       ),
//       body: controller.obx(
//         (user) {
//           if (user == null) {
//             return Center(child: Text('لا توجد بيانات للمستخدم'));
//           }
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("الاسم: ${user.person?.firstName} ${user.person?.lastName}", style: TextStyle(fontSize: 20)),
//                 const SizedBox(height: 10),
//                 Text("البريد: ${user.person?.email}", style: TextStyle(fontSize: 18)),
//                 const SizedBox(height: 10),
//                 Text("رقم الجوال: ${user.person?.phoneNumber}", style: TextStyle(fontSize: 18)),
//                 // أضف المزيد حسب الحاجة
//               ],
//             ),
//           );
//         },
//         onLoading: const Center(child: CircularProgressIndicator()),  // أثناء التحميل
//         onError: (error) => Center(child: Text("حدث خطأ: $error")),  // في حال حدوث خطأ
//         onEmpty: const Center(child: Text("لا توجد بيانات")),  // في حال كانت البيانات فارغة
//       ),
//     );
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   final int userId;

//   const ProfileScreen({super.key, required this.userId});

//   @override
//   Widget build(BuildContext context) {
//     // تمرير userId إلى الكنترولر
//     final controller = Get.put(ProfileController(userId: userId));

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('7'.tr), // "الملف الشخصي" مثلًا
//         backgroundColor: ColorApp.primarycolor,
//       ),
//       body: controller.obx(
//         (user) => Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("الاسم: ${user!.person?.firstName} ${user.person?.lastName}", style: TextStyle(fontSize: 20)),
//               const SizedBox(height: 10),
//               Text("البريد: ${user.person?.email}", style: TextStyle(fontSize: 18)),
//               const SizedBox(height: 10),
//               Text("رقم الجوال: ${user.person?.phoneNumber}", style: TextStyle(fontSize: 18)),
//               // أضف المزيد حسب الحاجة
//             ],
//           ),
//         ),
//         onLoading: const Center(child: CircularProgressIndicator()),
//         onError: (error) => Center(child: Text("حدث خطأ: $error")),
//         onEmpty: const Center(child: Text("لا توجد بيانات")),
//       ),
//     );
//   }
// }

