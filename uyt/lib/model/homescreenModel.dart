import 'package:flutter/material.dart';
class HomeScreen {
  User? user;
  List<Children>? children;
  List<NotificationModel>? notifications;

  HomeScreen({this.user, this.children, this.notifications});

  HomeScreen.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;

    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }

   if (json['notifications'] != null) {
  notifications = <NotificationModel>[];
  json['notifications'].forEach((v) {
    notifications!.add(NotificationModel.fromJson(v));
  });
}

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    if (notifications != null) {
      data['notifications'] = notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? phoneNumber;
  String? identityCardNumber;
  int? isDeceased;
  int? locationId;

  User({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phoneNumber,
    this.identityCardNumber,
    this.isDeceased,
    this.locationId,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    identityCardNumber = json['identity_card_number'];
    isDeceased = json['isDeceased'];
    locationId = json['location_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'email': email,
      'phone_number': phoneNumber,
      'identity_card_number': identityCardNumber,
      'isDeceased': isDeceased,
      'location_id': locationId,
    };
  }
}

class Children {
  int? id;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? gender;
  String? vaccineCardNumber;
  int? hasSpecailCase;
  String? birthCertificateNumber;
  String? birthCertificateType;
  String? birthCertifiacteImage;
  int? nationalitiesId;
  int? fathersId;
  int? mothersId;
  String? createdAt;
  String? updatedAt;
  int? countriesId;
  int? foreingBirthCountryId;
  int? healthCentersId;

  Children({
    this.id,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.gender,
    this.vaccineCardNumber,
    this.hasSpecailCase,
    this.birthCertificateNumber,
    this.birthCertificateType,
    this.birthCertifiacteImage,
    this.nationalitiesId,
    this.fathersId,
    this.mothersId,
    this.createdAt,
    this.updatedAt,
    this.countriesId,
    this.foreingBirthCountryId,
    this.healthCentersId,
  });

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    vaccineCardNumber = json['vaccine_card_number'];
    hasSpecailCase = json['has_specail_case'];
    birthCertificateNumber = json['birth_certificate_number'];
    birthCertificateType = json['birth_certificate_type'];
    birthCertifiacteImage = json['birth_certifiacte_image'];
    nationalitiesId = json['nationalities_id'];
    fathersId = json['fathers_id'];
    mothersId = json['mothers_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    countriesId = json['countries_id'];
    foreingBirthCountryId = json['foreing_birth_country_id'];
    healthCentersId = json['health_centers_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'birth_date': birthDate,
      'gender': gender,
      'vaccine_card_number': vaccineCardNumber,
      'has_specail_case': hasSpecailCase,
      'birth_certificate_number': birthCertificateNumber,
      'birth_certificate_type': birthCertificateType,
      'birth_certifiacte_image': birthCertifiacteImage,
      'nationalities_id': nationalitiesId,
      'fathers_id': fathersId,
      'mothers_id': mothersId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'countries_id': countriesId,
      'foreing_birth_country_id': foreingBirthCountryId,
      'health_centers_id': healthCentersId,
    };
  }
}

class NotificationModel {
  String? message;

  NotificationModel({this.message});

  NotificationModel.fromJson(Map<String, dynamic> json) {
  message = json['message'];
}

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}

