import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/homescreen_controller.dart';
import 'package:uyt/view/new2.dart';
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

import '../view/screen/new1.dart';


// class HomePageController extends GetxController {
//   final int userId;

//   HomePageController({required this.userId}) {
//     screens = [
//       Homescreen(),
//       IndexPage(token: ''),

//        //ProfileScreen(userId: userId),
       
//     ];
//   }

//   List<String> titles = [
//     "9".tr,
//     "24".tr,
//     "7".tr,
//   ];

//   late List<Widget> screens;

//   int currentindex = 0;
// }


 class HomePageController extends GetxController{
  List<String> titles =[
    "9".tr,
    "24".tr,
    "7".tr,
  ];
  
  List<Widget> screen = [
    //Homescree(),
    IndexPage(),
    //Homescreen(),
    VaccineListView(),
    
    Profile(),
    // ProfileScreen(userId: userId),  
  ];
 int currentindex = 0; 
}
class HomescreenControllerImp extends HomescreenController{
  @override
  goToAllvaccinations() {
    // TODO: implement goToAllvaccinations
    throw UnimplementedError();
  }
  
 }