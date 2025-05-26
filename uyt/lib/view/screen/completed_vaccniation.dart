import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/AllVaccinationController.dart';
import 'package:uyt/controller/Api_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/model/AllVaccinationModel.dart';
class CompletedVaccniation extends StatelessWidget {
  final int childId;
   CompletedVaccniation({super.key, required this.childId});
  final controller = Get.put(VaccinationDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('تفاصيل التطعيم')),
      body: FutureBuilder<AllVaccinationModel>(
        future: controller.fetchVaccinationData(childId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('لا توجد بيانات'));
          }

          final data = snapshot.data!;

          return Scaffold(
            appBar: AppBar(title: Text('10'.tr,style:const TextStyle(fontWeight: FontWeight.bold,fontFamily: "Flutter"),),
            centerTitle: true,
            leading: IconButton(
               onPressed: (){ 
               Get.back();
            }, 
          icon:const Icon(
              Icons.arrow_back_ios,
              color: ColorApp.primarycolor,),
           ),),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Expanded(
                child: Column(
                  children: [
                    
                    Container(
                      height: 450,
                      width: 400,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                height: 150,
                                width: 400,
                                decoration:const BoxDecoration(
                                color: ColorApp.sendcrycolor,
                                borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5), ),
                                 ),
                                 child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10,),
                                    Text('${data.childName ?? 'غير معروف'}',style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: "Flutter"),),
                                    const Text("احسنت", style: TextStyle(fontSize: 16,fontFamily: "Flutter"),),
                                    const SizedBox(height: 10,),
                                     SizedBox(
                                       width: 230,
                                        child: LinearProgressIndicator(
                                          value: (data.completedDoses?.completedDoses ?? 0) / (data.completedDoses?.allDoses ?? 1),
                                          minHeight: 15,
                                          backgroundColor: ColorApp.graycolor,
                                           valueColor:const AlwaysStoppedAnimation<Color>(
                                            Colors.green
                                              //ColorApp.sendcrycolor
                                              ),
                                              borderRadius: BorderRadius.circular(10),
                                      ),
        
                                    ),
                                    const SizedBox(height: 10,),
                                    Text('${data.completedDoses?.allDoses ?? 0}/${data.completedDoses?.completedDoses?? 0} تطعيمات تم اكمالها',style:const TextStyle(fontSize: 16,fontFamily: "Flutter"), ),
                                    //Text('✅ المكتملة: ${data.completedDoses?.completedDoses ?? 0}'),
                                    //Text('🕒 القادمة: ${data.upcomingDoses?.upComingDoses ?? 0}'),
                                    
                                  ],
                                  
                    
                                 ),
                              ),
                              
                             
                              ],
                    
                            ),
                            
                            const SizedBox(height: 7),
                                ...?data.completedDoses?.doses?.map((dose) => ListTile(
                                leading: Container(height: 25,width:25,color: Colors.green, child: const  Icon(Icons.check, color: Colors.white)),
                                title: Text('${dose.vaccineName ?? ''}',style:const  TextStyle(fontSize: 18,fontFamily: "Flutter"),),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    Text('تم تطعيم في ${dose.visitDate ?? ''}',style:const  TextStyle(fontSize: 16,fontFamily: "Flutter"),),
                                    const SizedBox(height: 10,),
                                    
                                    const Divider(),
                                  ],
                                ),
                                
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class CompletedVaccniation extends StatelessWidget {
//    CompletedVaccniation({super.key});
//   ApiController controller = Get.put(ApiController());
//   @override
//   Widget build(BuildContext context) {
//     //appBar: AppBar(title: Text("10".tr),)
//     return Scaffold(
//       backgroundColor: ColorApp.backgroundcolor,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("10".tr),
//         backgroundColor: ColorApp.backgroundcolor,
//         leading:  IconButton(
//         icon: Icon(Icons.arrow_back_ios,color: ColorApp.primarycolor,), // أيقونة الصفحة الثانية
//         onPressed: () {
//           Get.back();
//         },
//       ),),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
//           child: Container( 
//             height: 450,
//             width: 400,
//             child: Card(
//             color: Colors.white,
//             elevation: 5,
//             child: Column(
//              children: [
//               Stack(
//                 children: [
//                     Container(
//                       height: 150,
//                       width: 400,
//                       decoration:const BoxDecoration(
//                         color: ColorApp.primarycolor,
//                         borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(15),
//                         bottomRight: Radius.circular(15),
//                         topLeft: Radius.circular(5),
//                         topRight: Radius.circular(5), ),
//                         ),
//                         child: ListView.builder(
//                         itemCount: controller.api.length,
//                         itemBuilder: (context,index){
//                           return  Container(
//                              child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                              mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Text(controller.api[index].id!.toString()),
//                               Text(controller.api[index].userId!.toString()),
//                                      //Text(controller.api[index].title!.tr),
//                                       // Text(controller1.api[pos].title!),
//                                       // Text(controller1.api[pos].title!),     
//                              ],       
//                          ),          
//                       ); 
//                     })  ,
//                   )
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Container(
//                     height: 250,
//                     child:ListView.builder(
//                           //scrollDirection: Axis.vertical,
//                         //itemCount: controller.posts.length,
//                         itemCount: controller.api.length,
//                         itemBuilder: (context,index){
//                           return  Container(
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                children: [
//                                  Row(
//                                    children: [
//                                      Container(height: 25,width: 25,color: Colors.green,child: Icon(Icons.check,color: Colors.white,),),
//                                      const SizedBox(width: 20,),
//                                      Text(controller.api[index].id!.toString()),
//                                     ],
//                                    ),
//                                      Text(controller.api[index].id!.toString()),
//                                      Text(controller.api[index].userId!.toString()),
//                                      //Text(controller.api[index].title!.tr),
//                                      ],
//                                     ),); 
//                     }) ,
//                   ),
//                 )
//               ],
//              ),
//             )   
//            ),
//         ),
//       ),
//     );
//   }
// }