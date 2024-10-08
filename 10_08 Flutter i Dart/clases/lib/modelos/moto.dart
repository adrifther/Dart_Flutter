//import 'package:clases/modelos/vehiculo.dart'; //quan son externs millor aixi
  import 'vehiculo.dart'; //millor aixi per saber q no es un package extern

class Moto extends Vehiculo{

  int cvs; //cavallos

  Moto({required String marca, required String modelo, required this.cvs})
      :super(marca: marca, modelo: modelo);

  @override
  void arranca(){
    print("BIIII BIIIII");
  }

}