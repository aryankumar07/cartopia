import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget{
  final TextEditingController controller;
  final String hinttext;

  CustomTextField({
    super.key,
    required this.controller,
    required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        border: const OutlineInputBorder(
          borderSide:  BorderSide(
            color: Colors.black,
          )
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          )
        ),
      ),
      validator: (val){},
    );
  }
}