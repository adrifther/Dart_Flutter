import 'dart:async';

import 'package:first_flutter_project/constants.dart';
import 'package:first_flutter_project/pages/shows_page.dart';
import 'package:flutter/material.dart';

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
      child: Scaffold(
        backgroundColor: Colors.white,
        body:Container(
          width:double.infinity,
          color:Colors.blue.withOpacity(0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //ESPACIO PARA LA IMAGEN DE LOGO
              Expanded(
                  flex:3,
                  child:Center(
                    //SI NO PONEMOS EL CENTER, IGNORA EL HEIGHT DEL CONTAINER
                    child: Container(
                      height:300,
                      width:300,
                      child:Image.network(
                        logoUrl,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      )
                    ),
                  )
              ),
              //ESPACIO PARA EL ICONO DE CARGA
              Expanded(
                flex:1,
                child: _showLoader ?  Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()
                ) : SizedBox()
              ),
              //ESPACIO PARA EL BOTON DE LOGIN
              Expanded(
                flex:3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width:300,
                      height:50,
                      child: ElevatedButton(

                        onPressed:_showLoader ? null :  (){
                          _loadAndGo();
                          print("BOTON PULSADO");
                        },
                        child:Text(_showLoader ? "Cargando" : "Login",
                          style:TextStyle(color:Colors.black)
                        )
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
    
    Timer(Duration(seconds: 2),(){
      setState(() {
        _showLoader = false;
      });
      
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>ShowsPage())
      );
      
    });

  }
}
