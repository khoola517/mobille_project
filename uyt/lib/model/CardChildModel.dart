class CardChildModel {
  ChildDetails? childDetails;
  List<CardDetails>? cardDetails;

  CardChildModel({this.childDetails, this.cardDetails});

  CardChildModel.fromJson(Map<String, dynamic> json) {
    childDetails = json['childDetails'] != null
        ? new ChildDetails.fromJson(json['childDetails'])
        : null;
    if (json['cardDetails'] != null) {
      cardDetails = <CardDetails>[];
      json['cardDetails'].forEach((v) {
        cardDetails!.add(new CardDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.childDetails != null) {
      data['childDetails'] = this.childDetails!.toJson();
    }
    if (this.cardDetails != null) {
      data['cardDetails'] = this.cardDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildDetails {
  String? name;
  String? birthDate;
  String? cardNumber;
  String? childAge;

  ChildDetails({this.name, this.birthDate, this.cardNumber, this.childAge});

  ChildDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    birthDate = json['birthDate'];
    cardNumber = json['cardNumber'];
    childAge = json['childAge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['birthDate'] = this.birthDate;
    data['cardNumber'] = this.cardNumber;
    data['childAge'] = this.childAge;
    return data;
  }
}

class CardDetails {
  String? stageName;
  List<Doses>? doses;

  CardDetails({this.stageName, this.doses});

  CardDetails.fromJson(Map<String, dynamic> json) {
    stageName = json['stageName'];
    if (json['Doses'] != null) {
      doses = <Doses>[];
      json['Doses'].forEach((v) {
        doses!.add(new Doses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stageName'] = this.stageName;
    if (this.doses != null) {
      data['Doses'] = this.doses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doses {
  String? vaccineName;
  String? doseNumber;
  String? vaccinationDate;
  String? lastDateForVaccination;

  Doses(
      {this.vaccineName,
      this.doseNumber,
      this.vaccinationDate,
      this.lastDateForVaccination});

  Doses.fromJson(Map<String, dynamic> json) {
    vaccineName = json['vaccineName'];
    doseNumber = json['doseNumber'];
    vaccinationDate = json['vaccinationDate'];
    lastDateForVaccination = json['lastDateForVaccination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vaccineName'] = this.vaccineName;
    data['doseNumber'] = this.doseNumber;
    data['vaccinationDate'] = this.vaccinationDate;
    data['lastDateForVaccination'] = this.lastDateForVaccination;
    return data;
  }
}