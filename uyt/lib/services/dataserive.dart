import 'package:http/http.dart' as http;
import 'package:uyt/model/apidata_model.dart';

class DataSerive {
  var url =Uri.parse("https://jsonplaceholder.typicode.com/posts");
  Future<List<Api>>getposts()async{
    var response=await http.get(url);
    return apiFromJson(response.body);

  }
}