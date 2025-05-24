import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/view/widget/auth/custombuttonauth.dart';
import 'package:uyt/view/widget/onboarding/custombutton.dart';

class Successscreen extends StatelessWidget {
  const Successscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child: 
       Center(
         child: Column(
          children: [
            const SizedBox(height: 150,),
             Image.asset("images/logo.png",height: 150,width: 140,fit: BoxFit.fill,),
            const SizedBox(height: 100,),
            Text("25".tr,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            const SizedBox(height: 80,),
            Custombuttonauth(
                text: "25".tr,
                onPressed: (){
                  }, 
                width: 250, 
                height: 50, 
                color: ColorApp.primarycolor, 
                textColor: ColorApp.backgroundcolor,
                 ),
          ],
         ),
       )
    ));
  }
}