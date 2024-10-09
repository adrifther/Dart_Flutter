/*
Sobre el proyecto de vehiculos:
1. Añadir la propiedad "color" a Vehiculo para que la hereden coche y moto. CHECK!

2. Construir un dataset aleatorio de vehiculos.
Para ello crearemos motos o coches aleatoriamente y las marcas, modelos y colores las tomaremos de forma random de los siguientes lists:
List<String> marcas = ["HONDA","SUZUKI","PEUGEOT","YAMAHA"]
List<String> modelos = ["A100","B400","B300","C450"]
List<String> colores = ["ROJO","AMARILLO","VERDE","AZUL"]
Para tomar de forma random un elemento de la lista marcas, por ejemplo,
haremos marcas[Random.nextInt(marcas.length)]
3.  En el dataset:
       3.1 Filtrar los vehiculos de color rojo que sean motos
       3.1 Filtrar los vehiculos de la marca suzuki de color amarillo
 */

import 'dart:math';

import 'modelos/camion.dart';
import 'modelos/moto.dart';
import 'modelos/vehiculo.dart';

List<String> marcas = ["HONDA","SUZUKI","PEUGEOT","YAMAHA"];
List<String> modelos = ["A100","B400","B300","C450"];
List<String> colores = ["ROJO","AMARILLO","VERDE","AZUL"];

void main(){
    List<Vehiculo> dataset = createDataSet(100);



    //      3.1 Filtrar los vehiculos de color rojo que sean motos

    List<Vehiculo> motosRojas = dataset.where((element){
      return element.color == "ROJO" && element is Moto;
      //RETURN BOOL
    }).toList();

    //        3.2 Filtrar los vehiculos de la marca suzuki de color amarillo

    List<Vehiculo> suzukiAmarillos = dataset.where(
        (element){
          return element.color == "AMARILLO" && element.marca == "SUZUKI";
          //RETURN BOOL
        }
    ).toList();



    for(var vehiculo in suzukiAmarillos){

      var tipo = (vehiculo is Moto) ? "Moto" : "Camión" ;

      print("$tipo ${vehiculo.marca} ${vehiculo.modelo} de color ${vehiculo.color}");

    }



}

List<Vehiculo> createDataSet(int maxVehiculos){

  List<Vehiculo> vehiculos = [];

  vehiculos = List.generate(maxVehiculos,(index){

    if(Random().nextInt(100).isEven) {
      return Moto(
          marca: marcas[Random().nextInt(marcas.length)],
          modelo: modelos[Random().nextInt(modelos.length)],
          color: colores[Random().nextInt(colores.length)],
          cvs: 100);
    }else{
      return Camion(
          marca: marcas[Random().nextInt(marcas.length)],
          modelo: modelos[Random().nextInt(modelos.length)],
          color: colores[Random().nextInt(colores.length)]);
    }

  });

  return vehiculos;
}


