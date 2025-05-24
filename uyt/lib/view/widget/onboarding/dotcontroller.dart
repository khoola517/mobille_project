import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/onboarding_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/data/datasource/static.dart';

class dotcontroller extends StatelessWidget {
  const dotcontroller({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder: (controller)=>Column(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            ...List.generate(
              OnBoardingList.length, 
              (index)=>AnimatedContainer(
                margin: const EdgeInsets.only(right: 5),
               duration:const Duration(milliseconds: 900),
               width: controller.currentPage==index? 20:5,
               height: 6,
               decoration: BoxDecoration(
          
                color:controller.currentPage ==index ?ColorApp.primarycolor :Colors.grey,
                borderRadius: BorderRadius.circular(10)),
                ),
                )
              ],),
        ],
      ));
      
  }
}