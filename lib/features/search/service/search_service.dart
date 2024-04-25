import 'dart:convert';

import 'package:cartopia/constants/error_handle.dart';
import 'package:cartopia/constants/secret.dart';
import 'package:cartopia/constants/utils.dart';
import 'package:cartopia/model/product.dart';
import 'package:cartopia/model/rating.dart';
import 'package:cartopia/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SearchService {

  Future<List<Product>> fetchSearchProducts({
     required BuildContext context,
     required String searchQuery,
  }) async {
     List<Product> products=[];
      final user = Provider.of<UserProvider>(context,listen: false).user;
    try{ 
      http.Response response = await http.get(
        Uri.parse('$uri/api/products/search/$searchQuery'),
        headers: {
          'Content-type' : 'application/json; charset=UTF-8',
          'x-auth-token' : user.token,
        }
      );

       httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          List<dynamic> productList = jsonDecode(response.body);
          print(productList);
          for (int i = 0; i < productList.length; i++) {
             Map<String, dynamic> productMap = productList[i];
          Product product = Product(
            name: productMap['name'] ?? '',
            description: productMap['description'] ?? '',
            quantity: productMap['quantity'] != null
                ? double.parse(productMap['quantity'].toString())
                : 0.0,
            price: productMap['price'] != null
                ? double.parse(productMap['price'].toString())
                : 0.0,
            images: List<String>.from(productMap['images']),
            category: productMap['category'] ?? '',
            id: productMap['_id'],
            rating: productMap['ratings'] != null ? 
              List<Rating>.from(productMap['ratings']?.map(
              (x)=>Rating(userId: x['userId'], 
              rating:  double.parse(x['rating'].toString()))
                ))
                : null,
          );
          print('Product $i: $product'); // Debug print
          products.add(product);
          }
        },
      );
      
    }catch(e){
      ShowSnackBar(context, e.toString());
    }

    return products;
  }

}