import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/login_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/uilies/validation.dart';
import 'package:uyt/view/widget/auth/custombuttonauth.dart';
import 'package:uyt/view/widget/auth/customtextformfieldauthauth.dart';
import 'package:uyt/view/widget/auth/logoauth.dart';



class Login extends StatefulWidget {
   const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
     final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      body: Form(
        key: controller.formstate,
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 15,horizontal: 35),
          child: Column(
            children: [
              const SizedBox(height: 150,),
              const Logoauth(),
              const SizedBox(height: 30,),
              Customtextformfield(
                
                mycontroller: controller.username,
                valid:(val) {
                  return validInput(val!, 3, 100, "username");
              },
              hinttext: "2".tr,
              
              ),
              Customtextformfield(
                mycontroller: controller.password, 
                isPassword: true,
                valid: (val){
                  return validInput(val!, 3, 30, "password");
              },hinttext: "3".tr,
             
               ),
              const SizedBox(height: 80,),
              Custombuttonauth(
                text: "4".tr,
                
                onPressed: (){
                  
                  controller.login();
                  }, 
                width: 200, 
                height: 50, 
                color: ColorApp.primarycolor, 
                textColor: ColorApp.backgroundcolor,
                 ),
            ],
          ),
        ),
      ),
    );
  }
}