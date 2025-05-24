import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/Api_controller.dart';
class VaccniationDetailes extends StatelessWidget {
  VaccniationDetailes({super.key});
  final ApiController apiController = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تفاصيل التطعيمات"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(() {
            // تحقق مما إذا كانت القائمة فارغة
            if (apiController.api.isEmpty) {
              return const Center(
                child: CircularProgressIndicator()
                );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                 Container(
                  height: 300,
                   child: ListView.builder(
                            //scrollDirection: Axis.vertical,
                          //itemCount: controller.posts.length,
                      itemCount: apiController.api.length,
                      itemBuilder: (context,index){
                         final item = apiController.api[index];
                         return Card(
                          elevation: 3,
                          child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                              Text(
                                        "User ID: ${item.userId}",
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 5),
                                      Text("ID: ${item.id}"),
                                      SizedBox(height: 5),
                                      Text("غغغغغغغغ"),
                                      SizedBox(height: 5),
                                      Text(
                                        "State: update",
                                        style: TextStyle(color: Colors.green),
                                      ),
                             ],
                          ),
                   
                         );
                      }),
                 ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      
                      columns: [
                        DataColumn(
                          label: Container(
                            padding:const EdgeInsets.all(8.0),
                            color: Colors.blueAccent,
                            child:const Text(
                              'User ID',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            padding:const EdgeInsets.all(8.0),
                            color: Colors.blueAccent,
                            child:const Text(
                              'ID',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Container(
                            padding:const EdgeInsets.all(8.0),
                            color: Colors.blueAccent,
                            child:const Text(
                              'وصف إضافي',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                           DataColumn(
                          label: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.blueAccent,
                            child: Text(
                              'وصف إضافي',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                           DataColumn(
                          label: Container(
                            padding: EdgeInsets.all(8.0),
                            color: Colors.blueAccent,
                            child: Text(
                              'وصف إضافي',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                      rows: apiController.api.map((item) {
                        return DataRow(cells: [
                          DataCell(Text(item.userId.toString())),
                          DataCell(Text(item.id.toString())),
                          DataCell(Text("وصف إضافي هنا...")),
                           DataCell(Text("وصف إضافي هنا...")),
                            DataCell(Text("وصف إضافي هنا...")), // يمكنك تعديل هذا النص حسب الحاجة
                        ]);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}