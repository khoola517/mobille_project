// import 'package:flutter/material.dart';
// import 'package:uyt/controller/login_controller.dart';
// import 'package:uyt/model/login_model.dart';
// import 'package:uyt/services/services.dart';

// class LoginScree extends StatefulWidget {
//   const LoginScree({super.key});

//   @override
//   State<LoginScree> createState() => _LoginScreeState();
// }

// class _LoginScreeState extends State<LoginScree> {
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   LoginModel loginModel = LoginModel();
//   LoginControllerImp controller = LoginControllerImp();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Login"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: email,
//               decoration: InputDecoration(hintText: "Email"),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: password,
//               decoration: InputDecoration(hintText: "Password"),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 ApiServies().LoginRequest(email.text, password.text).then((value) {
//                   setState(() {
//                     loginModel = value!;
//                     if (loginModel.token != null ) {
//                       controller.goToHomeScreen();
//                     } else {
//                       // عرض رسالة خطأ
//                       print("Invalid login");
//                     }
//                   });
//                 }).catchError((error) {
//                   print("Error: $error");
//                 });
//               },
//               child: Text("Login"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }