import 'dart:convert';

import 'package:cartopia/constants/error_handle.dart';
import 'package:cartopia/constants/utils.dart';
import 'package:cartopia/locker.dart';
import 'package:cartopia/models/product.dart';
import 'package:cartopia/providers/product_provider.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SearchService {

  Future<List<Product>> fetchSearchProducts({
    required BuildContext context,
    required String query,
  })async {
    List<Product> products = [];
    try{
      final userprovider = Provider.of<userProvider>(context,listen: false);

      http.Response response = await http.get(
        Uri.parse('$baseUri/api/products/search/$query'),
        headers: <String,String> {
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : userprovider.user.token 
        }
      );

      HttpErrorhandler(
        response: response, 
        context: context, 
        onpresed: (){
          final list = jsonDecode(response.body);
          for(int i=0;i<list.length;i++){
            products.add(
              Product.fromJson(jsonEncode(jsonDecode(response.body)[i]))
            );
          }
        });

        print(products);


    }catch(e){
      showsnackbar(context, e.toString());
    }

    return products;
  }

}