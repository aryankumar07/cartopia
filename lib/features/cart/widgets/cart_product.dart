 import 'package:cartopia/features/cart/service/cart_service.dart';
import 'package:cartopia/features/product_detail/screen/product_detail_screen.dart';
import 'package:cartopia/features/product_detail/service/product_detail_service.dart';
import 'package:cartopia/models/product.dart';
import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget{

  final Product product;
  final int quantity;

  CartProduct({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {


  final ProductDetailService productDetailService = ProductDetailService();
  final CartService cartService = CartService();

  void increaseQuantity(){
    // print('increasing');
    productDetailService.addToCart(context: context, product: widget.product);
  }

  void decreaseQunatity(){
    cartService.removeFromCart(context: context, product: widget.product);
  }

  void navigateToProductDetail(BuildContext context){
    Navigator.pushNamed(
      context, ProductDetailScreen.routeName,
      arguments: widget.product);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
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
                    widget.product.images[0],
                    fit: BoxFit.fill,
                    ),
                ),
          
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      
                      SizedBox(height: 10,),
                  
                      Text(
                        '\$${widget.product.price}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      SizedBox(height: 5,),
          
                      // RatingBar(raiting: 4),
                  
                      SizedBox(height: 10,),
                  
                      Text(
                        'Availabe in your area',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                  
                      SizedBox(height: 10,),
                  
                      if(widget.product.quantity>0)...[
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
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        decreaseQunatity();
                      },
                      child: Container(
                        height: 35,
                        width: 32,
                        alignment: Alignment.center,
                        child: Icon(Icons.remove,size: 18,),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black12,
                          width: 1.5
                        ),
                        color: Colors.white
                      ),
                      child: Container(
                        height: 35,
                        width: 32,
                        alignment: Alignment.center,
                        child: Text(
                          '${widget.quantity}'
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        increaseQuantity();
                      },
                      child: Container(
                        height: 35,
                        width: 32,
                        alignment: Alignment.center,
                        child: Icon(Icons.add,size: 18,),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        )
      ],
    );
  }
}