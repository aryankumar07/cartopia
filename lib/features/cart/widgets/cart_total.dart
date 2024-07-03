import 'dart:convert';
import 'package:cartopia/constants/utils.dart';
import 'package:cartopia/features/address/screens/address_screen.dart';
import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:cartopia/locker.dart';
import 'package:cartopia/models/user.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:cartopia/common/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CartTotal extends StatefulWidget {
  const CartTotal({super.key});

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {

  

  void naviagteToAdress(String choosenAddress,String totalamount){
    Navigator.pushNamed(context, AddressScreen.routeName,
    arguments: {
      'choosenadress':choosenAddress,
      'totalamount':totalamount});
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
                if(user.address.length==0){
                  return showsnackbar(context, 'please add an address first');
                }
                naviagteToAdress(user.address[0],total.toString());
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
                    'Proceed to buy ${user.cart.length} item',
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