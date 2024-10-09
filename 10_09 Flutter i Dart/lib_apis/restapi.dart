import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/user.dart';

void main(){
  print("HELLO WORLD");

  fetchToDos();

  fetchUsers();

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

fetchUsers() async {

  String url = "https://jsonplaceholder.typicode.com/users";

  Uri uri = Uri.parse(url);

  http.Response response= await http.get(uri); //espera a q responda la web

  //  var statusCode = //entre200 y 300 la llamada ha ido bien o menos de 200 o mas de 300 mal
  //ej: si no exiaste url: statusCode 404
  if(response.statusCode<= 200 && response.statusCode< 300){
    print("llamada success, status code : ${response.statusCode}");
    print("CONTENIDO : ${response.body}");

    List<Map<String,dynamic>> parsedResponse = List.from(jsonDecode(response.body)); //json devuelve dynamic. list.from() coge objetos map dynamic devuelve lista


    //map para pasar de un tipo de lista a otro
    List<User> users = parsedResponse.map(
            (element){
      return User.fromJson(element);


    }).toList();

    for(var user in users){
      print("USERNAME IS ${user.username} and his company is ${user.company.name} and the zip code is ${user.address.zipcode}");
    }

    for(var element in parsedResponse){
      print("User is: ${element["name"]} from company ${element["company"]["name"]}");
    }

  }else{
    print("llamada ERROR, status code : ${response.statusCode}");
  }

}