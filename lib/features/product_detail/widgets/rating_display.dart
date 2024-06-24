import 'package:cartopia/features/product_detail/service/product_detail_service.dart';
import 'package:cartopia/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDisplay extends StatefulWidget {
  final Product product;
  final double rating;
  const RatingDisplay({
    super.key,
    required this.product,
    required this.rating,
    });

  @override
  State<RatingDisplay> createState() => _RatingDisplayState();
}

class _RatingDisplayState extends State<RatingDisplay> {

  final ProductDetailService productDetailService = ProductDetailService();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 700,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20,top: 20),
              child: Text(
                'Rate The Painting',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,),
              child: RatingBar.builder(
                itemCount: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                minRating: 1,
                initialRating: widget.rating,
                itemBuilder: (context,_)=>Icon(Icons.star,color: Colors.green,), 
                onRatingUpdate: (rating){
                  productDetailService.rateProduct(
                    context: context, 
                    prodid: widget.product.id!, 
                    rating: rating);
                }),
            ),
            SizedBox(height: 10,),
            Container(
              height: 200,
              child: Center(
                child: Text('user working under construction'),
              ),
            ),

            SizedBox(height: 10,),
            Container(
              height: 300,
              child: Center(
                child: Text('Reviews under construction'),
              ),
            )
          ],
        ),
      ),
    );
  }
}