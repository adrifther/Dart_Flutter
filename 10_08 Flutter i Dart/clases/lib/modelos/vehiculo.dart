class Vehiculo{

  String marca;
  String modelo;

  Vehiculo({required this.marca, required this.modelo});

  void arranca(){
    print("BRUM BRUM! de vehiculo");
  }

  void corre(){
    print("FIU! FIU!");
  }

}