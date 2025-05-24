class User {
  final String username;
  final String password;

  User({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}

class Child {
  final String name;

  Child({required this.name});

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(name: json['name']);
  }
}