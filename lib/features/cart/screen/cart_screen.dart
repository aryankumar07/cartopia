import 'package:cartopia/features/cart/widgets/cart_product.dart';
import 'package:cartopia/features/cart/widgets/cart_total.dart';
import 'package:cartopia/models/product.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<userProvider>().user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          'Delivery To :-',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.arrow_drop_down))
        ],
      ),
      body: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20,),
            CartTotal(),
            Expanded(
              child: ListView.builder(
                itemCount: user.cart.length,
                itemBuilder: (context,index){
                  final productdata = user.cart[index]['product'];
                  final int quantity = user.cart[index]['quantity'];
                  final Product product = Product.fromMap(productdata);
                  return CartProduct(product: product,quantity: quantity,);
                }),
            )
          ],
        ),
      )
    );
  }
} 