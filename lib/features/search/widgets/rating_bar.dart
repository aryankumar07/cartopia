import 'package:cartopia/features/account/widget/single_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBar extends StatelessWidget{
  final double raiting;
  RatingBar({
    super.key,
    required this.raiting,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: RatingBarIndicator(
        direction: Axis.horizontal,
        itemCount: 5,
        rating: raiting,
        itemSize: 15,
        itemPadding: EdgeInsets.only(left: 5,right: 5),
        itemBuilder: (context,_)=>Icon(Icons.star_outlined,color: Colors.green,)),
    );
  }

}