// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:uyt/test/Controller/auth_controller.dart';
// import 'package:uyt/uilies/validation.dart';
// //import 'auth_controller.dart';

// class loginscreen extends StatelessWidget {
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   //final AuthController _authController = Get.put(AuthController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('تسجيل الدخول')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _usernameController,
//               decoration: InputDecoration(labelText: 'اسم المستخدم'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'كلمة المرور'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             Obx(() => _authController.isLoading.value
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: () {
//                       final username = _usernameController.text;
//                       final password = _passwordController.text;

//                       // التحقق من صحة المدخلات
//                       final usernameValidation = validInput(username, 3, 20, 'username');
//                       final passwordValidation = validInput(password, 6, 20, 'password');

//                       if (usernameValidation != null) {
//                         Get.snackbar('خطأ', usernameValidation);
//                         return;
//                       }

//                       if (passwordValidation != null) {
//                         Get.snackbar('خطأ', passwordValidation);
//                         return;
//                       }

//                       _authController.login(username, password);
//                     },
//                     child: Text('تسجيل الدخول'),
//                   )),
//           ],
//         ),
//       ),
//     );
//   }
// }