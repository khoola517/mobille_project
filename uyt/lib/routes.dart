import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/core/constant/route.dart';
import 'package:uyt/view/screen/allvaccinations.dart';
import 'package:uyt/view/screen/homepage.dart';
import 'package:uyt/view/screen/homescreen.dart';
import 'package:uyt/view/screen/login.dart';
import'package:http/http.dart';
import 'package:uyt/view/screen/onboarding.dart';
import 'package:uyt/view/screen/completed_vaccniation.dart';
import 'package:uyt/view/screen/profile.dart';
import 'package:uyt/view/screen/splashscreen.dart';
import 'package:uyt/view/screen/upcoming_vaccinations.dart';
Map<String, Widget Function(BuildContext)> routes ={
  AppRoute.login:(context) => const Login(),
  AppRoute.onboarding:(context) =>  OnBoarding(),
  AppRoute.splashscreen:(context) =>  SplashScreen(),
};