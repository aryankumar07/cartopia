import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget{
  final String link;
  SingleProduct({
    required this.link,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1.5
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 180,
        child: Image.network(
          link,
          fit: BoxFit.fitHeight,
          width: 180,
          ),
      )
    );
  }
}