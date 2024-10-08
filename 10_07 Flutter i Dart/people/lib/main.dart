import 'package:people/helpers.dart'; //
import 'helpers.dart'; //son lo mismo pero este da menos problema

void main(){
 print("HELLO WORLD");

 List<Map<String,dynamic>> dataset = createDataSet(20);

 print("DATA SET IS: $dataset");


 // ASEGURARNOS QUE HAY 50% HOMBRES Y MUJERES
 //metodo1: bucle contar cuantas F y cuantos M en el dataset
 var ms=0;
 var fs=0;
 for(var user in dataset){
  //SI USER GENDER ES M, INCREMENTAMOS LAS Ms y si no las Fs.
  user["gender"] == "M" ? ms++ : fs++; //user["gender"] if "M" -> suma a ms, if not suma fs

 }

 print("EL DATASET TIENE $ms hombres y $fs mujeres");

 var males = dataset.where((element) => element["gender"] == "M");
 var females = dataset.where((element) => element["gender"] == "F");

 var nMales = males.length;
 var nFemales = females.length;
 print("EL DATASET TIENE $nMales hombres y $nFemales mujeres");

 //BUSCAR EL NOMBRE MAS LARGO DE MUJER MAYOR A 21 QUE HAYA EN LA LISTA.

 var femalesOver21 = dataset.where((element) => (element["gender"] == "F" && element["age"]>21));

var longestName = "";

for (var female in femalesOver21){
 if((female["name"] as String).length >longestName.length){
   longestName=female["name"];
    }
   }


print("El nombre mas largo es $longestName");




 }
