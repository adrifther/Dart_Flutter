import 'dart:convert';
import 'dart:io'; // No necesitamos 'dart:ffi'

import 'package:http/http.dart' as http; // Importamos el paquete http
import 'models/todo.dart';
import 'repositories/todo_repository.dart'; // Importamos los archivos necesarios

Future<void> main() async {

  var result = "0";

  // Un bucle que mostrará el menú mientras la opción seleccionada no sea '4'
  while(result != "4"){
    showMenu(); // Mostrar menú
    result = stdin.readLineSync() ?? "0"; // Leer la entrada del usuario
    print("RESULT IS: $result");

    // Ejecutar la acción según la opción seleccionada
    switch(result){
      case "1":
        print("SHOW TODOS");
        await showToDos(); // Mostrar todos los ToDos
        break;
      case "2":
        await checkSingleTodo(); // Mostrar un ToDo concreto
        break;
      case "3":
        await fetch_PendingToDos(); // Mostrar solo ToDos pendientes
        break;
      default:
        print("Opción desconocida, selecciona otra opción");
    }
  }
}

Future<void> checkSingleTodo() async {
  // Obtener un ToDo específico por su ID
  print("¿Cuál quieres ver (introduce el id):");

  String? result = stdin.readLineSync(); // Leer la entrada del usuario

  // Eliminar posibilidad de valor null
  result = result ?? "0";

  // Convertir el resultado a un entero
  int? intResult = int.tryParse(result);

  // Si la conversión es exitosa, buscar el ToDo
  if(intResult != null) {
    try {
      Todo todo = await TodoRepository().getDetail(intResult);
      print("EL TODO SOLICITADO CON ID $intResult es ${todo.title}");
    }catch(e){
      print("ERROR, LA PETICIÓN NO HA PODIDO REALIZARSE: $e");
    }
  }else{
    print("Opción incorrecta");
  }
}

Future<void> showToDos() async {
  // Mostrar todos los ToDos
  var todos = await TodoRepository().get();

  print("TODOS LENGTH: ${todos.length}");

  // Imprimir todos los ToDos con su título y estado
  for(var todo in todos){
    print("TODO ${todo.title}   completed : ${todo.completed}");
  }
}

Future<void> show_pending_ToDos() async {
  // Mostrar todos los ToDos
  var todos = await TodoRepository().get();

  print("TODOS LENGTH: ${todos.length}");

  // Imprimir todos los ToDos con su título y estado
  for(var todo in todos){
    if(todo.completed==false){
    print("TODO ${todo.title}   completed : ${todo.completed}");
  }}
}

void showMenu(){
  // Menú simple para la selección de opciones
  print("1. Ver listado de todos los ToDos");
  print("2. Ver un ToDo concreto");
  print("3. Ver listado de ToDos pendientes");
  print("4. Salir");
}

Future<void> fetch_PendingToDos() async {
  // Leer solo los ToDos que no están completados
  String url = "https://jsonplaceholder.typicode.com/todos";

  Uri uri = Uri.parse(url);

  http.Response response = await http.get(uri); // Hacer la petición HTTP

  // Comprobar si la llamada fue exitosa
  if(response.statusCode >= 200 && response.statusCode < 300){
    print("Llamada success, status code : ${response.statusCode}");

    // Decodificar el JSON de la respuesta en una lista de Mapas
    List<Map<String, dynamic>> parsedResponse = List.from(jsonDecode(response.body));

    // Convertir el JSON a una lista de objetos Todo
    List<Todo> todos = parsedResponse.map((element) {
      return Todo.fromJson(element);
    }).toList();

    // Filtrar los ToDos que no están completados
    for(var element in todos){ if(element.completed == false){
      print('Todo pendiente: ID ${element.id}, título: ${element.title} que tiene false en teoria: ${element.completed== false}');
    }
    }


  } else {
    print("Llamada ERROR, status code : ${response.statusCode}");
  }
}