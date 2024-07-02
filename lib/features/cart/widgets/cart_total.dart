import 'package:cartopia/features/address/screens/address_screen.dart';
import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:cartopia/models/user.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTotal extends StatefulWidget {
  const CartTotal({super.key});

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {

  

  void naviagteToAdress(String choosenAddress){
    Navigator.pushNamed(context, AddressScreen.routeName,arguments: choosenAddress);
  }

  @override
  Widget build(BuildContext context) {

    final user = context.watch<userProvider>().user;

    int total = 0;
    for(int i=0;i<user.cart.length;i++){
      int quantity = user.cart[i]['quantity'];
      int price = user.cart[i]['product']['price'];
      total += quantity*price;
    }

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SubTotal : \$ ${total}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap : (){
                naviagteToAdress(user.address[0]);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.green
                ),
                child: Center(
                  child: Text(
                    'Proceed to but ${user.cart.length} item',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300
                    ),
                    )),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}