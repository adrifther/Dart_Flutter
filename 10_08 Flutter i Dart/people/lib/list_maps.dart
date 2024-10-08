import 'package:people/helpers.dart';

void main(){
   List<Map<String,dynamic>> dataset = createDataSet(1000);

  //CREAR UNA LISTA CON LOS NOMBRES (String) DE LOS USUARIOS
  //MAYORES DE 25 AÑOS --->OBJETIVO: UNA List<String>

  //1o filtramos --> where
   List<Map<String,dynamic>> filteredOver25 = dataset.where((element)=>element["age"]>25).toList();

   List<String> namesOver25 = filteredOver25.map((element)=>element["name"] as String).toList();

   print("NAMES OVER 25 ARE:$namesOver25");

   // MOSTRAR LAS EDADES DE LOS USUARIOS QUE COMIENZAN CON EL TEXTO DADO


print(getAgesFor(dataset, "A"));

var resultado_maps_filtrado=(getAgesWithInfo(dataset, "ui", 5));

print("resultado_maps_filtrado = $resultado_maps_filtrado");

}

List<int> getAgesFor(List<Map<String,dynamic>> dataset, String prefix){

   //filtramos MAPs cuyo nombre empieza por prefix
   List<Map<String,dynamic>> dataset_modificado = dataset
            .where((element)=>(element["name"] as String).startsWith(prefix)).toList();

   //Convertimos de list<map> a list <int>
   List<int>lista_dataset = dataset_modificado.map((element)=>element["age"] as int).toList();

   return lista_dataset;

}

//USUARIOS CUYO NOMBRE CONTENGA part en su name o surname y con edad minima minAge.
// el resultado debe ser un listado de objetos del  tipo:
/*
   [
      {
         "firstName":"lola",
         "age":34,
         "is_woman": true/false
       },
      {
         "firstName":"lola",
         "age":34,
         "is_woman": true/false
      }
   ]
    */
List<Map<String,dynamic>> getAgesWithInfo(List<Map<String,dynamic>> dataset, String part, int minAge){

   List<Map<String,dynamic>> dataset_filtrado = dataset
       .where((element)=>((element["name"] as String).contains(part) ||
       (element["surname"] as String).contains(part)) &&
       (element["age"]>=minAge)).toList();

   List<Map<String,dynamic>> result = dataset_filtrado.map((element){
      return {
         "firstName":element["name"],
         "age":element["age"],
         "is_woman": element["gender"] == "F" ? true : false
      };
   }

   ).toList();

   return result;

}