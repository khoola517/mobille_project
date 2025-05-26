import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/data/datasource/static.dart';
import 'package:uyt/core/constant/route.dart';
import 'package:uyt/view/screen/login.dart';
import 'package:uyt/view/widget/auth/custombuttonauth.dart';

abstract class OnBoardingController extends GetxController{
    next();
    onPageChanged(int index);
     
}
class OnboardingControllerImp extends OnBoardingController{
    late PageController pageController;
    int currentPage = 0;
  @override
  next() {
    currentPage ++;
    if(currentPage>OnBoardingList.length - 1)
    {
      Get.offAllNamed(AppRoute.login);
      return customiconbutton();

    }
    else{
        pageController.animateToPage(currentPage, duration:const Duration(microseconds: 900), curve: Curves.easeInOut);
    } 
  }
  @override
  onPageChanged(int index) {
    currentPage=index;
    update(); 
  }
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
   List<Widget> getButtons() {
    if (currentPage == 0) {
      return [
        Row(
          mainAxisAlignment: MainAxisAlignment.start, 
        children: [
         
         
        ],
        ),
        customiconbutton(),
        
      ]; 
    } else if (currentPage == 1) {
      return [
        TextButton(
          onPressed: () {
            pageController.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child:  Text("21".tr,style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: "Flutter"),),
        ),
        customiconbutton(),
      ];
    } else {
      return [
        TextButton(
          onPressed: () {
            pageController.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child:  Text("21".tr,style: TextStyle(color: Colors.black,fontFamily: "Flutter"),),
        ),
         Custombuttonauth(
                      text: "22".tr,
                      onPressed: (){Get.off(Login());}, 
                      width: 100, 
                      height: 50, 
                      color: ColorApp.primarycolor, 
                      textColor: ColorApp.backgroundcolor, ),
      //  const Custombuttonauth(text: "start", width: 90, height:50, color:ColorApp.primarycolor, textColor: ColorApp.backgroundcolor,)
      ];
    }
   }
     customiconbutton() {
      return Container(
        decoration:const BoxDecoration(
         //Color(0xFFBBDEFB),
          //color: Colors.blue[100],
                      //color: Color(0xFFF44336),
         color: ColorApp.softcolorblue,
          shape: BoxShape.circle
        ),
        child: TextButton(
          onPressed: () {
            pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child:const Icon(Icons.arrow_forward,size: 30,color: ColorApp.primarycolor,),
        ),
      );
     }
}
     
      //  @override
      //  goToHomeScreen() {
      //    Get.offAll(Login);
      //  }








//       customiconbutton() {
//       return Container(
//         decoration: BoxDecoration(
//                       //color: Colors.blue[100],
//                       color: Colors.blue,
//                       shape: BoxShape.circle
//                     ),
//         child: TextButton(
//           onPressed: () {
//             pageController.nextPage(
//               duration: const Duration(milliseconds: 500),
//               curve: Curves.easeInOut,
//             );
//           },
//           child:const Icon(Icons.arrow_forward),style: IconButton.styleFrom(backgroundColor: Colors.blue[100],foregroundColor: Colors.white),
//           ),
//         );
      
//      }
// }