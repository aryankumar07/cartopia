import 'package:cartopia/constants/global_var.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Stars extends StatelessWidget{

  final double ratings;

  Stars({
    super.key,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemCount: 5,
      rating: ratings,
      itemSize: 15,
      itemBuilder: (context,_)=>
      Icon(Icons.star,color: GlobalVariables.secondaryColor,));
  }
}