class ResetPassword {
  String? oldPassword;
  String? password;
  String? passwordConfirmation;

  ResetPassword({this.oldPassword, this.password, this.passwordConfirmation});

  ResetPassword.fromJson(Map<String, dynamic> json) {
    oldPassword = json['old_password'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    return {
      'old_password': oldPassword,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}




// class ResetPasswordModel {
//   String? oldPassword;
//   String? password;
//   String? passwordConfirmation;

//   ResetPasswordModel({this.oldPassword, this.password, this.passwordConfirmation});

//   Map<String, dynamic> toJson() {
//     return {
//       'old_password': oldPassword,
//       'password': password,
//       'password_confirmation': passwordConfirmation,
//     };
//   }
// }



// class reset_password {
//   String? oldPassword;
//   String? password;
//   String? passwordConfirmation;

//   reset_password({this.oldPassword, this.password, this.passwordConfirmation});

//   reset_password.fromJson(Map<String, dynamic> json) {
//     oldPassword = json['old_password'];
//     password = json['password'];
//     passwordConfirmation = json['password_confirmation'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['old_password'] = this.oldPassword;
//     data['password'] = this.password;
//     data['password_confirmation'] = this.passwordConfirmation;
//     return data;
//   }
// }