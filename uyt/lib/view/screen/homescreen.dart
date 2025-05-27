import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/homescreen_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/model/IndexModel.dart';
import 'package:uyt/view/screen/allvaccinations.dart';
import 'package:uyt/view/screen/cardchild.dart';
import 'package:uyt/view/screen/login.dart';
import 'package:uyt/view/screen/profile.dart';
import 'package:uyt/view/screen/resetpassword.dart';
import 'package:uyt/view/widget/auth/custombuttonauth.dart';
class IndexPage extends StatelessWidget {
  final token=Get.arguments??"not token";
  IndexPage({super.key,  });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IndexPageController());
    return Scaffold(
      body: FutureBuilder<IndexModel>(
        future: controller.fetchData(token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.children == null) {
            
            return const Center(child: Text('لم يتم العثور على أطفال'));
            
          }
          final data = snapshot.data!;
          final children = data.children!;
          final userId = data.parentId?? 1;

          if (userId == null) {
            print("User ID is null");
          }
           return Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
                  
            ListTile(
              trailing: Icon(Icons.arrow_forward,
               color: ColorApp.primarycolor,
               size: 30,),
            leading: const Icon(Icons.settings),
            title: const Text("الأعدادات",style: TextStyle(fontFamily: "Flutter"),),
            onTap: () {
              Navigator.pop(context);
            },
                        ),
                        ListTile(
            leading: const Icon(Icons.person),
            title: const Text("تعديل كلمة المرور",style: TextStyle(fontFamily: "Flutter"),),
            
            onTap: () {
              showChangePasswordDialog(context, userId);
              
            },
            
                        ),
                       
                ],
              ),
            ),
            appBar: AppBar(
              title: Text("9".tr,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,fontFamily: "Flutter"),)
              ,centerTitle: true,
              iconTheme: IconThemeData(
                color: Colors.white,
                
              ),
              leading: Builder(
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        
                        shape: BoxShape.circle,
                        
                        color: ColorApp.primarycolor
                      ),
                      child: IconButton( icon: Icon(Icons.menu),iconSize: 20,
                      onPressed: (){Scaffold.of(context).openDrawer();}),
                    ),
                  );
                }
              ),
              
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      
                      shape: BoxShape.circle),
                    
                    child: IconButton(
                      icon: Icon(Icons.person),
                      style: IconButton.styleFrom(backgroundColor: ColorApp.primarycolor,foregroundColor: Colors.white),
                      onPressed: () {
                        if (userId != null) {
                          Get.to(() => ProfileScreen(userId: userId));
                          print(userId);
                        } else {
                          Get.snackbar('خطأ', 'لم يتم العثور على معرف الأب');
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
             
  body: ListView(
  padding: const EdgeInsets.only(left: 16,bottom: 16,right: 16 ),
  children: [
   
    Padding(
  padding: const EdgeInsets.only(right: .8),
  child: Text(
    "مرحبا بعودتك، ${data.parentName}!",
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22,fontFamily: "Flutter"),
  ),
),



if (data.notifications != null && data.notifications!.isNotEmpty)
  ...data.notifications!.map((notification) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
       
        elevation: 5,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          const  Padding(
              padding: const EdgeInsets.only(top: 8,left:18,right: 18 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Text("الاشعارات",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "Flutter"),),
                 SizedBox(width: 10),
                   Icon(Icons.notifications, color: ColorApp.waringcolor),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8,right: 18,left: 18,),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      notification.message ?? '',
                      style: const TextStyle(fontSize: 14,fontFamily: "Flutter"),
                    ),
                    
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }).toList(),

    ...children.map((child) {
      
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 5,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                
                if (child.iD != null) {
                  //Get.to(() => VaccinationDetailsPage(childId: child.iD!,));
                  Get.to(() => CardChildView(childId: child.iD!));
                } else {
                  Get.snackbar('خطأ', 'لا يوجد معرّف لهذا الطفل');
                }
              },
              title: Text(
                '${child.firstName ?? 'غير معروف'}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,fontFamily: "Flutter"),
              ),
              
            ),
            Container(
  height: 120,
  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, 
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      
      Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: 230,
          child: LinearProgressIndicator(
            value: (child.completedVaccinations ?? 0) / (child.allVaccinations ?? 1),
            minHeight: 12,
            backgroundColor: ColorApp.graycolor,
            valueColor: AlwaysStoppedAnimation<Color>(
              child.gender == 'ذكر'
                  ? ColorApp.primarycolor
                  : (child.gender == 'انثى' ? Colors.pink : Colors.green),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      const SizedBox(height: 10),

      
      Text(
        'التطعيمات: ${child.allVaccinations}/${child.completedVaccinations} مكتملة',
        textDirection: TextDirection.rtl,
        style: const TextStyle(fontSize: 14,fontFamily: "Flutter"),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Custombuttonauth(
          onPressed: (){
            if (child.iD != null) {
              //Get.to(() => CardChildView(childId: child.iD!));
              Get.to(() => VaccinationDetailsPage(childId: child.iD!,));
            }
          },
          text: " بطاقة ${child.firstName}",
           width: 95, height: 45, color: ColorApp.primarycolor, textColor: ColorApp.backgroundcolor,),
        ),
    ],
    
  ),
)

          ],
        ),
      );
    }).toList(),
  ],
   ),
   );
  },
 ) ,
);   
  }   
}




























