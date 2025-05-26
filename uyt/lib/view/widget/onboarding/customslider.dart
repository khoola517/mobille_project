import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/onboarding_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/data/datasource/static.dart';

class Customslider extends GetView<OnboardingControllerImp> {
  const Customslider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged:(val){
 controller.onPageChanged(val);
      } ,
    itemCount: OnBoardingList.length,
    itemBuilder: (context,i)=>Column(
      children: [
        
        const SizedBox(height: 60,),
        
        Image.asset(
          OnBoardingList[i].image!,
          height: 200,),
        const SizedBox(height: 30,),
        Text(OnBoardingList[i].title!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black,fontFamily: "Flutter"),),
        const SizedBox(height: 15,),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(OnBoardingList[i].body!,textAlign: TextAlign.center,style: TextStyle(height: 1.5,fontWeight: FontWeight.bold,fontFamily: "Flutter",color: Color.fromARGB(255, 50, 50, 50)),)
          ),
          
          
        ],
      )
    );
  }
}