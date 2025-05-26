class IndexModel {
  int? parentId;
  String? parentName;
  List<Children>? children;
  List<NotificationModel>? notifications;

  IndexModel({this.parentId, this.parentName, this.children, this.notifications});

  IndexModel.fromJson(Map<String, dynamic> json) {
    parentId = json['parent_id'];
    parentName = json['Parent Name'];
    
    if (json['Childern'] != null) {
      children = <Children>[];
      json['Childern'].forEach((v) {
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
    data['parent_id'] = parentId;
    data['Parent Name'] = parentName;
    if (children != null) {
      data['Childern'] = children!.map((v) => v.toJson()).toList();
    }
    if (notifications != null) {
      data['notifications'] = notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
  int? iD;
  String? firstName;
  String? gender;
  String? age;
  int? allVaccinations;
  int? completedVaccinations;

  Children({
    this.iD,
    this.firstName,
    this.gender,
    this.age,
    this.allVaccinations,
    this.completedVaccinations,
  });

  Children.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    firstName = json['First Name'];
    gender = json['Gender'];
    age = json['Age'];
    allVaccinations = json['allVaccinations'];
    completedVaccinations = json['completedVaccinations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['ID'] = iD;
    data['First Name'] = firstName;
    data['Gender'] = gender;
    data['Age'] = age;
    data['allVaccinations'] = allVaccinations;
    data['completedVaccinations'] = completedVaccinations;
    return data;
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


