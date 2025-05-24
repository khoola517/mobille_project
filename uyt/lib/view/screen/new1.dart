


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/DescriptionController.dart';
import '../../core/constant/color.dart';
import '../../model/DetailesVaccine.dart';
import '../new2.dart';

class VaccineListView extends StatefulWidget {
  @override
  State<VaccineListView> createState() => _VaccineListViewState();
}

class _VaccineListViewState extends State<VaccineListView> {
  final VaccineController controller = Get.put(VaccineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("دليل التطعيمات الموصى بها",style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: "Flutter")),centerTitle: true,
      leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,color: ColorApp.primarycolor,)),),
      body: FutureBuilder<List<DetailesVaccine>>(
        future: controller.fetchVaccines(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
               child: CircularProgressIndicator()
              );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
            
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No vaccines found'));
          }

return ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (context, index) {
    final vaccine = snapshot.data![index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //Text('من ${vaccine.startAge} الى ${vaccine.endAge}'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text('${vaccine.stageName}',
                style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
             const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15),
                child: Divider(),
              ),
            ],),),
          ),
          
          
          ListTile(
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text('Ages: ${vaccine.startAge} - ${vaccine.endAge}'),
                
                for (var v in vaccine.vaccines ?? [])
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    margin:const EdgeInsets.symmetric(vertical: 5), 
                    child: ListTile(
                      title: Text('${v.vaccineName}',style: const TextStyle(fontWeight: FontWeight.bold,fontFamily: "Flutter")),
                      
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 7,),
                          Text('${v.doseNumber}',style:const TextStyle(color: Colors.green,fontFamily: "Flutter")),
                          const SizedBox(height: 7,),
                          Text('${v.description}',style:const TextStyle(color:Colors.grey,fontWeight: FontWeight.bold,fontFamily: "Flutter")),
                          
                        ],
                      ),
                      onTap: () {
                        Get.to(() => VaccineDetailView(vaccineId: vaccine.vaccines?.first.vaccineId));
                        
                      },
                    ),
                  ),
              ],
            ),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  },
);
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:uyt/controller/DescriptionController.dart';
// import 'package:uyt/core/constant/color.dart';
// import 'package:uyt/model/DetailesVaccine.dart';
// import 'package:uyt/view/new2.dart';
// class VaccineListView extends StatefulWidget {
//   @override
//   State<VaccineListView> createState() => _VaccineListViewState();
// }

// class _VaccineListViewState extends State<VaccineListView> {
//   final VaccineController controller = Get.put(VaccineController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<DetailesVaccine>>(
//         future: controller.fetchVaccines(), 
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//                child: CircularProgressIndicator()
//               );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
            
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No vaccines found'));
//           }

// return ListView.builder(
//   itemCount: snapshot.data!.length,
//   itemBuilder: (context, index) {
//     final vaccine = snapshot.data![index];
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//               //Text('من ${vaccine.startAge} الى ${vaccine.endAge}'),
//               Text('${vaccine.stageName}',
//               style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
//              const Padding(
//                 padding:  EdgeInsets.symmetric(horizontal: 15),
//                 child: Divider(),
//               ),
//             ],),),
//           ),
          
          
//           ListTile(
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //Text('Ages: ${vaccine.startAge} - ${vaccine.endAge}'),
                
//                 for (var v in vaccine.vaccines ?? [])
//                   Card(
//                     elevation: 5,
//                     color: Colors.white,
//                     margin:const EdgeInsets.symmetric(vertical: 5), 
//                     child: ListTile(
//                       title: Text('${v.vaccineName}',style: const TextStyle(fontWeight: FontWeight.bold)),
                      
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 7,),
//                           Text('${v.doseNumber}',style:const TextStyle(color: Colors.green)),
//                           const SizedBox(height: 7,),
//                           Text('${v.description}',style:const TextStyle(color:Colors.grey,fontWeight: FontWeight.bold)),
                          
//                         ],
//                       ),
//                       onTap: () {
//                         Get.to(() => VaccineDetailView(vaccineId: vaccine.vaccines?.first.vaccineId));
                        
//                       },
//                     ),
//                   ),
//               ],
//             ),
//             onTap: () {
              
//             },
//           ),
//         ],
//       ),
//     );
//   },
// );
//         },
//       ),
//     );
//   }
// }












































// class VaccineListView extends StatefulWidget {
//   @override
//   State<VaccineListView> createState() => _VaccineListViewState();
// }

// class _VaccineListViewState extends State<VaccineListView> {
//   final VaccineController controller = Get.put(VaccineController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorApp.backgroundcolor,
//       appBar: AppBar(
//         centerTitle:true ,
//         title: Text("24".tr),
//         backgroundColor: ColorApp.backgroundcolor,
//         leading: IconButton(
//           onPressed: (){ 
//             Get.back();
//             }, 
//           icon:const Icon(
//             Icons.arrow_back_ios,
//             color: ColorApp.primarycolor,),
//         ),),
//       body: FutureBuilder<List<DetailesVaccine>>(
//         future: controller.fetchVaccines(), // استدعاء الدالة لجلب البيانات
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//                child: CircularProgressIndicator()
//               );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
            
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text('No vaccines found'));
//           }

// return ListView.builder(
//   itemCount: snapshot.data!.length,
//   itemBuilder: (context, index) {
//     final vaccine = snapshot.data![index];
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//               Text('من ${vaccine.startAge} الى ${vaccine.endAge}'),
//               const Divider(),
//             ],),),
//           ),
          
          
//           ListTile(
//             //title: Text(vaccine.stageName ?? ''),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //Text('Ages: ${vaccine.startAge} - ${vaccine.endAge}'),
//                 // حلقة for لعرض كل لقاح
//                 for (var v in vaccine.vaccines ?? [])
//                   Card(
//                     elevation: 5,
//                     color: Colors.white,
//                     margin:const EdgeInsets.symmetric(vertical: 5), // مسافة بين البطاقات
//                     child: ListTile(
//                       title: Text('${v.vaccineName}',style: const TextStyle(fontWeight: FontWeight.bold)),
                      
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(height: 7,),
//                           Text('${v.doseNumber}',style:const TextStyle(color: Colors.green)),
//                           const SizedBox(height: 7,),
//                           Text('${v.description}',style:const TextStyle(color:Colors.grey,fontWeight: FontWeight.bold)),
                          
//                         ],
//                       ),
//                       onTap: () {
//                           Get.to(() => VaccineDetailView(vaccineId: vaccine.vaccines?.first.vaccineId));
//                         // يمكنك إضافة إجراء عند النقر على لقاح معين
//                       },
//                     ),
//                   ),
//               ],
//             ),
//             onTap: () {
//               //Get.to(() => VaccineDetailView(vaccineId: vaccine.vaccines?.first.vaccineId));
//             },
//           ),
//         ],
//       ),
//     );
//   },
// );
//         },
//       ),
//     );
//   }
// }