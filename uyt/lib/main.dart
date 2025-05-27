import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/login_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/locale/locale.dart';
import 'package:uyt/routes.dart';
import 'package:uyt/view/screen/allvaccinations.dart';
import 'package:uyt/view/screen/completed_vaccniation.dart';
import 'package:uyt/view/screen/homepage.dart';
import 'package:uyt/view/screen/homescreen.dart';
import 'package:uyt/view/screen/login.dart';
import 'package:uyt/view/screen/stagesvccination.dart';

import 'package:uyt/view/screen/onboarding.dart';
import 'package:uyt/view/screen/profile.dart';
import 'package:uyt/view/screen/splashscreen.dart';
import 'package:uyt/view/screen/successscreen.dart';
import 'package:uyt/view/screen/upcoming_vaccinations.dart';


void main() {
  
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'chila vaciin system',
      theme: ThemeData(
        fontFamily: "Flu",
        textTheme: TextTheme(
          
        ),
        scaffoldBackgroundColor: ColorApp.backgroundcolor,
        appBarTheme: AppBarTheme(
          backgroundColor:ColorApp.backgroundcolor,
        ),
      ),
      home:Login(),
      locale:const Locale('ar'),
      translations: Mylocale(),
      
    );
  }
}


