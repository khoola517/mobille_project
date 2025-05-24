import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/Api_controller.dart';
import 'package:uyt/controller/homescreen_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/main.dart';
import 'package:uyt/model/IndexModel.dart';
import 'package:uyt/model/homescreenModel.dart';
import 'package:uyt/test/Model/models.dart';
import 'package:uyt/view/screen/allvaccinations.dart';
import 'package:uyt/view/screen/cardchild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/view/screen/profile.dart';
import 'package:uyt/view/screen/resetpassword.dart';
import 'package:uyt/view/widget/auth/custombuttonauth.dart';
import 'package:uyt/view/widget/auth/customicon.dart';
class Homescree extends StatelessWidget {
  final token=Get.arguments??"not token";
   Homescree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$token'),),
    );
  }
}
class IndexPage extends StatelessWidget {
  //final String token;
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
            //print("${token}");
            return const Center(child: Text('لم يتم العثور على أطفال'));
            
          }

          //final children = snapshot.data!.children!;
          final data = snapshot.data!;
          final children = data.children!;
          final userId = data.parentId?? 1;
          
         
          //final userId = user.person?.firstName;
          if (userId == null) {
            print("User ID is null");
          }
           return Scaffold(
            drawer: Drawer(
              child: ListView(
                children: [
            //       const DrawerHeader(
            // decoration: BoxDecoration(
            //   color: Colors.blue,
            // ),
            // child: Text(
            //   'القائمة الجانبية',
            //   style: TextStyle(color: Colors.white, fontSize: 20),
            // ),
            //             ),
            
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
              //Get.to(() => ChangePasswordView(userId: userId));
              // Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
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
                //size: 10
                
                
                
                //size: 35
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
                        //color: Colors.red,
                        color: ColorApp.primarycolor
                      ),
                      child: IconButton( icon: Icon(Icons.menu),iconSize: 20,
                      onPressed: (){Scaffold.of(context).openDrawer();}),
                    ),
                  );
                }
              ),
              //backgroundColor: Colors.blue,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      shape: BoxShape.circle),
                    
                    child: IconButton(
                      icon: Icon(Icons.person),
                      style: IconButton.styleFrom(backgroundColor: ColorApp.primarycolor,foregroundColor: Colors.white),
                      onPressed: () {
                        if (userId != null) {
                          Get.off(() => ProfileScreen(userId: userId));
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


//✅ عرض الإشعارات (Notifications) إن وجدت
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
                  // const SizedBox(width: 10),
                  // const Icon(Icons.notifications, color: Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }).toList(),

    //const SizedBox(height: 5),

    // ✅ قائمة الأطفال
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
                  Get.to(() => VaccinationDetailsPage(childId: child.iD!,));
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
    crossAxisAlignment: CrossAxisAlignment.start, // يجعل كل العناصر في اليمين
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      // ✅ شريط النسبة
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

      // ✅ نص نسبة التطعيم
      Text(
        'التطعيمات: ${child.allVaccinations}/${child.completedVaccinations} مكتملة',
        textDirection: TextDirection.rtl,
        style: const TextStyle(fontSize: 14,fontFamily: "Flutter"),
      ),

      //const SizedBox(height: 10),

      ///✅ زر تغيير كلمة المرور (في اليمين)
      // ElevatedButton(
      //   onPressed: () {
      //     Get.to(() => ChangePasswordView(userId: userId));
      //   },
      //   child: const Text("تغيير كلمة المرور"),
      // ),

      // const SizedBox(height: 10),

      // ✅ زر تحميل البطاقة (في اليسار فقط)
      // Align(
      //   alignment: Alignment.centerLeft,
      //   child: TextButton(
      //     onPressed: () {
      //       if (child.iD != null) {
      //         Get.to(() => CardChildView(childId: child.iD!));
      //       }
      //     },
      //     child: const Text("تحميل البطاقة"),
      //   ),
      // ),
      Align(
        alignment: Alignment.centerLeft,
        child: Custombuttonauth(
          onPressed: (){
            if (child.iD != null) {
              Get.to(() => CardChildView(childId: child.iD!));
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





























// class IndexPage extends StatelessWidget {
//   //final String token;
//   final token=Get.arguments??"not token";
  

//   IndexPage({super.key,  });

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(IndexPageController());

//     return Scaffold(
//       appBar: AppBar(title: Text("true"),actions: [
//         IconButton(
//                 icon: Icon(Icons.person),
//                 onPressed: () {
//                   // Get.to(ProfileScreen(userId: uer))
//                 },
//               ),
//       ],),
//       body: FutureBuilder<IndexModel>(
//         future: controller.fetchData(token),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.children == null) {
//             print("${token}");
//             return const Center(child: Text('لم يتم العثور على أطفال'));
            
//           }

//           //final children = snapshot.data!.children!;
//           final data = snapshot.data!;
//           final children = data.children!;
//           final userId = data.parentId?? 1;
//           //final userId = user.person?.firstName;
// if (userId == null) {
//   print("User ID is null");
// }
//           return ListView.builder(
//             itemCount: children.length,
//             itemBuilder: (context, index) {
//               final child = children[index];
//               return InkWell(
//                 onTap: () {
//                   if (child.iD!= null) {
//                     Get.to(() => VaccinationDetailsPage(childId: child.iD!));
//                 } else {
//                     Get.snackbar('خطأ', 'لا يوجد معرّف لهذا الطفل');
//                 }
//                 },
                
//                 child: Card(
                  
//                   margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                   elevation: 5,
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       ListTile(
//                         title: Text(
//                           '${child.firstName ?? 'غير معروف'} - ${child.age}',
//                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             //Text("${User:User.}"),
                            
//                             Text('التطعيمات: ${child.completedVaccinations}/${child.allVaccinations}مكتملة'),
//                             Text('التطعيمات المكتملة: ${child.completedVaccinations}'),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 150,
//                         child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         // رسم التطعيمات
//                         Container(
//                           height: 60,
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: List.generate(child.allVaccinations ?? 12, (i) {
//                 Color color;
//                 if (i < (child.completedVaccinations ?? 0)) {
//                   color = child.gender == 'ذكر'
//                       ? Colors.blue
//                       : (child.gender == 'انثى' ? Colors.pink : Colors.grey);
//                 } else {
//                   color = Colors.grey;
//                 }
//                 return Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 2),
//                   width: 15,
//                   height: 30,
//                   decoration: BoxDecoration(
//                     color: color,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                 );
//                             }),
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         // النص التوضيحي
//                         Text(
//                           '${child.completedVaccinations ?? 0} من ${child.allVaccinations ?? 12} تطعيمات مكتملة',
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         TextButton(onPressed: (){if(child.iD!= null){
//                           Get.to(() => CardChildView(childId: child.iD!));
//                         }
//                         }, child: Text("download")),
//                       ],
//                     ),
//                   ],
//                 ),
                
//                       ),
//                     ],
//                   ),
//                 ),
//               );
              
//             },
//           );
//         },
//       ),
//        //bottomNavigationBar: HighEndNavbar(),
      
//     );
//   }
// }

// class IndexPage extends StatelessWidget {
//   final String token;

//   IndexPage({required this.token});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(IndexPageController()); // تأكد من استبدال YourController بالاسم الصحيح

//     return Scaffold(

//       body: FutureBuilder<IndexModel>(
//         future: controller.fetchData(token), // دالة لجلب البيانات باستخدام التوكن
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const  Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.children == null) {
//             return const Center(child: Text('No children found'));
//           }

//           final children = snapshot.data!.children!;

//           return ListView.builder(
//             itemCount: children.length,
//             itemBuilder: (context, index) {
//               final child = children[index];
//               return Card(
//                 margin:const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                 elevation: 5,
//                 color: Colors.white,
//                 child: ListTile(
                  
//                   title: Text('${child.firstName ?? 'Unknown'}-${child.age}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('التطعيمات: ${child.completedVaccinations}/${child.completedVaccinations}'),
//                       Text('Completed Vaccinations: ${child.completedVaccinations}'),
//                     ],
//                   ),
//                   onTap: () {
//                    // Get.to(() => ChildDetailPage(childId: child.iD, token: token)); // انتقل إلى صفحة التفاصيل
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool showAllCards = false; // حالة لجميع الكاردات

  @override
  Widget build(BuildContext context) {
    final HomescreenControllerImp controller = Get.put(HomescreenControllerImp());
    final ApiController apiController = Get.put(ApiController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  "20".tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (apiController.api.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }

                  // تحديد عدد الكاردات المعروضة
                  final displayedCards = showAllCards
                      ? apiController.api
                      : apiController.api.take(2).toList(); // عرض أول 2 كارد فقط

                  return ListView.builder(
                    itemCount: displayedCards.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: InkWell(
                            onTap: () {
                              controller.goToAllvaccinations();
                            },
                            child: Card(
                              elevation: 5,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      apiController.api[index].userId.toString(),
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    Text(apiController.api[index].id.toString()),
                                    Text(apiController.api[index].title.toString(),),
                                    Text(
                                      "State:update",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),

              // زر "عرض جميع الكاردات" يظهر فقط إذا كان العدد أكبر من 2
              if (apiController.api.length > 2 && !showAllCards) // تعديل الشرط
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 10),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        showAllCards = true; // عند الضغط، نغير الحالة لإظهار جميع الكاردات
                      });
                    },
                    child: Text(
                      "6".tr,
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
// class Homescreen extends StatefulWidget {
  
//    Homescreen({super.key, });

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   @override
//   Widget build(BuildContext context) {
//     HomescreenControllerImp controller = Get.put(HomescreenControllerImp());
//     ApiController apiController = Get.put(ApiController());

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 25),
//                 child: Text(
//                   "20".tr,
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Expanded( // استخدم Expanded لملء المساحة المتاحة
//                 child: InkWell(
//                   onTap: () {
//                     controller.goToAllvaccinations();
//                   },
//                   child: Obx(() {
//                     if (apiController.api.isEmpty) {
//                       return Center(child: CircularProgressIndicator());
//                     }
//                     return ListView.builder(
//                       itemCount: apiController.api.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(bottom: 15),
//                           child: Padding(
//                             padding: const EdgeInsets.all(15),
//                             child: Card(
//                               elevation: 5,
//                               color: Colors.white,
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Text(
//                                       apiController.api[index].userId.toString(),
//                                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                                     ),
//                                     Text("غغغغغغغغ"),
//                                     Text(
//                                       "State:update",
//                                       style: TextStyle(color: Colors.green),
//                                     ),
//                                     SizedBox(height: 20),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start, 
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       "6".tr,
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }