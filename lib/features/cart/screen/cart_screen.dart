import 'dart:math';

import 'package:cartopia/common/new_adress_container.dart';
import 'package:cartopia/features/cart/service/cart_service.dart';
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

  final TextEditingController flattextController = TextEditingController();
  final TextEditingController areatextController = TextEditingController();
  final TextEditingController pincodetextController = TextEditingController();
  final TextEditingController towntextController = TextEditingController();

  String currentVal = 'EDIT';
  final CartService cartService = CartService();

  void addnewAddress(String address){
    cartService.addnewAddress(context: context, address: address);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<userProvider>().user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 300,
              child: Text(
                'Delivery To :- ${ user.address.length==0? 'No Address Found' :  user.address[0]}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              child: DropdownButton<String>(
                value: currentVal,
                dropdownColor: Colors.brown,
                icon: Icon(Icons.arrow_drop_down,color: Colors.white,),
                onChanged: (String? newval){
                  setState(() {
                    currentVal=newval!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'EDIT',
                    onTap: (){
                      Scaffold.of(context).showBottomSheet(
                          enableDrag: true,
                          showDragHandle: true,
                          (BuildContext context){
                            return Container(
                              height: 400,
                              decoration: BoxDecoration(
                                color: Colors.white
                              ),
                            );
                          });
                    },
                    child: Text(
                      'EDIT',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      ),
                    )),
                  DropdownMenuItem(
                    value: 'ADD',
                    onTap: (){
                      Scaffold.of(context).showBottomSheet(
                          enableDrag: true,
                          showDragHandle: true,
                          (BuildContext context){
                            return Container(
                              height: 400,
                              decoration: BoxDecoration(
                                color: Colors.white
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: NewAdressContainer(
                                      flattextController: flattextController,
                                      areatextController: areatextController,
                                      pincodetextController: pincodetextController,
                                      towntextController: towntextController,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          }, 
                                          child: Text('Discard')),
                                          SizedBox(width: 20,),
                                          ElevatedButton(
                                            onPressed: (){
                                              final address = flattextController.text + " "
                                                              + areatextController.text + " "
                                                              + pincodetextController.text + " "
                                                              + towntextController.text;
                                              // flattextController.text='';
                                              // areatextController.text='';
                                              // pincodetextController.text='';
                                              // towntextController.text='';
                                              // print(address);
                                              addnewAddress(address);
                                            },
                                            child: Text('Save'))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: Text(
                      'ADD',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      ),
                    )),
                ],),
            )
          ],
        )

      ),
      body: user.cart.length==0? 
      Center(
        child: Text('Cart is Empty'),
      )
       : Column(
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
            ),
          ],
        ),
    );
  }
} 