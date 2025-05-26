import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/onboarding_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/data/datasource/static.dart';
import 'package:uyt/view/screen/login.dart';
import 'package:uyt/view/widget/onboarding/custombutton.dart';
import 'package:uyt/view/widget/onboarding/customslider.dart';
import 'package:uyt/view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  final OnBoardingController _controller = Get.put(OnboardingControllerImp());
   OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: TextButton(
            onPressed: () {
              Get.offAll(Login());
              },
            child:  Text("35".tr,style: TextStyle(color: Colors.black),),
          ),
        ),
      body:const SafeArea(
        
        child: Column(
          children: [
             Expanded(
              flex: 3,
              child: Customslider(),
            ),
             Expanded(
              flex: 1,
              child: Column(
                children:[
                   dotcontroller(),
                   Spacer(flex: 2,),
      
                     Custombutton(),
                     const SizedBox(height: 30),
                  
                ],
                
              ))
          ],
        ),
      ),
    );
  }
}