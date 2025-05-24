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


// class ChangePasswordView extends StatefulWidget {
//   final int userId;

//   const ChangePasswordView({Key? key, required this.userId}) : super(key: key);

//   @override
//   State<ChangePasswordView> createState() => _ChangePasswordViewState();
// }

// class _ChangePasswordViewState extends State<ChangePasswordView> {
//   final _oldPass = TextEditingController();
//   final _newPass = TextEditingController();
//   final _confirmPass = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   final _controller = PasswordController();

//   void _submit() async {
//     if (_formKey.currentState!.validate()) {
//       final model = ResetPassword(
//         oldPassword: _oldPass.text,
//         password: _newPass.text,
//         passwordConfirmation: _confirmPass.text,
//       );

//       final result = await _controller.changePassword(
//         userId: widget.userId,
//         resetPassword: model,
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(result
//               ? '✅ تم تغيير كلمة المرور بنجاح'
//               : '❌ فشل في تغيير كلمة المرور'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('تغيير كلمة المرور')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _oldPass,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'كلمة المرور الحالية'),
//                 validator: (val) => val!.isEmpty ? "الحقل مطلوب" : null,
//               ),
//               TextFormField(
//                 controller: _newPass,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'كلمة المرور الجديدة'),
//                 validator: (val) => val!.length < 6 ? 'قصيرة جداً' : null,
//               ),
//               TextFormField(
//                 controller: _confirmPass,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'تأكيد كلمة المرور'),
//                 validator: (val) => val != _newPass.text ? 'غير متطابقة' : null,
//               ),
//               SizedBox(height: 24),
//               Custombuttonauth(onPressed: _submit,text: "40", width: 70, height: 50, color: ColorApp.primarycolor, textColor: ColorApp.backgroundcolor),
//               // ElevatedButton(
//               //   onPressed: _submit,
//               //   child: Text('تحديث'),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// class ChangePasswordPage extends StatefulWidget {
//   final String token;
//   final int userId;

//   const ChangePasswordPage({Key? key, required this.token, required this.userId}) : super(key: key);

//   @override
//   State<ChangePasswordPage> createState() => _ChangePasswordPageState();
// }

// class _ChangePasswordPageState extends State<ChangePasswordPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _oldPasswordController = TextEditingController();
//   final _newPasswordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   final PasswordController _controller = PasswordController();

//   bool _isLoading = false;

//   void _submit() async {
//     if (_formKey.currentState!.validate()) {
//       if (_newPasswordController.text != _confirmPasswordController.text) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('كلمة المرور الجديدة وتأكيدها غير متطابقين')),
//         );
//         return;
//       }

//       setState(() {
//         _isLoading = true;
//       });

//       final resetPassword = ResetPassword(
//         oldPassword: _oldPasswordController.text,
//         password: _newPasswordController.text,
//         passwordConfirmation: _confirmPasswordController.text,
//       );

//       bool success = await _controller.changePassword(
//        // token: widget.token,
//         userId: widget.userId,
//         resetPassword: resetPassword,
//       );

//       setState(() {
//         _isLoading = false;
//       });

//       if (success) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('تم تغيير كلمة المرور بنجاح')),
//         );
//         Navigator.pop(context);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('فشل في تغيير كلمة المرور')),
//         );
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _oldPasswordController.dispose();
//     _newPasswordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('تغيير كلمة المرور')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _oldPasswordController,
//                 decoration: InputDecoration(labelText: 'كلمة المرور القديمة'),
//                 obscureText: true,
//                 validator: (value) => value == null || value.isEmpty ? 'الرجاء إدخال كلمة المرور القديمة' : null,
//               ),
//               TextFormField(
//                 controller: _newPasswordController,
//                 decoration: InputDecoration(labelText: 'كلمة المرور الجديدة'),
//                 obscureText: true,
//                 validator: (value) => value == null || value.isEmpty ? 'الرجاء إدخال كلمة المرور الجديدة' : null,
//               ),
//               TextFormField(
//                 controller: _confirmPasswordController,
//                 decoration: InputDecoration(labelText: 'تأكيد كلمة المرور'),
//                 obscureText: true,
//                 validator: (value) => value == null || value.isEmpty ? 'الرجاء تأكيد كلمة المرور' : null,
//               ),
//               const SizedBox(height: 20),
//               _isLoading
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: _submit,
//                       child: Text('تغيير كلمة المرور'),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// class ResetPasswordView extends StatelessWidget {
//   final int userId;
//   final _formKey = GlobalKey<FormState>();

//   ResetPasswordView({super.key, required this.userId});

//   final controller = Get.put(ResetPasswordController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('تغيير كلمة المرور')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: controller.oldPasswordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(labelText: 'كلمة المرور القديمة'),
//                 validator: (value) => value!.isEmpty ? 'هذا الحقل مطلوب' : null,
//               ),
//               TextFormField(
//                 controller: controller.newPasswordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(labelText: 'كلمة المرور الجديدة'),
//                 validator: (value) =>
//                     value!.length < 6 ? 'يجب أن تكون 6 أحرف على الأقل' : null,
//               ),
//               TextFormField(
//                 controller: controller.confirmPasswordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(labelText: 'تأكيد كلمة المرور'),
//                 validator: (value) =>
//                     value != controller.newPasswordController.text
//                         ? 'كلمة المرور غير متطابقة'
//                         : null,
//               ),
//               const SizedBox(height: 20),
//               Obx(() => controller.isLoading.value
//                   ? const Center(child: CircularProgressIndicator())
//                   : ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           controller.resetPassword(userId);
//                         }
//                       },
//                       child: const Text('تحديث كلمة المرور'),
//                     )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
