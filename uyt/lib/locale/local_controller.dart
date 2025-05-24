import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class mylocalcontroller extends GetxController{
  void changlang(String codelang){
    Locale locale=Locale(codelang);
    Get.updateLocale(locale);
  }
}