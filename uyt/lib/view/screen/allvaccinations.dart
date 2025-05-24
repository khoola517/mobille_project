import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/AllVaccinationController.dart';
import 'package:uyt/controller/Allvaccinations_controller.dart';
import 'package:uyt/controller/Api_controller.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/model/AllVaccinationModel.dart';
import 'package:uyt/view/screen/completed_vaccniation.dart';
import 'package:uyt/view/screen/upcoming_vaccinations.dart';
import 'package:uyt/view/widget/auth/custombuttonauth.dart';
//import 'package:uyt/view/widget/customvaccinationpage.dart';
import 'package:uyt/view/widget/onboarding/custombutton.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import '../controller/vaccination_controller.dart';

class VaccinationDetailsPage extends StatelessWidget {
  final int childId;

  VaccinationDetailsPage({required this.childId});

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
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //     IconButton(
                    //       onPressed: (){ 
                    //          Get.back();
                    //    }, 
                    //   icon:const Icon(
                    //   Icons.arrow_back_ios,
                    //   color: ColorApp.primarycolor,),
                    // ),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Text('${data.childName ?? 'غير معروف'}',textAlign: TextAlign.center,
                    //       style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: "Flutter")),
                    // ),
                  ],
                ),
                
                 Text('${data.childName?? ''}',style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: "Flutter")),
                // Text('الجنس: ${data.childGender ?? ''}'),
                
                const SizedBox(height: 10,),
        SizedBox(
          width: 230,
          child: LinearProgressIndicator(
            value: (data.completedDoses?.completedDoses ?? 0) / (data.completedDoses?.allDoses ?? 1),
            minHeight: 15,
           backgroundColor: ColorApp.graycolor,
                valueColor:const AlwaysStoppedAnimation<Color>(
                          
                ColorApp.primarycolor
          ),
            borderRadius: BorderRadius.circular(10),
        ),
        
    ),
    const SizedBox(height: 10,),
    Text('${data.completedDoses?.allDoses ?? 0}/${data.completedDoses?.completedDoses?? 0} تم أكمالها',style: TextStyle(fontSize: 16,fontFamily: "Flutter")),
    

      const SizedBox(height: 8),
      
       const SizedBox(height: 20),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
            Custombuttonauth(text: "12".tr,onPressed: (){},  width: 75, height: 50, color: ColorApp.primarycolor, textColor: ColorApp.backgroundcolor, ),
             Custombuttonauth(text: "13".tr,onPressed: (){Get.to(CompletedVaccniation(childId: childId,));},  width: 70, height: 50, color:Colors.grey, textColor: Colors.black, ),
              Custombuttonauth(text: "14".tr,onPressed: (){Get.to(UpcomingVaccinations(childId: childId,));},  width: 120, height: 50, color: Colors.grey, textColor: Colors.blue, ),
                ],
                ),
                const SizedBox(height: 20),
                Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        //Text('📌 جميع التطعيمات: ${data.completedDoses?.allDoses ?? 0}'),
                        //Text('✅ المكتملة: ${data.completedDoses?.completedDoses ?? 0}'),
                        //Text('🕒 القادمة: ${data.upcomingDoses?.upComingDoses ?? 0}'),
                      Text('التطعيمات المكتملة(${data.completedDoses?.allDoses ?? 0}/${data.completedDoses?.completedDoses?? 0})',
                      style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: "Flutter")),
                                    const SizedBox(height: 10),
                                    ...?data.completedDoses?.doses?.map((dose) => ListTile(
                        leading: Container(height: 25,width:25,color: Colors.green, child: const  Icon(Icons.check, color: Colors.white)),
                        title: Text('${dose.vaccineName ?? ''}',style:const TextStyle(fontSize:16,fontFamily: "Flutter"),),
                        subtitle: Text('  تم التطعيم في ${dose.visitDate ?? ''}\n ${dose.doseNumber ?? ''}',style: TextStyle(fontSize:16,fontFamily: "Flutter"),),
                      )),
                      const SizedBox(height: 20),
                      Text('التطعيمات قيد الانتظار(${data.completedDoses?.allDoses ?? 0}/${data.upcomingDoses?.upComingDoses ?? 0})',
                      style:const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: "Flutter")),
                                    const SizedBox(height: 10),
                                    ...?data.upcomingDoses?.theDoses?.map((dose) => ListTile(
                        leading: const Icon(Icons.schedule, color: Colors.orange),
                        title: Text('${dose.vaccineName ?? ''}',style:const TextStyle(fontSize:16,fontFamily: "Flutter"),),
                        subtitle: Text('موعد التطعيم ${dose.vaccinationDate ?? ''} \n ${dose.doseNumber ?? ''} ',style: TextStyle(fontSize:16,fontFamily: "Flutter"),),
                      )),
                    
                    ],),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


//                 ListView.builder(
//                   itemCount: 5,
//                   itemBuilder: (context,index){
//                     return Container(
//                       height: 100,
//                       child: Text("ooooooo"),
//                     );
//                   }
//                 )
//         ] 
//       ), 
//     );
//   }
// }