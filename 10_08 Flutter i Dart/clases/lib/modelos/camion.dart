import 'package:clases/modelos/vehiculo.dart';

class Camion extends Vehiculo{

  int numRuedas;

  Camion({required String marca, required String modelo, this.numRuedas=18})
      :super(marca:marca,modelo:modelo);

}