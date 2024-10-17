import 'dart:convert';

import '../models/show.dart';
import 'package:http/http.dart' as http;

import '../models/episode.dart';
class ShowRepository{

  Future<List<Show>> search(String query) async {

    String url = "https://api.tvmaze.com/search/shows?q=$query";

    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if(response.statusCode >= 200 && response.statusCode<300){

      //response.body contiene la respuesta en formato texto
      //y debemos convertirla List<Map<String,dynamic>>

      List<Map<String,dynamic>>parsedResponse = List.from(jsonDecode(response.body));

      List<Show> shows = parsedResponse.map(
              (element){
                return Show.fromJson(element["show"]);
              }
          ).toList();

      if (shows.isEmpty){
        throw Exception("No hay resultados para tu busqueda");
      }


      return shows;
    }else{
      throw Exception("Ha habido uyn error al conectar con la api: ${response.statusCode}");
    }

  }

  Future<List<Episode>> getEpisodes(String showId) async {

    String url ="https://api.tvmaze.com/shows/$showId/episodes";

    Uri uri = Uri.parse(url);

    var response= await http.get(uri);

    if(response.statusCode >= 200 && response.statusCode < 300){

      //RESPONSE BODY es un String
      List<Map<String,dynamic>> parsedResponse = List.from(jsonDecode(response.body));

     List<Episode> episodes =  parsedResponse.map((e)=>Episode.fromJson(e)).toList();

     if (episodes.isEmpty){
       throw Exception("No se han encontrado capitulos para el id de show indicado");

     }

     return episodes;

    }else{
      throw Exception("Error de conexion: ${response.statusCode}");
    }

    return[];
  }






}