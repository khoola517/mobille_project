import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/editeprofile_controller.dart';
import 'package:uyt/controller/profile_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/model/ProfileModel.dart';
import 'package:uyt/uilies/validation.dart';
import 'package:uyt/view/widget/auth/custombuttonauth.dart';
import 'package:uyt/view/widget/auth/customtextformfieldauthauth.dart';
import 'package:uyt/view/widget/profile.dart/customtextformfiled.dart';
import 'package:flutter/material.dart';

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
          //title: const Text('تعديل البيانات'),
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
             
            // TextButton(
            //   child: const Text('إلغاء'),
            //   onPressed: () => Navigator.pop(context),
            // ),
            
            // ElevatedButton(
            //   child: const Text('حفظ'),
            //   onPressed: () {
            //     final parts = nameController.text.trim().split(' ');
            //     final firstName = parts.isNotEmpty ? parts.first : '';
            //     final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

            //     editController.updateProfile(
                  
            //       userId: userId,
            //       firstName: firstName,
            //       lastName: lastName,
            //       email: emailController.text,
            //       phoneNumber: phoneController.text,
            //     );

            //     Navigator.pop(context); // إغلاق نافذة التعديل
            //   },
            // ),
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
        IconButton(onPressed: (){
          Get.back();}, 
          icon: Icon(Icons.arrow_forward,
          color: ColorApp.primarycolor,
          size: 30,
          ))
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
                // ElevatedButton(
                //   onPressed: () {
                //     if (user != null) {
                //       showEditDialog(context, user);
                //     }
                //   },
                //   child: const Text('تعديل'),
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


// class ProfileScreen extends StatelessWidget {
//   final int userId;

//   const ProfileScreen({super.key, required this.userId});

//   void showEditDialog(BuildContext context, ProfileModel user) {
//     final TextEditingController nameController = TextEditingController(
//       text: "${user.firstName ?? ''} ${user.lastName ?? ''}",
//     );
//     final TextEditingController emailController = TextEditingController(
//       text: user.email ?? '',
//     );
//     final TextEditingController phoneController = TextEditingController(
//       text: user.phoneNumber ?? '',
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('تعديل البيانات'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
                
                
//                 TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(labelText: 'الاسم',),
                  
//                 ),
//                 TextField(
//                   controller: emailController,
//                   decoration: const InputDecoration(labelText: 'البريد'),
//                 ),
//                 TextField(
//                   controller: phoneController,
//                   decoration: const InputDecoration(labelText: 'رقم الجوال'),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: const Text('إلغاء'),
//               onPressed: () => Navigator.pop(context),
//             ),
//             ElevatedButton(
//               child: const Text('حفظ'),
//               onPressed: () {
//                 // نفّذ حفظ التعديلات هنا أو استدعِ API
//                 editcon
//                 editController.updateProfile(
//   userId: userId,
//   firstName: firstName,
//   lastName: lastName,
//   email: emailController.text,
//   phoneNumber: phoneController.text,
// );
//                 print("تم التعديل:");
//                 print("الاسم: ${nameController.text}");
//                 print("البريد: ${emailController.text}");
//                 print("الهاتف: ${phoneController.text}");
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(ProfileController(userId: userId));
//     final editController = Get.put(ProfileEditController());

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('الملف الشخصي'),
//         backgroundColor: ColorApp.primarycolor,
//       ),
//       body: controller.obx(
//         (user) {
//           final nameController = TextEditingController(
//             text: "${user?.firstName ?? ''} ${user?.lastName ?? ''}",
//           );
//           final emailController = TextEditingController(
//             text: user?.email ?? '',
//           );
//           final phoneController = TextEditingController(
//             text: user?.phoneNumber ?? '',
//           );

//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 const SizedBox(height:25,),
//                   ClipOval(
//                    child: Image.asset("images/logo.png",width: 120,
//                     height: 120,fit: BoxFit.cover,),
//                 ),
//                 Text("${user?.firstName ?? ''} ${user?.lastName ?? ''}"),
//                 const SizedBox(height:10,),
//                 TextField(
//                   controller: nameController,
//                   readOnly: true,
//                   decoration: const InputDecoration(prefixIcon: Icon(Icons.person_outline)),
//                 ),
//                 TextField(
//                   controller: emailController,
//                   readOnly: true,
//                   decoration: const InputDecoration(prefixIcon: Icon(Icons.email_outlined)),
//                 ),
//                 TextField(
//                   controller: phoneController,
//                   readOnly: true,
//                   decoration: const InputDecoration(prefixIcon: Icon(Icons.phone_android_outlined)),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (user != null) {
//                       showEditDialog(context, user);
//                     }
//                   },
//                   child: const Text('تعديل'),
//                 ),
//               ],
//             ),
//           );
//         },
//         onLoading: const Center(child: CircularProgressIndicator()),
//         onError: (error) => Center(child: Text("حدث خطأ: $error")),
//         onEmpty: const Center(child: Text("لا توجد بيانات")),
//       ),
//     );
//   }
// }

// class ProfileScreen extends StatefulWidget {
//   final int userId;
//   const ProfileScreen({super.key, required this.userId});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   late final ProfileController controller;

//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();

//   final cityController = TextEditingController();
//   final areaController = TextEditingController();
//   final streetController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     controller = Get.put(ProfileController(userId: widget.userId));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('الملف الشخصي')),
//       body: controller.obx(
//         (profile) {
//           final person = profile?.person;
//           final location = (profile?.location != null && profile!.location!.isNotEmpty)
//               ? profile.location!.first
//               : null;

//           // ✅ تعبئة الحقول مرة واحدة فقط
//           if (nameController.text.isEmpty) {
//             nameController.text = "${person?.firstName ?? ''} ${person?.lastName ?? ''}";
//             emailController.text = person?.email ?? '';
//             phoneController.text = person?.phoneNumber ?? '';
//             cityController.text = location?.cityName ?? '';
//             areaController.text = location?.areaName ?? '';
//             streetController.text = location?.streetName ?? '';
//           }

//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(labelText: 'الاسم الكامل'),
//                 ),
//                 TextField(
//                   controller: emailController,
//                   decoration: const InputDecoration(labelText: 'البريد الإلكتروني'),
//                 ),
//                 TextField(
//                   controller: phoneController,
//                   decoration: const InputDecoration(labelText: 'رقم الجوال'),
//                   keyboardType: TextInputType.phone,
//                 ),
//                 const SizedBox(height: 20),
//                 const Text("الموقع", style: TextStyle(fontWeight: FontWeight.bold)),
//                 TextField(
//                   controller: cityController,
//                   decoration: const InputDecoration(labelText: 'المدينة'),
//                 ),
//                 TextField(
//                   controller: areaController,
//                   decoration: const InputDecoration(labelText: 'المنطقة'),
//                 ),
//                 TextField(
//                   controller: streetController,
//                   decoration: const InputDecoration(labelText: 'الشارع'),
//                 ),
//                 const SizedBox(height: 24),
//                 ElevatedButton(
//                   onPressed: () {
//                     final fullName = nameController.text.trim();
//                     final parts = fullName.split(' ');
//                     final firstName = parts.isNotEmpty ? parts.first : '';
//                     final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

//                     // controller.updateProfile(
//                     //   firstName: firstName,
//                     //   lastName: lastName,
//                     //   email: emailController.text.trim(),
//                     //   phoneNumber: phoneController.text.trim(),
//                     //   city: cityController.text.trim(),
//                     //   area: areaController.text.trim(),
//                     //   street: streetController.text.trim(),
//                     // );
//                   },
//                   child: const Text('حفظ التعديلات'),
//                 ),
//               ],
//             ),
//           );
//         },
//         onLoading: const Center(child: CircularProgressIndicator()),
//         onError: (err) => Center(child: Text("خطأ: $err")),
//         onEmpty: const Center(child: Text("لا توجد بيانات")),
//       ),
//     );
//   }
// }


// class profile extends StatelessWidget {
//   final int childId = Get.arguments ?? 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("الملف الشخصي")),
//       body: Center(child: Text("Child ID: $childId")),
//     );
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   final int userId;
  

//   const ProfileScreen({super.key, required this.userId}); // تأكد من تمرير الـ userId

//   @override
//   Widget build(BuildContext context) {
//     // هنا نستخدم Get.put لتمرير userId للـ ProfileController
//     final controller = Get.put(ProfileController(userId: userId));

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('7'.tr), // أو أي نص آخر تريد
//         backgroundColor: ColorApp.primarycolor,
//       ),
//       body: controller.obx(
//         (user) {
//           if (user == null) {
//             return Center(child: Text('لا توجد بيانات للمستخدم'));
//           }
//            print("المستخدم: ${user.person?.email} ${user.person?.lastName}");
//            print("التخدم: ${user.person?.phoneNumber} ${user.person?.email}");
//            print("الموقع: ${user.location?.first.cityName}");
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("الاسم: ${user!.person?.firstName} ${user.person?.lastName ?? ''}", style: TextStyle(fontSize: 20)),
//                Text("البريد: ${user.person?.email ?? ''}", style: TextStyle(fontSize: 18)),
//                Text("رقم الجوال: ${user.person?.phoneNumber ?? ''}", style: TextStyle(fontSize: 18)),
//              Text("المدينة: ${user.location?.first.cityName ?? ''}", style: TextStyle(fontSize: 18)),
//                 Text("الموقع: ${user.location?.first.cityName}"),
//                  Text("الاسم: ${user.person?.firstName ?? ''} ${user.person?.lastName ?? ''}", style: TextStyle(fontSize: 20)),
//           const SizedBox(height: 10),
//           Text("البريد: ${user.location?.first}", style: TextStyle(fontSize: 18)),
//           Text(
//   "رقم الجوال: ${user.person?.phoneNumber ?? 'غير متوفر'}",
//   style: TextStyle(fontSize: 18),
// ),
                
//                 Text("${userId}"),
//                 Text("الاسم: ${user.person?.firstName} ${user.person?.lastName}", style: TextStyle(fontSize: 20)),
//                 const SizedBox(height: 10),
//                 Text("البريد: ${user.person?.email}", style: TextStyle(fontSize: 18)),
//                 const SizedBox(height: 10),
//                 Text("رقم الجوال: ${user.person?.phoneNumber}", style: TextStyle(fontSize: 18)),
//                 // أضف المزيد حسب الحاجة
//               ],
//             ),
//           );
//         },
//         onLoading: const Center(child: CircularProgressIndicator()), // أثناء التحميل
//         onError: (error) => Center(child: Text("حدث خطأ: $error")), // في حال حدوث خطأ
//         onEmpty: const Center(child: Text("لا توجد بيانات")), // في حال كانت البيانات فارغة
//       ),
//     );
//   }
// }


class Profile extends StatelessWidget {
  
  // TextEditingController locationcontroller=TextEditingController();
   Profile({super.key});

  @override
  Widget build(BuildContext context) {
     //ProfileControllerImp controller=Get.put(ProfileControllerImp());
    return Scaffold(
      // appBar: AppBar(leading: IconButton(onPressed: (){}, icon: const Icon(Icons.add_ic_call)),
      //   title:const Text("البروفايل"),
      //   actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios))],),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
              child: Column(
                children: [
                 
                  // SizedBox(
                  //   width: 120,
                  //   height: 120,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(100),child: Image.asset("images/one.png"),
                  //   ),),
                  const SizedBox(height:15,),
                    ClipOval(
                      child: Image.asset("images/logo.png",width: 120,
                    height: 120,fit: BoxFit.cover,),
                    ),
                    const SizedBox(height:2,),
                    Text("lllllll"),
                    //const SizedBox(height: 5,),
                    
                    Form(
                      //key: controller.formstate,
                      child: 
                      Customtextformfiled(hinttext: "15".tr,icon: Icons.person_2_outlined,)),
                      const SizedBox(height:3,),
                      Customtextformfiled(hinttext: "16".tr,icon: Icons.phone_android),
                      const SizedBox(height:5,),
                      Customtextformfiled(hinttext: "17".tr,icon: Icons.email_outlined),
                      const SizedBox(height:5,),
                      Customtextformfiled(hinttext: "18".tr,icon: Icons.place_outlined),
                      const SizedBox(height:20,),
                      Custombuttonauth(
                     text: "19".tr,
                    //onPressed: (){},
                   onPressed: (){
                    //controller.goToEditeprofile();
                    }, 
                    width: 170, 
                    height: 50, 
                    color: ColorApp.primarycolor, 
                    textColor: ColorApp.backgroundcolor, ),
                const SizedBox(height: 5,),
                const Text("الاطفال المسجلون",textAlign: TextAlign.start,),
                const SizedBox(height: 5,),
                Container(
                  height: 50,
                  width: 300,
                  color: Colors.white,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),child: Image.asset("images/one.png"),
                    ),),
                    Text("name"),
                    TextButton(onPressed: (){}, child: Text("عرض التفاصيل"))
                      ],
                    ),
                  )
                )
                  
                ],
              ),
            ),
          ),
        ),
      //drawer: Drawer(),
    );
  }
}