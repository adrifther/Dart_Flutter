void main(){

  List<String> heroes = ["Superman","Batman","Spidey"];

  // UN OUTPUT DONDE QUEREMOS TODOS LOS ELEMENTOS EN MAYUSCULAS


  //map obre i tanca parentesi. agafa una funcio.
  var heroesUpperCase = heroes.map(
      (String element){
        return element.toUpperCase();
      }
  );

  print("heroesUpperCase $heroesUpperCase");


  List<int> ages = [10,34,56,9,34,78,18];

  // DEVOLVAMOS UNA LISTA DEL TIPO

  // ["UNDERAGE","OVERAGE","OVERAGE"...]

  var esMayor = ages.map(
      (int element){
        if (element < 18) {
          return "UNDERAGE";
        }else{
          return "OVERAGE";
        }
      }
  );

  print("es Mayor? $esMayor");


}