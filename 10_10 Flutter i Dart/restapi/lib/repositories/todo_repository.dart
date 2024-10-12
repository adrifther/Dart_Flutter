import "dart:convert";

import "package:restapi/models/todo.dart";
import "package:http/http.dart" as http;

import "../constants.dart";
class TodoRepository {

  //Aqui anirien les propietats pero no en té.


  Future<List<dynamic>> get() async {
    var url = "https://jsonplaceholder.typicode.com/todos";

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      //mi respuesta esta en el body
      //transformamos respuesta string a map <String,Dynamic>

      List<Map<String, dynamic>> parsedResponse = List.from(
          jsonDecode(response.body));

      //tenemos el formato map

      List<Todo> todos = parsedResponse.map(
              (element) {
            return Todo.fromJson(element);
          }

      ).toList();

      return todos;
    }else{
      throw Exception("error");
    }
  }


  Future<Todo> getDetail(int id) async {
    var url = "$kBaseUrl/todos/$id";

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if(response.statusCode>= 200 && response.statusCode<300){

      Map<String,dynamic> parsedResponse = jsonDecode(response.body);//tenemos el objeto Map con el id specificado

      return Todo.fromJson(parsedResponse);

    }else{
      throw Exception("Error leyendo el todo $id");
    }

  }




}