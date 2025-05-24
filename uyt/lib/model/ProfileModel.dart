class ProfileModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
 // List<Location>? location;

  ProfileModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    //this.location,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      // location: (json['location'] as List<dynamic>?)
      //     ?.map((v) => Location.fromJson(v))
      //     .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'email': email,
      //'location': location?.map((v) => v.toJson()).toList(),
    };
  }
}
// class ProfileModel {
//   Person? person;
//   List<Location>? location;

//   ProfileModel({this.person, this.location});

//   factory ProfileModel.fromJson(Map<String, dynamic> json) {
//     return ProfileModel(
//       person: json['person'] != null ? Person.fromJson(json['person']) : null,
//       location: json['location'] != null
//           ? List<Location>.from(
//               json['location'].map((x) => Location.fromJson(x)))
//           : [],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'person': person?.toJson(),
//       'location': location?.map((x) => x.toJson()).toList(),
//     };
//   }
// }

// class Person {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? gender;
//   String? email;
//   String? phoneNumber;
//   String? identityCardNumber;
//   int? isDeceased;
//   int? nationalitiesId;
//   int? locationId;
//   String? createdAt;
//   String? updatedAt;

//   Person({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.gender,
//     this.email,
//     this.phoneNumber,
//     this.identityCardNumber,
//     this.isDeceased,
//     this.nationalitiesId,
//     this.locationId,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory Person.fromJson(Map<String, dynamic> json) {
//     return Person(
//       id: json['id'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       firstName: json['first_name'] ?? json['firstName'],
//       lastName: json['last_name'],
//       gender: json['gender'],
//       email: json['email'],
//       phoneNumber: json['phone_number'],
//       identityCardNumber: json['identity_card_number'],
//       isDeceased: json['isDeceased'],
//       nationalitiesId: json['nationalities_id'],
//       locationId: json['location_id'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//       'first_name': firstName,
//       'last_name': lastName,
//       'gender': gender,
//       'email': email,
//       'phone_number': phoneNumber,
//       'identity_card_number': identityCardNumber,
//       'isDeceased': isDeceased,
//       'nationalities_id': nationalitiesId,
//       'location_id': locationId,
//     };
//   }
// }

// class Location {
//   int? id;
//   String? cityName;
//   String? areaName;
//   String? streetName;
//   String? createdAt;
//   String? updatedAt;

//   Location({
//     this.id,
//     this.cityName,
//     this.areaName,
//     this.streetName,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory Location.fromJson(Map<String, dynamic> json) {
//     return Location(
//       id: json['id'],
//       cityName: json['city_name'],
//       areaName: json['area_name'],
//       streetName: json['street_name'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'city_name': cityName,
//       'area_name': areaName,
//       'street_name': streetName,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//     };
//   }
// }


// class ProfileModel {
//   String? firstName;
//   String? lastName;
//   String? phoneNumber;
//   String? email;
//  // List<Location>? location;

//   ProfileModel({
//     this.firstName,
//     this.lastName,
//     this.phoneNumber,
//     this.email,
//     //this.location,
//   });

//   factory ProfileModel.fromJson(Map<String, dynamic> json) {
//     return ProfileModel(
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//       phoneNumber: json['phone_number'],
//       email: json['email'],
//       // location: (json['location'] as List<dynamic>?)
//       //     ?.map((v) => Location.fromJson(v))
//       //     .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'first_name': firstName,
//       'last_name': lastName,
//       'phone_number': phoneNumber,
//       'email': email,
//       //'location': location?.map((v) => v.toJson()).toList(),
//     };
//   }
// }



// // class ProfileModel {
// //   Person? person;
// //   List<Location>? location;

// //   ProfileModel({this.person, this.location});

// //   ProfileModel.fromJson(Map<String, dynamic> json) {
// //     person =
// //         json['person'] != null ? new Person.fromJson(json['person']) : null;
// //     if (json['location'] != null) {
// //       location = <Location>[];
// //       json['location'].forEach((v) {
// //         location!.add(new Location.fromJson(v));
// //       });
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     if (this.person != null) {
// //       data['person'] = this.person!.toJson();
// //     }
// //     if (this.location != null) {
// //       data['location'] = this.location!.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }

// // class Person {
// //   int? id;
// //   String? createdAt;
// //   Null? updatedAt;
// //   String? firstName;
// //   String? lastName;
// //   String? gender;
// //   String? email;
// //   String? phoneNumber;
// //   String? identityCardNumber;
// //   int? isDeceased;
// //   int? nationalitiesId;
// //   int? locationId;

// //   Person(
// //       {this.id,
// //       this.createdAt,
// //       this.updatedAt,
// //       this.firstName,
// //       this.lastName,
// //       this.gender,
// //       this.email,
// //       this.phoneNumber,
// //       this.identityCardNumber,
// //       this.isDeceased,
// //       this.nationalitiesId,
// //       this.locationId});

// //   Person.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //     //firstName = json['first_name'];
// //     firstName = json['firstName'];
// //     //lastName = json['last_name'];
// //     lastName = json['last_name'];
// //     gender = json['gender'];
// //     email = json['email'];
// //     phoneNumber = json['phone_number'];
// //     identityCardNumber = json['identity_card_number'];
// //     isDeceased = json['isDeceased'];
// //     nationalitiesId = json['nationalities_id'];
// //     locationId = json['location_id'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     data['first_name'] = this.firstName;
// //     data['last_name'] = this.lastName;
// //     data['gender'] = this.gender;
// //     data['email'] = this.email;
// //     data['phone_number'] = this.phoneNumber;
// //     data['identity_card_number'] = this.identityCardNumber;
// //     data['isDeceased'] = this.isDeceased;
// //     data['nationalities_id'] = this.nationalitiesId;
// //     data['location_id'] = this.locationId;
// //     return data;
// //   }
// // }

// // class Location {
// //   int? id;
// //   String? cityName;
// //   String? areaName;
// //   String? streetName;
// //   String? createdAt;
// //   Null? updatedAt;

// //   Location(
// //       {this.id,
// //       this.cityName,
// //       this.areaName,
// //       this.streetName,
// //       this.createdAt,
// //       this.updatedAt});

// //   Location.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     cityName = json['city_name'];
// //     areaName = json['area_name'];
// //     streetName = json['street_name'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['city_name'] = this.cityName;
// //     data['area_name'] = this.areaName;
// //     data['street_name'] = this.streetName;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     return data;
// //   }
// // }