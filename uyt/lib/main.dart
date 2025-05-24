import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/login_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/locale/locale.dart';
import 'package:uyt/routes.dart';

import 'package:uyt/test/View/login_screen.dart';
import 'package:uyt/view/login_screen.dart';
import 'package:uyt/view/screen/allvaccinations.dart';
import 'package:uyt/view/screen/apiveiw.dart';
import 'package:uyt/view/screen/completed_vaccniation.dart';
import 'package:uyt/view/screen/editprofile.dart';
import 'package:uyt/view/screen/homepage.dart';
import 'package:uyt/view/screen/homescreen.dart';
import 'package:uyt/view/screen/login.dart';
import 'package:uyt/view/screen/new1.dart';
import 'package:uyt/view/screen/newlogin.dart';
import 'package:uyt/view/screen/onboarding.dart';
import 'package:uyt/view/screen/profile.dart';
import 'package:uyt/view/screen/splashscreen.dart';
import 'package:uyt/view/screen/successscreen.dart';
import 'package:uyt/view/screen/upcoming_vaccinations.dart';
import 'package:uyt/view/test.dart';
import 'package:uyt/view/vaccniation_detailes.dart';

void main() {
  // تسجيل AuthController
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
      home:HomePage(),
      locale:const Locale('ar'),
      translations: Mylocale(),
      
    );
  }
}


class HighEndNavbar extends StatefulWidget {
  const HighEndNavbar({super.key});

  @override
  _HighEndNavbarState createState() => _HighEndNavbarState();
}

class _HighEndNavbarState extends State<HighEndNavbar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // خلفية شفافة
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25), // زوايا مستديرة
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // تأثير ظل خفيف
            blurRadius: 10, // التمويه
            offset: const Offset(0, -5), // موقع الظل
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent, // خلفية شفافة
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _navigateToPage(index);
          });
        },
        selectedItemColor:
            const Color.fromARGB(255, 100, 58, 66), // لون العنصر المحدد
        unselectedItemColor: Colors.grey, // لون العناصر غير المحددة
        showSelectedLabels: true, // عرض العناوين للعناصر المحددة
        showUnselectedLabels: false, // إخفاء عناوين العناصر غير المحددة
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, size: 28), // أيقونة مميزة عند التحديد
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart, size: 28),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person, size: 28),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/IndexPage');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/Homescreen');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/Profile');
        break;
    }
  }
}
