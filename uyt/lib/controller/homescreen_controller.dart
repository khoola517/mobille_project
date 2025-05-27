
import 'dart:convert';
import 'package:get/get.dart';
import 'package:uyt/core/constant/route.dart';
import 'package:uyt/model/IndexModel.dart';
import 'package:uyt/view/screen/allvaccinations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class IndexPageController extends GetxController {
  Future<IndexModel> fetchData(String token) async {
    try {
      final response = await http.get(
        Uri.parse('http://172.16.2.254:8000/api/parent/index'), 
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        
        
        return IndexModel.fromJson(json.decode(response.body));

        print(response.statusCode);
      } else {
        throw Exception('Failed to load children - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }
}


abstract class HomescreenController extends GetxController{
 goToAllvaccinations();
}
class HomescreenControllerImp extends HomescreenController{
  @override
  goToAllvaccinations() {
     Get.toNamed(AppRoute.allvaccinations);
  }
}