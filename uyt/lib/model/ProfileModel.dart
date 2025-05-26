class ProfileModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
 
  ProfileModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'email': email,
      
    };
  }
}
