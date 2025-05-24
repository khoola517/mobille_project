import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/CardChildController.dart';

import '../../core/constant/color.dart';
//import 'card_child_controller.dart';

class CardChildView extends StatelessWidget {
  final int childId;

  CardChildView({required this.childId});

  final controller = Get.put(CardChildController());

  @override
  Widget build(BuildContext context) {
    controller.fetchChildData(childId);

    return Scaffold(
      appBar: AppBar(title:const Text("بطاقة التطعيم",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Flutter"),),
      centerTitle: true,
            leading: IconButton(
               onPressed: (){ 
               Get.back();
            }, 
          icon:const Icon(
              Icons.arrow_back_ios,
              color:  ColorApp.primarycolor,),
           ),),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else if (controller.cardChildModel.value == null) {
          return const Center(child: Text("لا توجد بيانات."));
        } else {
          final model = controller.cardChildModel.value!;
          final child = model.childDetails;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 16,right: 16,left: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${child?.name ?? ''}",style:const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,fontFamily: "Flutter"),),
                        Text("تاريخ الميلاد: ${child?.birthDate ?? ''}",style:const TextStyle(fontSize: 14,fontFamily: "Flutter"),),
                        Text("رقم البطاقة: ${child?.cardNumber ?? ''}",style:const TextStyle(fontSize: 14,fontFamily: "Flutter"),),
                        //Text("العمر: ${child?.childAge ?? ''}",style:const TextStyle(fontSize: 18),),
                      ],
                    ),
                  ),
                ),
                // Text("👶 الاسم: ${child?.name ?? ''}"),
                // Text("🎂 تاريخ الميلاد: ${child?.birthDate ?? ''}"),
                // Text("🪪 رقم البطاقة: ${child?.cardNumber ?? ''}"),
                // Text("📏 العمر: ${child?.childAge ?? ''}"),
                //const Divider(),
                if (model.cardDetails != null)
                //...model.cardDetails!.map((stage) =>// بعد التأكد أن model.cardDetails != null
Card(
  color: Colors.white,
  elevation: 4,
  margin: const EdgeInsets.all(8),
  child: Padding(
    padding: const EdgeInsets.all(9),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // const Text(
        //   "💉 جدول التطعيمات",
        //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        //   textDirection: TextDirection.rtl,
        // ),
       // const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child: DataTable(
              headingTextStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
              columns: const [
                DataColumn(label: Text('المرحلة',style: TextStyle(fontFamily: "Flutter"),)),
                DataColumn(label: Text('اسم اللقاح',style: TextStyle(fontFamily: "Flutter"),)),
                
                DataColumn(label: Text(' الجرعة',style: TextStyle(fontFamily: "Flutter"),)),
                DataColumn(label: Text('تاريخ موعد الجرعة',style: TextStyle(fontFamily: "Flutter"),)),
                DataColumn(label: Text("تاريخ اخر موعد للجرعة",style: TextStyle(fontFamily: "Flutter"),)),
              ],
              rows: model.cardDetails!
                  .expand((stage) => stage.doses!.map((dose) => DataRow(
                        cells: [
                          DataCell(Text(stage.stageName ?? '',style:const TextStyle(fontFamily: "Flutter"),)),
                          DataCell(Text(dose.vaccineName ?? '',style:const TextStyle(fontFamily: "Flutter"),)),
                          
                          DataCell(Text('${dose.doseNumber}',style:const TextStyle(fontFamily: "Flutter"),)),
                          DataCell(Text("${dose.vaccinationDate}",style:const TextStyle(fontFamily: "Flutter"), )),
                          DataCell(Text(dose.lastDateForVaccination ?? '-')),
                        ],
                      )))
                  .toList(),
            ),
          
        ),
      ],
    ),
  ),
)

                  // ...model.cardDetails!.map((stage) => Card(
                  //   child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text("📘 المرحلة: ${stage.stageName}", style: TextStyle(fontWeight: FontWeight.bold)),
                  //           ...stage.doses!.map((dose) => ListTile(
                  //                 title: Text("💉 ${dose.vaccineName}"),
                  //                 subtitle: Text("الجرعة: ${dose.doseNumber}, التاريخ: ${dose.vaccinationDate ?? 'غير مطعّم'}${dose.lastDateForVaccination}"),
                  //               )),
                  //           Divider(),
                  //         ],
                  //       ),
                  // )),
                  
              ],
            ),
          );
        }
      }),
    );
  }
}
