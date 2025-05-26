
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/homepage_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/core/constant/route.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key,
   
   });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return GetBuilder<HomePageController>(
      builder: (controller) => Scaffold(
        
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorApp.primarycolor,
          currentIndex: controller.currentindex,
          onTap: (value) {
            controller.currentindex = value;
            controller.update(); 
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "9".tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.vaccines),
          
              label: "8".tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "الأعدادات".tr,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
body:controller.screen[controller.currentindex],
       
      ),
    );
  }
}


