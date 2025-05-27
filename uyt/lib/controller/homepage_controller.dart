import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/homescreen_controller.dart';
import 'package:uyt/view/detailesvaccination.dart';
import 'package:uyt/view/screen/profile.dart';
import 'package:uyt/view/screen/completed_vaccniation.dart';
import 'package:uyt/view/screen/homescreen.dart';

//import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/homescreen_controller.dart';
import 'package:uyt/view/screen/profile.dart';
import 'package:uyt/view/screen/completed_vaccniation.dart';
import 'package:uyt/view/screen/homescreen.dart';
import 'package:uyt/view/screen/setting.dart';
import '../view/screen/stagesvccination.dart';
 class HomePageController extends GetxController{
  List<String> titles =[
    "9".tr,
    "24".tr,
    "7".tr,
  ];
  
  List<Widget> screen = [
    IndexPage(),

    VaccineListView(),
    
    Setting(),
    
  ];
 int currentindex = 0; 
}
class HomescreenControllerImp extends HomescreenController{
  @override
  goToAllvaccinations() {
    
    throw UnimplementedError();
  }
  
 }