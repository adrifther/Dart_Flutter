

import 'dart:async';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'shows_page.dart';


class LoginPage extends StatefulWidget {


  LoginPage({super.key});

  @override

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showLoader = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(//Scaffold tiene q estar de envolvente de la pantalla. es la pantalla blanca

        body:Container(
          width:double.infinity,
          color: Colors.blueAccent.withOpacity(0.7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //ESPACIO PARA EL LOGO
              Expanded(
                flex:2,
                  child:Center(
                    //si no ponemos el center, ignora el height del container
                    child: Container(
                      height:160,
                      width:300,

                      child: Image.network(
                          logoUrl,
                          fit: BoxFit.fitWidth,
                      alignment: Alignment.center
                        ),
                    ),
                  )
              ),

              //ESPACIO PARA MOSTRAR EL CARGANDO
              Expanded(
                flex:6,
                child: _showLoader ? Container(
                  alignment: Alignment.center,

                  child: CircularProgressIndicator(),

                ) : SizedBox()
              ),

              //ESPACIO PARA BOTON LOGIN
              Expanded(
                flex:1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.red,
                      child: Container(
                        width:300,
                        height:50,
                        child: ElevatedButton(

                             onPressed: _showLoader ? null : (){
                             _loadAndGo();

                          print("Botton pulsado");
                        },
                        child: Text(_showLoader ? "Cargando" : "Login",
                        style: TextStyle(color: Colors.black87))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  void _loadAndGo(){

    setState(() {
      _showLoader = true;
    });

    Timer(Duration(seconds: 2),(){//1er parametro duracion, 2o funcion
      setState(() {
        _showLoader = false;
      });

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder :(context)=>ShowsPage())
      );


    });

  }
}
