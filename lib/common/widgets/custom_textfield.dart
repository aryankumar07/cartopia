import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{ 
  final TextEditingController controller;
  final String Hinttext;
  CustomTextField({
    required this.controller,
    required this.Hinttext,
    super.key
    });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: controller,


      decoration: InputDecoration(
        hintText: Hinttext,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          )
        )
      ),

      validator: (value){
        if( value==null || value.isEmpty ){
          return 'enter your $Hinttext';
        }
        return null;
      },
    );
  }
}