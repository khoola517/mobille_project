class DescriptionVaccine {
  Data? data;

  DescriptionVaccine({this.data});

  DescriptionVaccine.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? vaccineName;
  String? vaccineDescription;
  List<VaccineDoses>? vaccineDoses;

  Data({this.id, this.vaccineName, this.vaccineDescription, this.vaccineDoses});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vaccineName = json['vaccineName'];
    vaccineDescription = json['vaccineDescription'];
    if (json['vaccineDoses'] != null) {
      vaccineDoses = <VaccineDoses>[];
      json['vaccineDoses'].forEach((v) {
        vaccineDoses!.add(new VaccineDoses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vaccineName'] = this.vaccineName;
    data['vaccineDescription'] = this.vaccineDescription;
    if (this.vaccineDoses != null) {
      data['vaccineDoses'] = this.vaccineDoses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VaccineDoses {
  int? id;
  String? doseNumber;
  String? vaccineAge;

  VaccineDoses({this.id, this.doseNumber, this.vaccineAge});

  VaccineDoses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doseNumber = json['doseNumber'];
    vaccineAge = json['vaccineAge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doseNumber'] = this.doseNumber;
    data['vaccineAge'] = this.vaccineAge;
    return data;
  }
}