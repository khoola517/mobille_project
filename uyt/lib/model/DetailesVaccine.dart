
class DetailesVaccine {
  String? stageName;
  int? startAge;
  int? endAge;
  List<Vaccines>? vaccines;

  DetailesVaccine({this.stageName, this.startAge, this.endAge, this.vaccines});

  factory DetailesVaccine.fromJson(Map<String, dynamic> json) {
    List<Vaccines>? vaccineList;
    if (json['vaccines'] is List) {
      try {
        vaccineList = (json['vaccines'] as List)
            .map((v) => Vaccines.fromJson(v))
            .toList();
      } catch (e) {
        print("Error parsing vaccines list: $e");
        vaccineList = [];
      }
    }

    return DetailesVaccine(
      stageName: json['stage_name']?.toString(),
      //startAge: int.tryParse(json['start_age']?.toString() ?? ''),
      //endAge: int.tryParse(json['end_age']?.toString() ?? ''),
      vaccines: vaccineList,
    );
  }
}

class Vaccines {
  int? vaccineId;
  String? vaccineName;
  String? description;
  String? doseNumber;

  Vaccines({this.vaccineId, this.vaccineName, this.description, this.doseNumber});

  factory Vaccines.fromJson(Map<String, dynamic> json) {
    return Vaccines(
      vaccineId: int.tryParse(json['vaccine_id']?.toString() ?? ''),
      vaccineName: json['vaccine_name']?.toString(),
      description: json['description']?.toString(),
      doseNumber: json['dose_number']?.toString(),
    );
  }

}

// class DetailesVaccine {
//   String? stageName;
//   int? startAge;
//   int? endAge;
//   List<Vaccines>? vaccines;

//   DetailesVaccine({this.stageName, this.startAge, this.endAge, this.vaccines});

//   factory DetailesVaccine.fromJson(Map<String, dynamic> json) {
//     List<Vaccines>? vaccineList;
//     if (json['vaccines'] is List) {
//       try {
//         vaccineList = (json['vaccines'] as List)
//             .map((v) => Vaccines.fromJson(v))
//             .toList();
//       } catch (e) {
//         print("Error parsing vaccines list: $e");
//         vaccineList = [];
//       }
//     }

//     return DetailesVaccine(
//       stageName: json['stage_name']?.toString(),
//       startAge: int.tryParse(json['start_age']?.toString() ?? ''),
//       endAge: int.tryParse(json['end_age']?.toString() ?? ''),
//       vaccines: vaccineList,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'stage_name': stageName,
//         'start_age': startAge,
//         'end_age': endAge,
//         'vaccines': vaccines?.map((v) => v.toJson()).toList(),
//       };
// }

// class Vaccines {
//   int? vaccineId;
//   String? vaccineName;
//   String? description;
//   String? doseNumber;

//   Vaccines({this.vaccineId, this.vaccineName, this.description, this.doseNumber});

//   factory Vaccines.fromJson(Map<String, dynamic> json) {
//     return Vaccines(
//       vaccineId: int.tryParse(json['vaccine_id']?.toString() ?? ''),
//       vaccineName: json['vaccine_name']?.toString(),
//       description: json['description']?.toString(),
//       doseNumber: json['dose_number']?.toString(),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'vaccine_id': vaccineId,
//         'vaccine_name': vaccineName,
//         'description': description,
//         'dose_number': doseNumber,
//       };
// }





// class DetailesVaccine {
//   String? stageName;
//   int? startAge;
//   int? endAge;
//   List<Vaccines>? vaccines;

//   DetailesVaccine({this.stageName, this.startAge, this.endAge, this.vaccines});

//   DetailesVaccine.fromJson(Map<String, dynamic> json) {
//     stageName = json['stage_name'];
//     startAge = json['start_age'];
//     endAge = json['end_age'];
//     if (json['vaccines'] != null) {
//       vaccines = <Vaccines>[];
//       json['vaccines'].forEach((v) {
//         vaccines!.add(new Vaccines.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['stage_name'] = this.stageName;
//     data['start_age'] = this.startAge;
//     data['end_age'] = this.endAge;
//     if (this.vaccines != null) {
//       data['vaccines'] = this.vaccines!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Vaccines {
//   int? vaccineId;
//   String? vaccineName;
//   String? description;
//   String? doseNumber;

//   Vaccines(
//       {this.vaccineId, this.vaccineName, this.description, this.doseNumber});

//   Vaccines.fromJson(Map<String, dynamic> json) {
//     vaccineId = json['vaccine_id'];
//     vaccineName = json['vaccine_name'];
//     description = json['description'];
//     doseNumber = json['dose_number'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['vaccine_id'] = this.vaccineId;
//     data['vaccine_name'] = this.vaccineName;
//     data['description'] = this.description;
//     data['dose_number'] = this.doseNumber;
//     return data;
//   }
// }