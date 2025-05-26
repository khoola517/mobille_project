import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/view/widget/auth/custombuttonauth.dart';

import '../../controller/reset_password.dart';
import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../model/reset_password.dart';
import 'package:flutter/material.dart';

import '../widget/auth/customtextformfieldauthauth.dart';

void showChangePasswordDialog(BuildContext mainContext, int userId) {
  final _oldPass = TextEditingController();
  final _newPass = TextEditingController();
  final _confirmPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _controller = PasswordController();

  showDialog(
    context: mainContext,
    builder: (context) => AlertDialog(
      title: const Text("تعديل كلمة المرور",style: TextStyle(color: Color.fromARGB(255, 50, 50, 50),),),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Customtextformfield(
                hinttext: "كلمة المرور الحالية",
                mycontroller: _oldPass,
                valid: (val) => val!.isEmpty ? "الحقل مطلوب" : null,
              ),
              Customtextformfield(
                hinttext: "كلمة المرور الجديدة",
                mycontroller: _newPass,
                valid: (val) => val!.length < 6 ? "كلمة المرور قصيرة جداً" : null,
              ),
              Customtextformfield(
                hinttext: "تأكيد كلمة المرور",
                mycontroller: _confirmPass,
                valid: (val) => val != _newPass.text ? "كلمة المرور غير متطابقة" : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Custombuttonauth(onPressed: ()async {
                if (_formKey.currentState!.validate()) {
                  final model = ResetPassword(
                    oldPassword: _oldPass.text,
                    password: _newPass.text,
                    passwordConfirmation: _confirmPass.text,
                  );
            
                  final result = await _controller.changePassword(
                    userId: userId,
                    resetPassword: model,
                  );
            
                  Navigator.pop(context); // إغلاق الديالوج
            
                  // ✅ عرض الرسالة في السياق الرئيسي
                  ScaffoldMessenger.of(mainContext).showSnackBar(
                    SnackBar(
                      content: Text(result
                          ? '✅ تم تغيير كلمة المرور بنجاح'
                          : '❌ فشل في تغيير كلمة المرور'),
                    ),
                  );
                }
              },
              text: "تعديل", width: 70, height: 50,color: ColorApp.primarycolor, textColor: ColorApp.backgroundcolor,),
              Custombuttonauth(text: "28".tr,onPressed: (){Get.back();},   width: 75, height: 50, color: ColorApp.primarycolor, textColor: ColorApp.backgroundcolor, ),
          ],
          
        ),

              
      ],
    ),
  );
}


