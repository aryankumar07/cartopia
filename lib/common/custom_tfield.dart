import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget{

  final  TextEditingController controler;
  final String hinttext;

  CustomTextField({
    required this.controler,
    required this.hinttext,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      decoration: InputDecoration(
        hintText: hinttext,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black
          )
        )
      ),
    );
  }
}