

import 'dart:io';

import 'package:tvmaze/repositories/show_repository.dart';

import 'models/episode.dart';
import 'models/show.dart';

Future<void> main() async {
  //pedimos q usuario pònga texto

  String? result = "-1";

  while (result != "3") {
    showMenu();
    //leemos input de usuario
    result = stdin.readLineSync(); //lee string nulable


    switch (result) {
    //buscar series
      case "1":
        await searchShow();
        break;
    //Listar episodios de una serie
      case "2":
        await listEpisodes();
        break;
      case "3":
        print("saliendo");
      default:
        print("funcion desconocida");
    }
  }
}

Future<void> searchShow() async {
  print("Introduce un termino de busqueda");

  String? searchTerm = stdin.readLineSync(); // lee string nulable por eso String?.

  try{
    List <Show> shows = await ShowRepository().search(searchTerm ?? ""); //"searchTerm!"para garantizar que no es null search term pero se evita. es mejor poner ?? "" para que tome la alternativa "" si es null.

    for(var show in shows){
      print("[${show.id}] ${show.name}");
    }

  }catch(e){
    print("Error: $e");
  }

}


Future<void> listEpisodes() async {
  print("introduce el id de una serie");

  String? showId = stdin.readLineSync();

  try{
    //aqui el cuerpo de la funcion
    List<Episode> episodes = await ShowRepository().getEpisodes(showId ?? "0");

    for(var episode in episodes){

      print("${episode.name}");
      print("${episode.summary}");
      print("------------------");
    }

  }catch(e){
    print("Error $e");
  }

}


void showMenu(){

  print("selecciona una opcion");
  print("1 buscar series");
  print("2.listar episodeos de una serie");
  print("3.salir");


}