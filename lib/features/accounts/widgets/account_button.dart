import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget{
  final String text;
  final VoidCallback onTap;
  AccountButton({
    required this.text,
    required this.onTap,
    super.key
    });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white,width: 0.0),
        borderRadius: BorderRadius.circular(50),
        color: Colors.white
      ),
      child: OutlinedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50)
          )
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal
          ),
        )),
    );
  }
}