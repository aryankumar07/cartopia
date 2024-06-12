import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget{

  final  TextEditingController controler;
  final String hinttext;
  final int maxlines;

  CustomTextField({
    required this.controler,
    required this.hinttext,
    this.maxlines=1,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controler,
      maxLines: maxlines,
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