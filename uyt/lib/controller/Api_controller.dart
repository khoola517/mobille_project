
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:uyt/model/apidata_model.dart';
// import 'package:uyt/model/stagewithvaccine_model.dart';
// //import 'package:uyt/services/DataSerive.dart';
// //import 'package:http/http.dart' as http;
// // class DetailsController extends GetxController{
// //   StagesWithVaccine? stagesWithVaccine;
// //   getdata()async{
// //     http.Response response=await http.get(Uri.parse("http://127.0.0.1:8000/api/StageVaccineDose"));
// //     Map<String,dynamic>data=jsonDecode(response.body);
// //     stagesWithVaccine=StagesWithVaccine.fromJson(data);
// //     print(stagesWithVaccine!.endAge);
// //     print(stagesWithVaccine!.startAge);

    
    
// //     update();
// //   }

// // }

// class StagesController extends GetxController {
//   // قائمة المراحل مع اللقاحات
//   var stages = <StagesWithVaccine>[];

//   // متغير لتحميل البيانات
//   var isLoading = true.obs;

//   // دالة لجلب البيانات من API
//   getData() async {
//     try {
//       isLoading(true);  // تبدأ عملية التحميل
//       final response = await http.get(Uri.parse("http://127.0.0.1:8000/api/StageVaccineDose"));
      
//       if (response.statusCode == 200) {
//         // تحويل الـ JSON إلى موديل
//         List<dynamic> data = jsonDecode(response.body);
//         stages = data.map((stageData) => StagesWithVaccine.fromJson(stageData)).toList();
//       } else {
//         // إذا كانت الاستجابة خطأ
//         print("Failed to load data");
//         print('Error: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Error: $e");
//     } finally {
//       isLoading(false);  // إنهاء عملية التحميل
//     }
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     getData(); // استدعاء الدالة لجلب البيانات عند تحميل الـ Controller
//   }
// }


// class ApiController extends GetxController{
  
//   RxList<Api>api=RxList<Api>();
//   var loaddata = true.obs;
//   onInit(){
//     getposts();
//   }
//   getposts()async{
//     loaddata.value = true;
//      var response = await DataSerive().getposts();
//     if (response is List<Api>){
//       api.addAll(response);
//       loaddata.value = false;
//     }

//   }
// }