import 'dart:convert';
import 'dart:io';
import 'package:cartopia/constants/error_handle.dart';
import 'package:cartopia/constants/secret.dart';
import 'package:cartopia/constants/utils.dart';
import 'package:cartopia/model/product.dart';
import 'package:cartopia/provider/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminService {


  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('x-auth-token');
      final cloudinary = CloudinaryPublic(
        "dkxotttzd", 
        "h1aa7kqv");
        List<String> ImageUrl = [];
        for(int i=0;i<images.length;i++){
          CloudinaryResponse res = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(
              images[i].path,
              folder: name
              )
          );
          ImageUrl.add(res.secureUrl);
          print('printing imageurls');
          print(ImageUrl);
          Product product = Product(
          name: name, 
          description: description, 
          quantity: quantity, 
          price: price, 
          images: ImageUrl, 
          category: category, 
          id: '', 
          );

          http.Response result = await http.post(
            Uri.parse('$uri/admin/add-product'),
            headers: {
              'Content-type' : 'application/json; charset=UTF-8',
              'x-auth-token' : token!,
            },
            body: product.toJson()
          );


          httpErrorHandle(
          response: result, 
          context: context, 
          onSuccess: (){
            ShowSnackBar(context, 'Product added successfully');
            Navigator.pop(context);
          });
        }
    }catch(e){
      ShowSnackBar(context, e.toString()); 
    }
  }

  Future<List<Product>>  fetchAllProduct(BuildContext context) async {
      List<Product> products=[];
      final user = Provider.of<UserProvider>(context,listen: false).user;
    try{
      http.Response response = await http.get(
        Uri.parse('$uri/admin/get-product'),
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

   Future<bool> deleteProduct(BuildContext context,String pId) async {
    try{
      final token = Provider.of<UserProvider>(context,listen: false).user.token;

      print(pId);

      http.Response response = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : token,
          'pId' : pId
        },
      );

      httpErrorHandle(
        response: response, 
        context: context, 
        onSuccess: (){
          ShowSnackBar(context, 'product deleted');
        });

      return true;
    }catch(e){
      ShowSnackBar(context, e.toString());
    }
 
    return false;
  }
}