class Coche{
  String marca;
  String modelo;
  String color; //PUEDE SER OPCIONAL
  int? numPuertas; //PUEDE SER OPCIONAL ( "?"   ->  indica nulable)

  int _accesos=0; //la queremos incrementar cada vevz q cambiamos de marca de coche.



  Coche ({required this.marca, required this.modelo, this.color = "ROJO", this.numPuertas});

  String descripcion(){

    return "Este coche es un $marca $modelo y es de color $color";

  }

  set setModelo(String modelo){
    this.modelo = modelo;
    _accesos++;
  }

  get accesos{
    return _accesos;
  }

}