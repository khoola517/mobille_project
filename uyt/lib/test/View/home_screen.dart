// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:uyt/test/Controller/auth_controller.dart';
// //import 'auth_controller.dart';
// import 'child_details_screen.dart';

// class HomeScreen extends StatelessWidget {
//   //final AuthController _authController = Get.find<AuthController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('الصفحة الرئيسية')),
//       body: Obx(() {
//         if (_authController.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else {
//           return ListView.builder(
//             itemCount: _authController.children.length,
//             itemBuilder: (context, index) {
//               final child = _authController.children[index];
//               return ListTile(
//                 title: Text(child.name),
//                 //subtitle: Text(child.),
//                 onTap: () {
//                   Get.to(() => ChildDetailsScreen(child: child));
//                 },
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }