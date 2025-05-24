class  StagesWithVaccine{
  String? stageName;
  int? startAge;
  int? endAge;
  List<Vaccines>? vaccines;

  StagesWithVaccine(
      {this.stageName, this.startAge, this.endAge, this.vaccines});

  StagesWithVaccine.fromJson(Map<String, dynamic> json) {
    stageName = json['stage_name'];
    startAge = json['start_age'];
    endAge = json['end_age'];
    if (json['vaccines'] != null) {
      vaccines = <Vaccines>[];
      json['vaccines'].forEach((v) {
        vaccines!.add(new Vaccines.fromJson(v));
      });
    }
  }
}

class Vaccines {
  int? vaccineId;
  String? vaccineName;
  String? description;
  String? doseNumber;

  Vaccines(
      {this.vaccineId, this.vaccineName, this.description, this.doseNumber});

  Vaccines.fromJson(Map<String, dynamic> json) {
    vaccineId = json['vaccine_id'];
    vaccineName = json['vaccine_name'];
    description = json['description'];
    doseNumber = json['dose_number'];
  }
}