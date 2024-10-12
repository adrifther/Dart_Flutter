import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restapi/repositories/user_repository.dart';
import 'models/user.dart';

Future<void> main() async {
  print("vamos a leer usuarios");

  List<User> users = await UserRepository().get();

  try{
    List<User> users = await UserRepository().get();
    print("NUM USERS ARE: ${users.length}");
    for(var user in users){
      print(user.toString());
    }
    print("Users fetch success");
  }catch(e){
  print("Ha habido un error al obtener los usuarios: $e"); //e de excepcion o error.
  }//QUEREMOS SABER SI SE HA IMPORTADO BIEN
}


//async no espera a ser llamada para responder, ella va devolviendo cosas.
Future<void> fetchToDos() async { //async convierte a funcion asincrona

  String url = "https://jsonplaceholder.typicode.com/todos";

  Uri uri = Uri.parse(url);//acepta objeto uri como argumento

  http.Response response= await http.get(uri); //espera a q responda la web

  //  var statusCode = //entre200 y 300 la llamada ha ido bien o menos de 200 o mas de 300 mal
  //ej: si no exiaste url: statusCode 404
  if(response.statusCode<= 200 && response.statusCode< 300){
    print("llamada success, status code : ${response.statusCode}");
    print("CONTENIDO : ${response.body}");
    
    List<Map<String,dynamic>> parsedResponse = List.from(jsonDecode(response.body)); //json devuelve dynamic. list.from() coge objetos map dynamic devuelve lista

    for(var element in parsedResponse){
      print("ID is: ${element["id"]}");
    }


  }else{
    print("llamada ERROR, status code : ${response.statusCode}");
  }

}





//async no espera a ser llamada para responder, ella va devolviendo cosas.
Future<void> showToDos() async { //async convierte a funcion asincrona

  String url = "https://jsonplaceholder.typicode.com/todos";

  Uri uri = Uri.parse(url);//acepta objeto uri como argumento

  http.Response response= await http.get(uri); //espera a q responda la web

  if(response.statusCode<= 200 && response.statusCode< 300){
    print("llamada success, status code : ${response.statusCode}");
    print("CONTENIDO : ${response.body}");

    List<Map<String,dynamic>> parsedResponse = List.from(jsonDecode(response.body)); //json devuelve dynamic. list.from() coge objetos map dynamic devuelve lista

    for(var element in parsedResponse){
      print(element);
    }


  }else{
    print("llamada ERROR, status code : ${response.statusCode}");
  }

}

Future<void> showToDo(int id_ToDo) async { //async convierte a funcion asincrona

  String url = "https://jsonplaceholder.typicode.com/todos";

  Uri uri = Uri.parse(url);//acepta objeto uri como argumento

  http.Response response= await http.get(uri); //espera a q responda la web

  //  var statusCode = //entre200 y 300 la llamada ha ido bien o menos de 200 o mas de 300 mal
  //ej: si no exiaste url: statusCode 404
  if(response.statusCode<= 200 && response.statusCode< 300){
    print("llamada success, status code : ${response.statusCode}");
    print("CONTENIDO : ${response.body}");

    List<Map<String,dynamic>> parsedResponse = List.from(jsonDecode(response.body)); //json devuelve dynamic. list.from() coge objetos map dynamic devuelve lista

    for(var element in parsedResponse){
      print(element.where;
    }


  }else{
    print("llamada ERROR, status code : ${response.statusCode}");
  }

}