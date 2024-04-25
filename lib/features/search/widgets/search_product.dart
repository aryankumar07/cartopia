import 'package:cartopia/common/widgets/stars.dart';
import 'package:cartopia/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchProduct extends StatelessWidget{
  final Product product;

  SearchProduct({
    super.key,
    required this.product,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: 150,
            child: Image.network(
              product.images[0],
              fit: BoxFit.cover,
            )
          ),
          Container(
            height: 150,
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(height: 20,),
                Text(
                  product.name,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                  ),
                ),

                Container(
                  child: Stars(ratings: 4),
                ),

                SizedBox(height: 20,),
                Text(
                  '\$ ${product.price}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),

                SizedBox(height: 10,),
                Text(
                  'Elgible for FREE shipping',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                )


              ],
            ),
          )
        ],
      ),
    );
  }
}