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


