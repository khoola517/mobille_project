// import 'dart:convert';

// import 'package:uyt/model/login_model.dart';
// import 'package:http/http.dart' as http;

// class ApiServies{
//   Future<LoginModel?> LoginRequest(String email, String password) async {

//   // عنوان URL الخاص بـ backend
//   final url = Uri.parse("https://reqres.in/api/login");

//   // البيانات التي نريد إرسالها
  

//   try {
//     // إرسال طلب POST
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: {
//         "email": email,
//     "password": password}
//     );

//     // التحقق من حالة الاستجابة
//     if (response.statusCode == 200 ) {
//       // إذا كان الطلب ناجحًا
//      // final responseData = json.decode(response.body);
//      LoginModel model = LoginModel.fromJson(jsonDecode(response.body));
//      return model;
//       //print('Success: $responseData');
//     } else {
//       // إذا كان هناك خطأ
//       print('Error: ${response.statusCode}');
//       print('Response: ${response.body}');
//     }
//   } catch (e) {
//     // إذا حدث خطأ في الاتصال
//     print('Exception: $e');
//   }
// }

// }