import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget{
  String imageUrl;

  SingleProduct({
    super.key,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5,right: 5),
      child: Image(image: NetworkImage(imageUrl)),
    );
  }
}