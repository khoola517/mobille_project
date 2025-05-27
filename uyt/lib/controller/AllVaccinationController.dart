import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uyt/model/AllVaccinationModel.dart';


class VaccinationDetailsController extends GetxController {
  
  Future<AllVaccinationModel> fetchVaccinationData(int childId) async {
    try {
      final response = await http.get(
        Uri.parse('http://172.16.2.254:8000/api/getAllChildDoses/$childId'),
        
      );

      if (response.statusCode == 200) {
        return AllVaccinationModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load children - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('خطأ: $e');
    }
  }
}


