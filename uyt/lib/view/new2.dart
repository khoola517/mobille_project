import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/model/DescriptionVaccine.dart';

class VaccineDetailView extends StatelessWidget {
  final int? vaccineId;

  VaccineDetailView({this.vaccineId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        title:const  Text(' تفاصيل اللقاح', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Flutter")),
        backgroundColor: ColorApp.backgroundcolor,
        leading: IconButton(
          onPressed: (){ 
            Get.back();
            }, 
          icon:const Icon(
            Icons.arrow_back_ios,
            color: ColorApp.primarycolor,),
        ),),
      body: FutureBuilder<Data>(
        future: fetchVaccineDetails(vaccineId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No details found'));
          }

          final data = snapshot.data!;
          return SingleChildScrollView(
  padding: const EdgeInsets.all(25),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Image.asset("images/last.png", height: 200, width: 300, fit: BoxFit.fill),
      ),
      const SizedBox(height: 10),
      Text('اسم اللقاح "${data.vaccineName}"',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Flutter")),
      const SizedBox(height: 10),
      const Text('الوصف العام:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Flutter")),
      const SizedBox(height: 10),
      Text('${data.vaccineDescription}', style: const TextStyle(fontSize: 16, fontFamily: "Flutter")),
      const SizedBox(height: 10),
      const Text('مشاهدة كافة جرعات اللقاح',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Flutter")),
      const SizedBox(height: 10),
      Card(
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("الجرعة", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Flutter")),
                  Text("العمر", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Flutter")),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: data.vaccineDoses!.map((dose) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text('${dose.doseNumber}', style: const TextStyle(fontSize: 16, fontFamily: "Flutter")),
                    )).toList(),
                  ),
                  Column(
                    children: data.vaccineDoses!.map((dose) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text('${dose.vaccineAge}', style: const TextStyle(fontSize: 16, fontFamily: "Flutter")),
                    )).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

        },
      ),
    );
  }

  Future<Data> fetchVaccineDetails(int? id) async {
    final response = await http.get(Uri.parse('http://192.168.43.207:8000/api/StageVaccineDose/$id'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return DescriptionVaccine.fromJson(jsonResponse).data!;
    } else {
      throw Exception('Failed to load vaccine details');
    }
  }
}