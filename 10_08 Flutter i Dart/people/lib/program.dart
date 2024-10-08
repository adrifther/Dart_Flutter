import 'dart:io';

import 'package:people/helpers.dart';
/*
1. Crear dataset
2. MIENTRAS EL USUARIO NO ESCRIBA SALIR SEGUIR PREGUNTANDO
3. PREGUNTAR UN NOMBRE AL USUARIO
4. COMPROBAR SI EL NOMBRE EXISTE EN EL DATASET
5. SI EXISTE DEVOLVER LA INFO: NOMBRE, APELLIDOS Y EDAD
6. SI NO EXISTE PREGUNTAR OTRO NOMBRE
 */

void main(){

List<Map<String,dynamic>> dataset = createDataSet(1000);

  //     ? -> string nullable, RESULT PUEDE SER NULL
  String ? result = "";

  while(result!="salir"){
    print("Escribe un nombre para que busque si existe");
    result = stdin.readLineSync();
    //espera entrada de usuario en teclado


//COMPROBAR SI EXISTE UN USER CON ESE NOMBRE
   var usersFound = dataset.where((element) => element["name"].toLowerCase() == result?.toLowerCase());

   if(usersFound.isEmpty){
     print("LO SIENTO, INTRODUCE OTRO NOMBRE");
   }else{
     print("Hay ${usersFound.length} usuarios que se llaman $result");
     print("Son los siguientes:");
     for(var userFound in usersFound){
       print("Nombre: ${userFound["name"]} Apellido: ${userFound["surname"]} Edad: ${userFound["age"]}");

     }
   }

    //SI EXISTE DEVUELVE LA INFO (NOMBRE, APELLIDO, EDAD, GENERO)
    //SI NO EXISTE, ME DISCULPO Y LE PREGUNTO OTRO

  }




}