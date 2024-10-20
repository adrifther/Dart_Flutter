import 'package:restapi/models/company.dart';

import 'address.dart';

class User{

  int id;
  String name;
  String username;
  String email;
  Company company;
  Address address;

  //CONTRUCTOR POR DEFECTO QUE INICIALIZA LAS VARIABLES parametros que iniciaizan la clase
  User({required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.company,
    required this.address});

  //oTRO CONSTRUCTOR QUE INICIALIZA MENOS VARIABLES, COGE UN JSON Y DEVLVE USERS.
  // factory: se usa basicamente para leer Json

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      company: Company.fromJson(json["company"]),
      address : Address.fromJson(json["address"])

    );
  }

  @override
  String toString(){
    return "User $name with email $email from ${company.name}";//ejemplo de cuando se ponen brackets
  }

}