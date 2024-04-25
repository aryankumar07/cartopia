import 'dart:convert';

import 'package:cartopia/constants/error_handle.dart';
import 'package:cartopia/constants/secret.dart';
import 'package:cartopia/constants/utils.dart';
import 'package:cartopia/model/product.dart';
import 'package:cartopia/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductDetailService {

  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  })async{
    final userProvider  =Provider.of<UserProvider>(context,listen: false).user;
    print(rating);
    print(product.id);
    try{
      http.Response response = await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: {
          'Content-Type' : 'application/json;  charset=UTF-8',
          'x-auth-token' : userProvider.token,
        },
        body: jsonEncode({
          'pid' : product.id,
          'rating' : rating,
        })
      );

      httpErrorHandle(
        response: response, 
        context: context, 
        onSuccess: (){

        });

    }catch(e){
      ShowSnackBar(context, e.toString());
    }
  }

}