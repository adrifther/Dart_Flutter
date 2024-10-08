import 'package:clases/modelos/coche.dart';

void main(){

  Coche coche = Coche(modelo:"IBIZA", marca:"SEAT");

  print("${coche.descripcion()}"); //color x defecto rojo

  coche.setModelo ="LEON";
  print("SE HAN REALIZADO ${coche.accesos} cambios en el modelo");

  coche.setModelo ="TOLEDO";
  print("SE HAN REALIZADO ${coche.accesos} cambios en el modelo");
  
}