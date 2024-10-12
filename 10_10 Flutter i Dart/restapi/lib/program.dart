import 'dart:io';

import 'package:restapi/repositories/todo_repository.dart';

import 'models/todo.dart';
import 'restapi.dart';

Future<void> main() async {

  var result="0";

  while(result !="4"){
    showMenu();
    var result = stdin.readLineSync();

    switch(result){

      case "1":
        await showToDos();
        break;

      case "2":
        print("selecciona id de ToDo:");
        await checkSingleToDo();
        break;

      case "3":
        print("viendo un listado de ToDos pendientes");

      default:
        print("opción desconocida, selecciona otra opción");

    }
  }
  print("RESULT IS: $result");

}

Future<void> checkSingleToDo() async {
  print("¿cual quieres ver, introduce id:");

  var result = stdin.readLineSync(); //esto puede dar null

  //Elimino la posibilidad de que sea null result
  result ??= "0"; //result = result ?? "0" quiere deecir si es null devuelve "0"

  //convertir a int el result que tengo en formato texto

  int? intResult = int.tryParse(result); //como si ponemos cebolla como result

  if (intResult != null) {
    try{Todo todo = await TodoRepository().getDetail(intResult);
    print("El TODO SOLICITADO CON ID $intResult es ${todo.title}");
   }catch(e){
  print("ERROR, LA PETICION NO HA PODIDO REALIZARSE: $e");
    }
 }else{
  print("Opcion incorrecta");
}
  // por ejemplo leeré 23

  var todo = await TodoRepository().getDetail(result);

}

void showMenu(){
  print("1. Ver listado de todos los ToDos");
  print("2. Ver un ToDo concreto");
  print("3. Ver listado de ToDos pendients");
  print("4. Salir");
}