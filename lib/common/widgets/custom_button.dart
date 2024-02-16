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
    // TODO: implement build
    return ElevatedButton(
    onPressed: () => onTap, 
    child: Text(text),
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 50), 
    ),
    );
  }
}