import 'package:cartopia/models/product.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatefulWidget {

  final double rating;
  final Product product;

  const ReviewCard({
    super.key,
    required this.rating,
    required this.product,
    });

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,size: 22,),
        Text(
          '${widget.rating}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(width: 10,),
        Container(
          height: 20,
          width: 1,
          decoration: BoxDecoration(
            color: Colors.grey
          ),
        ),
        SizedBox(width: 10,),
        Text(
          '25 Review',
          style: TextStyle(
            decoration: TextDecoration.underline
          ),
        )
      ],
    );
  }
}