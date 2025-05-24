import 'package:flutter/material.dart';
import 'dart:async';

import 'package:uyt/controller/splashscreen_controller.dart';
import 'package:uyt/view/widget/auth/logoauth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenImp controller = SplashScreenImp();
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      controller.goToSplashscreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Logoauth(), // تأكد من إضافة الشعار في المجلد المناسب
      ),
    );
  }
}

