import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final String text;
  final VoidCallback onTap;
CustomButton({
  required this.text,
  required this.onTap,
  super.key
  });
@override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:  onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50)
      ), 
      child: Text(text)
      );
  }
}