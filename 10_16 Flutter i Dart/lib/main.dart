import 'package:flutter/material.dart';

import 'pages/login_page.dart';

void main(){

  runApp(Myapp());

}

class Myapp extends StatelessWidget {

  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp( //nuestra app
      home: LoginPage()  //1era pantalla
    );
  }
}
