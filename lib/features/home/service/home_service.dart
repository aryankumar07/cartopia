import 'dart:convert';

import 'package:cartopia/constants/error_handle.dart';
import 'package:cartopia/constants/utils.dart';
import 'package:cartopia/locker.dart';
import 'package:cartopia/models/product.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeService {
  Future<List<Product>> getCategoryProduct({
    required BuildContext context,
    required String category,
  }) async {
    List<Product> products=[];
    try{
      final userprovider = Provider.of<userProvider>(context,listen: false);


      http.Response response = await http.get(
        Uri.parse('$baseUri/api/products?category=$category'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : userprovider.user.token
        }
      );

      // print(response.body);

      HttpErrorhandler(
        response: response, 
        context: context, 
        onpresed: (){
          final list = jsonDecode(response.body);
          // print(list);
          for(int i=0;i<list.length;i++){
            products.add(
              Product.fromJson(jsonEncode(jsonDecode(response.body)[i]))
            );
          }
        });

    }catch(e){
      showsnackbar(context, 'something terrible happend that should not have happened');
    }

    return products;

  }
}