import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uyt/controller/login_controller.dart';


// مثال على استخدام الدالة في واجهة المستخدم
class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
LoginControllerImp controller=LoginControllerImp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final username = _usernameController.text;
                final password = _passwordController.text;
                // controller.sendLoginRequest(username, password);
                // controller.goToHomeScreen();
                //sendLoginRequest(username, password);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}





















// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:uyt/controller/login_controller.dart';
// import 'package:uyt/core/constant/color.dart';
// import 'package:uyt/model/apidata_model.dart';
// import 'package:uyt/uilies/validation.dart';
// import 'package:uyt/view/widget/auth/custombuttonauth.dart';
// import 'package:uyt/view/widget/auth/logoauth.dart';

// import '../widget/auth/customtextformfieldauthauth.dart';
// class Newlogin extends StatefulWidget {
//   const Newlogin({super.key});

//   @override
//   State<Newlogin> createState() => _NewloginState();
// }
// Future<Api> submitData(String id, int userId) async {
//   var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

//   try {
//     var response = await http.post(
//       url,
//       headers: {"Content-Type": "application/json"},
//       body: json.encode({"id": id, "userId": userId}),
//     );

//     if (response.statusCode == 201) {
//       String responseString = response.body;
//       return apiFromJson(responseString); // إرجاع كائن Api عند النجاح
//     } else {
//       print("Received an invalid response: ${response.statusCode}");
//       // إرجاع كائن Api افتراضي أو throw Exception حسب الحاجة
//       throw Exception("Failed to submit data: ${response.statusCode}"); 
//     }
//   } catch (e) {
//     print("Error: ${e.toString()}");
//     throw Exception("An error occurred"); // يرمي استثناء للتعامل مع الأخطاء
//   }
// }
// // Future<Api> submitData(int id,int userId) async{
// //     var url =Uri.parse("https://jsonplaceholder.typicode.com/posts");
// //    // var data={"id":id,"userId":userId};
// //     try{
// //       var response=await http.post((url),
// //       body: {"id":id,"userId":userId});
// //        var data=response.body;
// //       print(data);
// //       if(response.statusCode == 201){
// //         String responseString=response.body;
// //         apiFromJson(responseString);
// //         print("valid");
// //       }
// //     else{
// //       print("notttttttt");
// //     }
    
// //     }
// //     catch(e){}
    

    
// //   }

// class _NewloginState extends State<Newlogin> {
//   TextEditingController id=TextEditingController();
//   TextEditingController userId=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     Api api;
//     TextEditingController usernamecontroller = TextEditingController();
//     TextEditingController passwordcontroller = TextEditingController();
//     LoginControllerImp controller = Get.put(LoginControllerImp());
//     return Scaffold(
//       body: Form(
//         key: controller.formstate,
//         child: Container(
//           padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 35),
//           child: Column(
//             children: [
//               const SizedBox(height: 130,),
//               const Logoauth(),
//               Customtextformfield(
//                 mycontroller: usernamecontroller,
//                 valid:(val) {
//                   return validInput(val!, 5, 100, "username");
//               },
//               hinttext: "2".tr,
//               //onChanged: (value)=>controller.username, 
//               ),
//               Customtextformfield(
//                 mycontroller: controller.password, 
//                 valid: (val){
//                   return validInput(val!, 5, 30, "password");
//               },hinttext: "3".tr,
//              // onChanged: (value)=>controller.password,
//                ),
//               const SizedBox(height: 100,),
//               Custombuttonauth(
//                 text: "4".tr,
                
//                 onPressed: ()async{
//                   String username=usernamecontroller.text;
//                   String userId=passwordcontroller.text;
//                   Api data = await submitData(username,userId);
//                   setState(() {
//                     api = data;
//                   });
//                 }, 
//                 width: 200, 
//                 height: 50, 
//                 color: ColorApp.primarycolor, 
//                 textColor: ColorApp.backgroundcolor,
//                  ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
 