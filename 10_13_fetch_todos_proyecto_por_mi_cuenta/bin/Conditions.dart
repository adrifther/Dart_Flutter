void main() {
  print("HELLO WORLD");

  print("Mi amigo Julio tiene 18 años. ¿Es menor de edad? ${esMenorDeEdad(18)}");

  print("ES MENOR DE EDAD Y RUBIO ${esMenorDeEdadYRubio(17, "RUBIO")} ");

  print("El vehiculo que me gusta y su color son: ${vehiculoQueMeGusta("moto","roja")} ");

  print("El color de pelo que me gusta tiene nivel: ${meGusta_Pelo("pelirojo")} ");
}

bool esMenorDeEdad(int edad) {
  if (edad >= 18) {
    return false;
  } else {
    return true;
  }
  // return false; //1º ponemos el return para sacar el error del IDE
}



bool esMenorDeEdadYRubio(int edad, String colorPelo) {
  if (edad < 18 || colorPelo == "RUBIO") {
    return true;
  } else {
    return false;
  }
}

// me gustan los coches rojos o las motos
//color puede ser cualquier color
//vehiculo puede ser coche moto barco


bool vehiculoQueMeGusta(String tipoVehiculo, String colorVehiculo){
  if ( (tipoVehiculo == "moto" && colorVehiculo == "rojo") || tipoVehiculo=="coche"){
    return true;
  }else{
    return false;
  }

}

//PELO MORENO ME GUSTA MUCHO EL RUBIO POCO Y EL PELIRROJO NADA
//DEVUELVO DEL 0 NADA 1 POCO Y 2 MUCHO, EL NIVEOL DE LO QUE ME GUSTA EL PELO QUE ME PASAN
//COLOR PELO PUEDE SER RUBIO MORENO PELIROJO


int meGusta_Pelo(String $color){
  if ($color == "moreno"){
    return 2;
  }
  else if ($color == "pelirojo"){
    return 1;
  }
  else if ($color == "rubio"){
    return 0;
  }
  else{
    return -1;
  }
}

int nivel2(String colorPelo){

  var nivel = -1;

  switch(colorPelo){
    case "PELIROJO":
      nivel = 0;
      break;         //siempre break al final del case
    case "CASTAÑO":  //ambos son nivel 1 (agrupamos)
    case "RUBIO":
      nivel = 1;
      break;
    case "MORENO":
      nivel = 2;
      break;
    default:        // da warning si no se pone default, ponerlo mejor siempre
      nivel = -1;
  }
  return nivel;

}