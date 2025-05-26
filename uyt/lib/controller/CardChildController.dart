import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uyt/model/CardChildModel.dart';
import 'dart:convert';



class CardChildController extends GetxController {
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var cardChildModel = Rxn<CardChildModel>();

  Future<void> fetchChildData(int childId) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final url = Uri.parse("http://192.168.43.207:8000/api/cardDetails/$childId"); 
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        cardChildModel.value = CardChildModel.fromJson(data);
      } else {
        errorMessage.value = "فشل التحميل: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage.value = "حدث خطأ: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
