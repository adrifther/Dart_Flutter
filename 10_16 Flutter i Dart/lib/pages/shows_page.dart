import 'package:first_flutter_project/repositories/show_repository.dart';
import 'package:flutter/material.dart';

import '../models/show.dart';

class ShowsPage extends StatefulWidget {
  ShowsPage({super.key});

  @override
  State<ShowsPage> createState() => _ShowsPageState();
}

class _ShowsPageState extends State<ShowsPage> {

  List <Show> _list = [];
  bool _isLoading = true;
  var _searchController = TextEditingController();

  @override
  void initState(){ //inicializa estado de widget
    super.initState();

    _loadData();

  }

  Future<void> _loadData() async {

    setState(() {
      _isLoading = true;
    });

    try{
      _list = await ShowRepository().search("Big");

      await Future.delayed(Duration(seconds:2));

      setState(() {

      });
    }catch(e){
      print("error carrgando datos");
    }
    setState(() {
    _isLoading = false;
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>_loadData(),
          icon: Icon(Icons.refresh),
        ),
        backgroundColor: Colors.blue,
        //titleTextStyle: TextStyle(color: Colors.white),
        title: Text("Shows Page"),
        elevation: 2,
        centerTitle: true,
        actions:[
          IconButton(
              onPressed: () {Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder :(context)=>ShowsPage())
              );
            }, icon: Icon(Icons.logout))
        ]
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red.withOpacity(0.1),
            width: double.infinity,
            height:80,
            child:Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _searchController,
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      print("Tu busqueda es ${_searchController.text}");
                      /**
                       * AQUI VA EL CODIGO PAL EJERCICIO
                       * PARA BUSCAR SHOWS SEGUN LO QUE ESCRIBAN EN EL TEXTFORMFIELD
                       *
                       *
                       * */

                    }, child: Text("Buscar"))
              ],
            )
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: !_isLoading ? ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context,index){ //para cada indice devuelve el elemento q qyerramos
                    return ListTile(
                      title: Text(_list[index].name),
                      subtitle: Text("subtitle of ${_list[index].id}"),
                    );

      }) : Center(child: CircularProgressIndicator())
            ),
          ),
        ],
      ),
    );
  }
}
