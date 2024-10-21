

import 'package:first_flutter_project/models/show.dart';
import 'package:first_flutter_project/pages/login_page.dart';
import 'package:first_flutter_project/repositories/show_repository.dart';
import 'package:flutter/material.dart';

class ShowsPage extends StatefulWidget {
  

  ShowsPage({super.key});

  @override
  State<ShowsPage> createState() => _ShowsPageState();
}

class _ShowsPageState extends State<ShowsPage> {

  List<Show> _list = [];
  bool _isLoading = true;

  var _searchController = TextEditingController();


  @override
  void initState(){
    super.initState();

    _loadData();
  }

  Future<void> _loadData({String? searchTerm}) async {
    setState(() {
      _isLoading = true;
    });

    try{
      _list = await ShowRepository().search(searchTerm ?? "a");

      //RETARDO MANUAL DE CARGA
      await Future.delayed(Duration(seconds:2));

      setState(() {});

    }catch(e){
      print("Error cargando datos");
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //SI PONEMOS LEADING PERDEMOS LA FLECHA ATRAS DE FORMA AUTOMATICA
        leading: IconButton(
          onPressed: ()=>_loadData(searchTerm: _searchController.text),
          icon: Icon(Icons.refresh),
        ),
        backgroundColor: Colors.blue,
        //titleTextStyle: TextStyle(color:Colors.white),
        title: Text("Shows Page"),
        elevation: 2,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=>LoginPage())
                );
              },
              icon: Icon(Icons.logout)
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red.withOpacity(0.1),
            width: double.infinity,
            height:80,
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        controller: _searchController ,
                    ),
                  ),
                  SizedBox(width:20),
                  ElevatedButton(
                      onPressed: (){
                          print("Tu busqueda es ${_searchController.text}");

                          _loadData(searchTerm: _searchController.text);

                        /**** AQUI ES DONDE VA VUESTRO CODIGO
                         * PÂRA BUSCAR SHOWS SEGUN LO QUE ESCRIBAN EN EL TEXTFORMFIELD
                         */


                      }, child: Text("Buscar"))

                ],
              ),
            )
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: !_isLoading ? ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(_list[index].name),
                    subtitle: Text("subtitle of ${_list[index].id}"),
                    onTap: (){
                      print("CLICADA SERIE ${_list[index].name}");

                      //AQUI NAVEGAREMOS A UN PAGINA
                      // ESPECIFICA QUE LLAMAREMOS show_detail_page.dart
                    },
                    trailing: Icon(Icons.arrow_forward),
                  );
                },
              ) : Center(child: CircularProgressIndicator())
            ),
          ),
        ],
      ),
    );
  }
}
