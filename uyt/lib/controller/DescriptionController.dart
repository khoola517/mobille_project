




//import 'package:finallproject/core/models/DetailesVaccineModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/DetailesVaccine.dart';

class VaccineController extends GetxController {
  Future<List<DetailesVaccine>> fetchVaccines() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.43.207:8000/api/StageVaccineDose'),
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(response.statusCode);
        print('JSON Response: $jsonResponse');
        print(response.body);
        
        if (jsonResponse is List) {
          return jsonResponse
              .map((json) => DetailesVaccine.fromJson(json))
              .toList();   
        } else {
          throw Exception('Expected a list in the response body');
        }
      } else {
        throw Exception('Failed to load vaccines: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching vaccines: $e');
      rethrow;
    }
  }
}





// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:uyt/model/DetailesVaccine.dart';
// class VaccineController extends GetxController {
//   Future<List<DetailesVaccine>> fetchVaccines() async {
//     try {
//       final response = await http.get(
//         Uri.parse('http://192.168.43.207:8000/api/StageVaccineDose'),
//       );

//       if (response.statusCode == 200) {
//         var jsonResponse = json.decode(response.body);
//         print(response.statusCode);
//         print('JSON Response: $jsonResponse');
//         print(response.body);
//         // تأكد إنه List
//         if (jsonResponse is List) {
//           return jsonResponse
//               .map((json) => DetailesVaccine.fromJson(json))
//               .toList();   
//         } else {
//           throw Exception('Expected a list in the response body');
//         }
//       } else {
//         throw Exception('Failed to load vaccines: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching vaccines: $e');
//       rethrow;
//     }
//   }
// }



// class VaccineController extends GetxController {
//   Future<List<DetailesVaccine>> fetchVaccines() async {
//     try {
//       final response = await http.get(
//         Uri.parse('http://172.16.0.160:8000/api/StageVaccineDose'),
//       );

//       if (response.statusCode == 200) {
//         var jsonResponse = json.decode(response.body);
//         print(response.statusCode);
//         print('JSON Response: $jsonResponse');
//         print(response.body);

//         // تأكد إنه List
//         if (jsonResponse is List) {
//           return jsonResponse
//               .map((json) => DetailesVaccine.fromJson(json))
//               .toList();
              
//         } else {
//           throw Exception('Expected a list in the response body');
//         }
//       } else {
//         print(response.statusCode);
//         throw Exception('Failed to load vaccines: ${response.statusCode}');
        
//       }
//     } catch (e) {
      
//       print('Error fetching vaccines: $e');
//       rethrow;
//     }
//   }
// }


// class VaccineController extends GetxController {
//   Future<List<DetailesVaccine>> fetchVaccines() async {
//     try {
//       final response = await http.get(Uri.parse('http://172.16.0.190:8000/api/StageVaccineDose'));
//       if (response.statusCode == 200) {
//         var jsonResponse = json.decode(response.body);
        
//         // طباعة استجابة JSON للتحقق من البيانات
//         print(jsonResponse); 
//         print(response.statusCode);
//         print("sussess");// تحقق من البيانات هنا

//         if (jsonResponse['data'] is List) { // تأكد من أن 'data' هو قائمة
//           List<dynamic> data = jsonResponse['data'];
//           return data.map((json) => DetailesVaccine.fromJson(json)).toList();
//           print(data);
//         } else {
//           throw Exception('Expected data to be a list');
//         }
//       } else {
//         throw Exception('Failed to load vaccines: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching vaccines: $e');
//       //print(response.statusCode);
//       rethrow; // إعادة رمي الخطأ
//     }
//   }
// }


// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:uyt/model/DetailesVaccine.dart';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class VaccineController extends GetxController {
//   Future<List<DetailesVaccine>> fetchVaccines() async {
//     try {
//       final response = await http.get(Uri.parse('http://172.16.0.190:8000/api/StageVaccineDose'));
//       if (response.statusCode == 200) {
//         var jsonResponse = json.decode(response.body);
//         List<dynamic> data = jsonResponse['data']; // تأكد من أن هذا يتناسب مع هيكل JSON الخاص بك
//         return data.map((json) => DetailesVaccine.fromJson(json)).toList();
//         print(jsonResponse);
//       } else {
//         throw Exception('Failed to load vaccines: ${response.statusCode}');
//       }
//     } catch (e) {
//       // يمكنك طباعة الخطأ أو التعامل معه كما تريد
//       print('Error fetching vaccines: $e');
//       // يمكنك إعادة رمي الخطأ أو إرجاع قائمة فارغة
//       rethrow; // إذا كنت تريد إعادة رمي الخطأ
//       // return []; // إذا كنت تريد إرجاع قائمة فارغة بدلاً من ذلك
//     }
//   }
// }