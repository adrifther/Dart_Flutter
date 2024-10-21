
import 'package:flutter/material.dart';

class EnvelopeComponent extends StatelessWidget {

  int pendings;

  EnvelopeComponent({
    required this.pendings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:30,
      height: 50,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:4.0),
            child: Icon(Icons.email),
          ),
          pendings > 0 ?
            Positioned(
              right: 0,
              top: 0,
              child: Badge(label:Text("$pendings"),smallSize: 15,)) : SizedBox(),
        ],
      ),
    );
  }
}