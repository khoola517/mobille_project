import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/editeprofile_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/uilies/validation.dart';
import 'package:uyt/view/widget/auth/custombuttonauth.dart';
import 'package:uyt/view/widget/editprofile/customtextformfieldeditprofile.dart';

// class Editprofile extends StatefulWidget {
//   // final TextEditingController namecontroller=TextEditingController();
//   // final TextEditingController emailcontroller=TextEditingController();
//   const Editprofile({super.key});

//   @override
//   State<Editprofile> createState() => _EditprofileState();
// }

// class _EditprofileState extends State<Editprofile> {
//   @override
//   Widget build(BuildContext context) {
//     EditeprofileControllerImp controller = Get.put(EditeprofileControllerImp());
//     return Scaffold(
//       appBar: AppBar(),
//      body: Padding(
//        padding:const  EdgeInsets.symmetric(horizontal: 30,vertical: 10),
//        child:Column(
//          children: [
//            Container(
//             width: 400,
//             height: 370,
           
//             child: Card(
//               color: Colors.white,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                    Padding(
//                      padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
//                      child:  Text("15".tr),
//                    ),
//                    Form( 
//                     key: controller.formstate,
//                     child:  Customtextformfieldeditprofile(
//                       mycontroller: controller.name,
//                       icondata: Icons.person_2_outlined,  
//                       valid: (val){return validInput(val!, 5, 100, "name");},)),
//                     Padding(
//                      padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
//                      child:  Text("16".tr),
//                     ),
//                      Customtextformfieldeditprofile(mycontroller: controller.phone,icondata: Icons.phone_android_outlined, valid: (val){return validInput(val!, 5, 100,"phone");}, ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
//                       child: Text("17".tr),
//                     ),
//                      Customtextformfieldeditprofile(mycontroller: controller.email,icondata: Icons.email_outlined, valid: (val){ return validInput(val!, 5, 100, "phone");},),
//                     Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 5),
//                       child:  Text("18".tr),
//                     ),
//                      Customtextformfieldeditprofile(mycontroller: controller.location,icondata: Icons.place_outlined , valid: (val){return validInput(val!, 5, 100, "username");},),
//                     const SizedBox(height: 0,),
//                     const Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                     //Custombuttonauth(text: text, width: width, height: height, color: color, textColor: textColor)
                    
//                    ],)
//                 ],
//               ),
//             ),
//            ),
//            const SizedBox(height: 25,),
//            Padding(
//              padding: const EdgeInsets.symmetric(horizontal: 30),
//              child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: [
//                  Custombuttonauth(
//                       text: "27".tr,
//                       onPressed: (){controller.inputdata();}, 
//                       width: 100, 
//                       height: 50, 
//                       color: ColorApp.primarycolor, 
//                       textColor: ColorApp.backgroundcolor, ),
//                  Custombuttonauth(
                     
//                       onPressed: (){}, 
//                       width: 100, 
//                       height: 50, 
//                       color: ColorApp.primarycolor, 
//                       textColor: ColorApp.backgroundcolor,  text: "28".tr, ),
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//     );
//   }
// }