import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{

  final String text;
  final VoidCallback onTap;

  CustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: Size(double.infinity,50),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.green
        ),
        ));
  }
}