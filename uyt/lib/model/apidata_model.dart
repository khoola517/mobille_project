import 'dart:convert';

List<Api> apiFromJson(String str)=>
List<Api>.from(json.decode(str).map((x)=>Api.fromJson(x)));

String apiToJson(List<Api>data)=>
json.encode(List<dynamic>.from(data.map((x)=>x.toJson())));


class Api {
    int? userId;
    int? id;
    String? title;
    String? body;

    Api({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });
    
    factory Api.fromJson(Map<String,dynamic>json)=>Api(
      userId:json ["userId"],
      id:json ["id"],
      title: json["title"],
      body: json["body"],
    );

  get data => null;
Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

