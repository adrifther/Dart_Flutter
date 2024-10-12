import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserRepository{


  Future<List<User>>get() async {
    String url = "https://jsonplaceholder.typicode.com/users";

    Uri uri = Uri.parse(url);

    http.Response response = await http.get(
        uri); //espera a q responda la web. uri trata las https

    //  var statusCode = //entre200 y 300 la llamada ha ido bien o menos de 200 o mas de 300 mal
    //ej: si no exiaste url: statusCode 404
    if (response.statusCode <= 200 && response.statusCode < 300) {
      print("llamada success, status code : ${response.statusCode}");
      print("CONTENIDO : ${response.body}");

      List<Map<String, dynamic>> parsedResponse = List.from(jsonDecode(response
          .body)); //json devuelve dynamic. list.from() coge objetos map dynamic devuelve lista


      //Lista de Maps y hacemos map para pasar de un tipo de lista a otro
      List<User> users = parsedResponse.map(
              (element) {
            return User.fromJson(element);
          }).toList();

        return users;

    }else{
      throw Exception("Error de conexion status code: ${response.statusCode}");
    }
   }
  }

