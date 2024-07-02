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

class CartService{

  void removeFromCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userprovider = Provider.of<userProvider>(context,listen: false);
    try{
      print(product);
      http.Response response = await http.delete(
        Uri.parse('$baseUri/api/rm-from-cart/${product.id}'),
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

  void addnewAddress({
    required BuildContext context,
    required String address,
  })async{
    final userprovider = Provider.of<userProvider>(context,listen: false);
    try{
      http.Response response = await  http.post(
        Uri.parse('$baseUri/api/add-new-address'),
        body: jsonEncode({
          'address' : address
        }),
        headers: <String,String> {
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : userprovider.user.token
        }
      );

      print(jsonDecode(response.body)['address']);

      HttpErrorhandler(
        response: response, 
        context: context, 
        onpresed: (){
          List<String> address = List<String>.from(jsonDecode(response.body)['address']);
          User user = userprovider.user.copyWith(
            address: address
          );
          userprovider.setUserFromModel(user);
        });

        showsnackbar(context, 'new address added');
        Navigator.pop(context);

    }catch(e){
      showsnackbar(context, e.toString());
    }
  }


}