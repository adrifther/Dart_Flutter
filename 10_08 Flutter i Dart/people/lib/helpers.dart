import 'dart:math';
import 'package:random_name_generator/random_name_generator.dart';

List<Map<String,dynamic>> createDataSet(int maxUsers){

  var randomNames = RandomNames(Zone.catalonia);

                                                         //funcion anonima index
  List<Map<String,dynamic>> generatedList = List.generate(maxUsers,(index){


    String name = "";
    String gender = "";
  //ternaria
//<condicion>
  //String name = index.isEven ? randomNames.manName()  :  randomNames.womanName();
    //String gender = index.isEven ? "M" : "F";
    if (index.isEven){
      name=randomNames.manName();
      gender = "M";
    }else{
      name = randomNames.womanName();
      gender ="F";
    }

    return {
      "id":index,
      "name":randomNames.name(),
      "surname":randomNames.surname(),
      "age":Random().nextInt(75)+5, //de 5 a 80
      "gender":gender // o
    };


  });


  return generatedList;
}