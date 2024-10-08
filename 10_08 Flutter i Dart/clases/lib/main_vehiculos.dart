import 'modelos/camion.dart';
import 'modelos/moto.dart';
import 'modelos/vehiculo.dart';

void main (){

  Camion camion = Camion(marca:"RENAULT", modelo:"A100");
  Moto moto = Moto(marca:"HONDA", modelo:"CBR",cvs:100);

  List<Vehiculo> vehiculos = [moto,camion];

  for(var vehiculo in vehiculos){
    vehiculo.arranca();
    if(vehiculo is Moto){
    print("EL VEHICULO ${vehiculo.modelo} tiene ??? CVS");
    }else{print("EL VEHICULO ${vehiculo.modelo} no tiene info de CVS");}
  }

}