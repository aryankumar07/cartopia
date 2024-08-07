import 'dart:convert';

import 'package:cartopia/constants/error_handle.dart';
import 'package:cartopia/constants/utils.dart';
import 'package:cartopia/locker.dart';
import 'package:cartopia/models/product.dart';
import 'package:cartopia/models/user.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductDetailService{

  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userprovider = Provider.of<userProvider>(context,listen: false);
    try{
      print(product);
      http.Response response = await http.post(
        Uri.parse('$baseUri/api/add-to-cart'),
        body: jsonEncode({
          'productId' : product.id!,
        }),
        headers: <String,String>{
            'Content-Type' : 'application/json; charset=UTF-8',
            'x-auth-token' : userprovider.user.token,
        },
      );

      print(response.body);

      HttpErrorhandler(
        response: response, 
        context: context, 
        onpresed: (){
          User user = userprovider.user.copyWith(
            cart: jsonDecode(response.body)['cart']
          );
          userprovider.setUserFromModel(user);
        });

    }catch(e){
      print(e.toString());
      showsnackbar(context, e.toString());
    }
  }


  void rateProduct({
    required BuildContext context,
    required String prodid,
    required double rating,
  }) async {
    final userprovider = Provider.of<userProvider>(context,listen: false);
    try{

      http.Response response = await http.post(
        Uri.parse('$baseUri/api/products/rating'),
        body: jsonEncode({
          'productId' : prodid,
          'rating' : rating,
        }),
        headers: <String,String>{
            'Content-Type' : 'application/json; charset=UTF-8',
            'x-auth-token' : userprovider.user.token,
        },
      );

      // print(response.body);

      HttpErrorhandler(
        response: response, 
        context: context, 
        onpresed: (){
          
        });

    }catch(e){
      showsnackbar(context, e.toString());
    }
  }
}