import 'package:flutter/material.dart';

class infoBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 42,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8,left: 10),
            child: Text('search for the product'),
          ),
      ),
      Positioned(
        top: 5,
        right: 5,
        bottom: 5,
        child: Container(
          width: 50,
          height: 34,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Icon(Icons.search,color: Colors.white,),
        ))
      ],
    );
  }
}