
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/homepage_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/core/constant/route.dart';
import 'package:uyt/view/screen/ProfileScreen.dart';




class HomePage extends StatelessWidget {
  //final int userId; // تمرير userId عبر الكونستركتور

  const HomePage({super.key,
   //required this.userId
   });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return GetBuilder<HomePageController>(
      builder: (controller) => Scaffold(
        // appBar: AppBar(
        //   // title: Center(
        //   //   child: Text(controller.titles[controller.currentindex]),
        //   // ),
        //   // leading: IconButton(
        //   //   icon: Icon(Icons.menu),
        //   //   onPressed: () {
        //   //     ScaffoldMessenger.of(context).showSnackBar(
        //   //       SnackBar(content: Text("Menu button pressed")),
        //   //     );
        //   //   },
        //   // ),
        //   actions: [
        //     // if (controller.currentindex == 0)
        //     //   IconButton(
        //     //     icon: Icon(Icons.person),
        //     //     onPressed: () {
        //     //       ScaffoldMessenger.of(context).showSnackBar(
        //     //         SnackBar(content: Text("Add button pressed")),
        //     //       );
        //     //     },
        //     //   ),
        //     if (controller.currentindex == 2)
        //       IconButton(
        //         icon: Icon(Icons.logout),
        //         onPressed: () {
        //           ScaffoldMessenger.of(context).showSnackBar(
        //             SnackBar(content: Text("Logout button pressed")),
        //           );
        //         },
        //       ),
        //   ],
        // ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorApp.primarycolor,
          currentIndex: controller.currentindex,
          onTap: (value) {
            controller.currentindex = value;
            controller.update(); // تحديث GetBuilder
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "9".tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.vaccines),
              // icon: IconButton(
              //   onPressed: () {},
              //   icon: Image.asset(
              //     "images/injection.png",
              //     height: 30,
              //     width: 30,
              //   ),
              // ),
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
        // body: controller.currentindex == 2
        //     ? ProfileScreen(userId: userId)
        //     : controller.screens[controller.currentindex],
      ),
    );
  }
}


// class HomePage extends StatelessWidget {
//   final int userId; // تمرير userId عبر الكونستركتور

//   const HomePage({super.key, required this.userId});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(HomePageController(userId: userId));

//     return GetBuilder<HomePageController>(builder: (controller) => Scaffold(
//        appBar: AppBar(
//               title: Center(child: Text(controller.titles[controller.currentindex])),
//               leading: IconButton(
//                 icon: Icon(Icons.menu),
//                 onPressed: () {
//                   // عمل أي شيء عند الضغط على القائمة
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Menu button pressed")));
//                 },
//               ),
//               actions: [
//                 if (controller.currentindex == 0) ...[
//                   IconButton(
//                     icon: Icon(Icons.person),
//                     onPressed: () {
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add button pressed")));
//                     },
//                   ),
//                 ],
//                 if (controller.currentindex == 1) ...[
//                   // IconButton(
//                   //   icon: Icon(Icons.arrow_back_ios),
//                   //   onPressed: () {
//                   //     Navigator.pop(context);
//                   //   },
//                   // ),
//                 ],
//                 if (controller.currentindex == 2) ...[
//                   IconButton(
//                     icon: Icon(Icons.logout),
//                     onPressed: () {
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logout button pressed")));
//                     },
//                   ),
//                 ],
//               ],
//             ),
//       bottomNavigationBar: BottomNavigationBar(
//   backgroundColor: ColorApp.primarycolor,
//   currentIndex: controller.currentindex,
//   onTap: (value) {
//     controller.currentindex = value;
//     controller.update(); // تحديث GetBuilder
//   },
//   items: [
//     BottomNavigationBarItem(
//       icon: Icon(Icons.home_outlined),
//       label: "9".tr,
//     ),
//     BottomNavigationBarItem(
//       icon: IconButton(
//         onPressed: () {},
//         icon: Image.asset("images/injection.png", height: 30, width: 30),
//       ),
//       label: "38".tr,
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(Icons.person),
//       label: "7".tr,
//     ),
//   ],
//   type: BottomNavigationBarType.fixed,
//   selectedItemColor: Colors.red,
//   unselectedItemColor: Colors.white,
//   showSelectedLabels: true,
//   showUnselectedLabels: true,
// ),
//       body: controller.currentindex == 2
//         ? ProfileScreen(userId: userId) // تمرير userId هنا
//         : controller.screens[controller.currentindex],
//     ));
//   }
// }





// import 'dart:ui';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:uyt/controller/homepage_controller.dart';
// import 'package:uyt/core/constant/color.dart';
// import 'package:uyt/core/constant/imageassset.dart';
// import 'package:uyt/view/screen/ProfileScreen.dart';

// class HomePage extends StatelessWidget {
//    HomePage({super.key, required this.userId});
//    final int userId; 
//    final HomePageController controller = Get.put(HomePageController(userId: userId));
//    //HomePageController controller =Get.put(HomePageController());
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomePageController>(builder: (controller)=>Scaffold(
//       appBar: AppBar(
//         title:Center(child: Text(controller.titles[controller.currentindex].tr)),
//         leading: IconButton(
//           icon: Icon(Icons.menu), // أيقونة يسارية
//           onPressed: () {
//             // وظيفة الأيقونة اليسارية
//             Get.snackbar('Menu', 'Menu button pressed');
//           },
//         ),
//         actions: [
//           if (controller.currentindex == 0) ...[
           
//             IconButton(
//               icon: Icon(Icons.person), // أيقونة الصفحة الأولى
//               onPressed: () {
                
//                 Get.snackbar('Add', 'Add button pressed');
//               },
//             ),
//           ],
//           if (controller.currentindex == 1) ...[
           
//             IconButton(
//               icon: Icon(Icons.arrow_back_ios), // أيقونة الصفحة الثانية
//               onPressed: () {
//                 Get.back();
//               },
//             ),
//           ],
//           if (controller.currentindex == 2) ...[
//             IconButton(
//               icon: Icon(Icons.logout), // أيقونة الصفحة الثالثة
//               onPressed: () {
//                 Get.snackbar('Logout', 'Logout button pressed');
//               },
//             ),
//           ],
//         ]
//         //leading:Padding(
//       //   padding:const EdgeInsets.all(10),
//       //   child:Container(
//       //     alignment: Alignment.center,
          
//       //     width: 20,
//       //     height: 20,
//       //     decoration: BoxDecoration(
//       //       border: Border.all(color:  ColorApp.primarycolor,width: 3),
//       //       shape: BoxShape.circle),
//       //       child: IconButton(onPressed: (){}, icon:Center(child: Icon(Icons.person,size: 20,))),) ,),
//        ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor:  ColorApp.primarycolor,
//         currentIndex: controller.currentindex,
//         onTap: (value) {
//           controller.currentindex = value;
//           controller.update();
//         },
//         items:[
//         BottomNavigationBarItem(
//           icon:const Icon( Icons.home_outlined,size: 20),
//           label: "9".tr,),

//         BottomNavigationBarItem(
//           icon: IconButton(
//             onPressed: (){}, icon:Image.asset("images/injection.png", 
//             height: 30, // حجم الصورة
//             width: 30,
//         )),
//         label: "8".tr),
//         BottomNavigationBarItem(
//           icon: IconButton(onPressed: (){}, icon: const Icon(Icons.person,size: 20)),
//           //icon:const Icon(Icons.person,size: 20),
//           label:"7".tr),  
//       ],
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Colors.red, // لون الأيقونة النشطة
//       unselectedItemColor: Colors.white, // لون الأيقونات غير النشطة
//       showSelectedLabels: true, // عرض التسميات للأيقونات النشطة
//       showUnselectedLabels: true, // عرض التسميات للأيقونات غير النشطة
//       ),
//       body: controller.currentindex == 2
//   ? ProfileScreen(userId: userId)
//   : controller.screens[controller.currentindex],

//       //body:controller.screen[controller.currentindex],
//     ));  
//   }
// }