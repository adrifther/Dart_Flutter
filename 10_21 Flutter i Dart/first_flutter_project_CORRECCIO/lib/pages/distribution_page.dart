

import 'package:flutter/material.dart';

import '../components/envelope_component.dart';

class DistributionPage extends StatelessWidget {
  const DistributionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.black12,
                alignment: Alignment.center,
                child:Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(

                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      flex:7,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            flex:1,
                            child: Container(
                              alignment: Alignment.center,
                              color:Colors.red,
                              child:Text("GOLA")
                            ),
                          ),
                          Flexible(
                            flex:3,
                            child: Container(
                                alignment: Alignment.center,
                                color:Colors.amber
                            ),
                          ),

                          Flexible(
                            flex:6,
                            child: Container(
                                alignment: Alignment.center,
                                color:Colors.green
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ),
              Positioned(
                  top:100,
                  left:20,
                  child: EnvelopeComponent(pendings: 5,)),
              Positioned(
                  top:50,
                  left:20,
                  child: Text("ESTO NO VA BIEN")),

            ],
          ),
        )
      ),
    );
  }
}

