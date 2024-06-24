import 'package:cartopia/features/product_detail/screen/product_detail_screen.dart';
import 'package:cartopia/features/search/widgets/rating_bar.dart';
import 'package:cartopia/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget{

  final Product product;

  ProductCard({
    super.key,
    required this.product
  });

  void navigateToProductDetail(BuildContext context){
    Navigator.pushNamed(
      context, ProductDetailScreen.routeName,
      arguments: product);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>navigateToProductDetail(context),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 200,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 170,
              width: 170,
              child: Image.network(
                product.images[0],
                fit: BoxFit.fill,
                ),
            ),
      
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  
                  SizedBox(height: 10,),
              
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(height: 5,),
      
                  RatingBar(raiting: 4),
              
                  SizedBox(height: 10,),
              
                  Text(
                    'Availabe in your area',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),
                  ),
              
                  SizedBox(height: 10,),
              
                  if(product.quantity>0)...[
                    Text(
                      'IN Stock',
                      style: TextStyle(
                        color: Colors.green
                      ),
                    )
                  ]
                  else...[
                    Text(
                      'out of stock',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )
                  ]
              
              
                ],
              ),
            )
      
          ],
        ),
      ),
    );
  }
}