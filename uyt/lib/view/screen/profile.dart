import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/editeprofile_controller.dart';
import 'package:uyt/controller/profile_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/model/ProfileModel.dart';

import '../widget/auth/custombuttonauth.dart';
class ProfileScreen extends StatelessWidget {
  final int userId;

  const ProfileScreen({super.key, required this.userId});

  void showEditDialog(BuildContext context, ProfileModel user) {
    final TextEditingController nameController = TextEditingController(
      text: "${user.firstName ?? ''} ${user.lastName ?? ''}",
    );
    final TextEditingController emailController = TextEditingController(
      text: user.email ?? '',
    );
    final TextEditingController phoneController = TextEditingController(
      text: user.phoneNumber ?? '',
    );

    final editController = Get.find<ProfileEditController>(); 

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          content: SingleChildScrollView(
           
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(alignment: Alignment.centerRight,child: const Text("الأسم",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Flutter"),)),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 35,
                    child: TextField(
                      style: const TextStyle(fontFamily: "Flutter"),
                      controller: nameController,
                      decoration: const InputDecoration(suffix: Icon(Icons.person_2_outlined,color: Colors.grey,),border: OutlineInputBorder(),contentPadding: EdgeInsets.all(10),
                       focusedBorder:const OutlineInputBorder(
                       borderSide: BorderSide(color:ColorApp.primarycolor,width: 2)
                     ),),
                     
                    ),
                    
                  ),
                  const SizedBox(height: 10,),
                  Align(alignment: Alignment.centerRight,child: const Text('البريد الألكتروني',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Flutter"),)),
                 const SizedBox(height: 10,),
                  SizedBox(
                    height: 35,
                    child: TextField(
                      style: const TextStyle(fontFamily: "Flutter"),
                      controller: emailController,
                      decoration: const InputDecoration(
                        suffix: Icon(Icons.email_outlined,color: Colors.grey,),border: OutlineInputBorder(),contentPadding: EdgeInsets.all(10),
                        focusedBorder:const OutlineInputBorder(
                       borderSide: BorderSide(color:ColorApp.primarycolor,width: 2)
                     ),
                      
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Align(alignment: Alignment.centerRight,child: const Text('رقم الهاتف',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Flutter"),)),
                 const SizedBox(height: 10,),
                  SizedBox(
                    height: 35,
                    child: TextField(
                      style: const TextStyle(fontFamily: "Flutter"),
                      controller: phoneController,
                      decoration: const InputDecoration(suffix: Icon(Icons.phone_android_outlined,color: Colors.grey,),border: OutlineInputBorder(),contentPadding: EdgeInsets.all(10),
                      focusedBorder:const OutlineInputBorder(
                       borderSide: BorderSide(color:ColorApp.primarycolor,width: 2)
                     ),),
                    ),
                  ),
                 const SizedBox(height: 20,),
                ],
              ),
            ),
            
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Custombuttonauth(text: "تعديل".tr, width: 85, height: 50,color: ColorApp.primarycolor, textColor: ColorApp.backgroundcolor, 
            onPressed: (){
              final parts = nameController.text.trim().split(' ');
              final firstName = parts.isNotEmpty ? parts.first : '';
              final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';
              editController.updateProfile( 
                userId: userId,
                firstName: firstName,
                lastName: lastName,
                email: emailController.text,
                 phoneNumber: phoneController.text,
              );
              Get.back();
              
            },),
                Custombuttonauth(text: "28".tr,onPressed: (){Get.back();},   width: 75, height: 50, color: ColorApp.primarycolor, textColor: ColorApp.backgroundcolor, ),
               
              ],)
             
        
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController(userId: userId));
    final editController = Get.put(ProfileEditController());

    return Scaffold(
      //drawer: Drawer(),
      appBar: AppBar(
       actions: [
        //IconButton(onPressed: (){Get.off();}, icon: Icon(Icons.arrow_forward,color: ColorApp.primarycolor,)),
       ],
      ),
      body: controller.obx(
        (user) {
          final nameController = TextEditingController(
            text: "${user?.firstName ?? ''} ${user?.lastName ?? ''}",
          );
          final emailController = TextEditingController(
            text: user?.email ?? '',
          );
          final phoneController = TextEditingController(
            text: user?.phoneNumber ?? '',
          );

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 25),
                ClipOval(
                  child: Image.asset(
                    "images/injection.png",
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text("${user?.firstName ?? ''} ${user?.lastName ?? ''}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Flutter"),),
                const SizedBox(height: 15),
                TextField(
                  style: const TextStyle(fontFamily: "Flutter"),
                  controller: nameController,
                  readOnly: true,
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.person_outline,color: Colors.grey,)),
                ),
                TextField(
                  style: const TextStyle(fontFamily: "Flutter"),
                  controller: emailController,
                  readOnly: true,
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,)),
                ),
                TextField(
                  style: const TextStyle(fontFamily: "Flutter"),
                  controller: phoneController,
                  readOnly: true,
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.phone_android_outlined,color: Colors.grey,)),
                ),
                const SizedBox(height: 90),
               Custombuttonauth(
                text: "تعديل الملف الشخصي",
                
                onPressed: (){
                  
                  if (user != null) {
                      showEditDialog(context, user);
                    }
                  }, 
                width: 180, 
                height: 50, 
                color: ColorApp.primarycolor, 
                textColor: ColorApp.backgroundcolor,
                 ),
               
                // ),
              ],
            ),
          );
        },
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(child: Text("حدث خطأ: $error")),
        onEmpty: const Center(child: Text("لا توجد بيانات")),
      ),
    );
  }
}

