import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:uyt/core/constant/color.dart';
import 'package:uyt/model/DescriptionVaccine.dart';
import 'package:uyt/model/DetailesVaccine.dart';

class VaccineDetailView extends StatelessWidget {
  final int? vaccineId;

  VaccineDetailView({this.vaccineId});
  final controller = Get.put(DetailesVaccine());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(' تفاصيل اللقاح',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Flutter")),
        backgroundColor: ColorApp.backgroundcolor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorApp.primarycolor,
          ),
        ),
      ),
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
                  child: Image.asset("images/last.png",
                      height: 200, width: 300, fit: BoxFit.fill),
                ),
                const SizedBox(height: 10),
                Text('اسم اللقاح "${data.vaccineName}"',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Flutter")),
                const SizedBox(height: 10),
                const Text('الوصف العام:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Flutter")),
                const SizedBox(height: 10),
                Text('${data.vaccineDescription}',
                    style:
                        const TextStyle(fontSize: 16, fontFamily: "Flutter")),
                const SizedBox(height: 10),
                const Text('مشاهدة كافة جرعات اللقاح',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Flutter")),
                const SizedBox(height: 10),
                Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  "الجرعة",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Flutter",
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  "العمر",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Flutter",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // ✅ هنا لكل جرعة + عمر، صف خاص
                        ...data.vaccineDoses!.map((dose) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${dose.doseNumber}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Flutter",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${dose.vaccineAge}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Flutter",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(), // ✅ خط فاصل بين كل صف
                            ],
                          );
                        }).toList(),
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
    final response = await http
        .get(Uri.parse('http://192.168.1.100:8000/api/StageVaccineDose/$id'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return DescriptionVaccine.fromJson(jsonResponse).data!;
    } else {
      throw Exception('Failed to load vaccine details');
    }
  }
}
