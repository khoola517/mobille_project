import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uyt/model/stagewithvaccine_model.dart';

class DataService {
  final Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  Future<List<StagesWithVaccine>> getStages() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => StagesWithVaccine.fromJson(post)).toList();
    } else {
      throw Exception('فشل في تحميل البيانات');
    }
  }
}