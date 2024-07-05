import 'dart:convert';
import 'dart:io';

import 'package:cartopia/constants/error_handle.dart';
import 'package:cartopia/constants/utils.dart';
import 'package:cartopia/locker.dart';
import 'package:cartopia/models/order.dart';
import 'package:cartopia/models/product.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminService {
   void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required String category,
    required double price,
    required double quantity,
    required List<File> images,
    // required VoidCallback onpressed,
   })async{
    try{
      final userprovider = Provider.of<userProvider>(context,listen: false);
      final cloudinary = CloudinaryPublic('dkxotttzd', 'h1aa7kqv');
      List<String> imageUrl = [];
      for(int i=0;i<images.length;i++){
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path,folder: name)
        );
        imageUrl.add(res.secureUrl);
      }

      final product = Product(
        name: name, 
        description: description, 
        category: category, 
        price: price, 
        quantity: quantity,
        images: imageUrl);

        print(product);

      http.Response response = await http.post(
        Uri.parse('$baseUri/admin/add-product'),
        headers:{
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : userprovider.user.token,
        },
        body: product.toJson()
      );

      HttpErrorhandler(
        response: response, 
        context: context, 
        onpresed: (){
          showsnackbar(context, 'product added sussefully');
          Navigator.pop(context,true);
        });



    }catch(e){
      print(e.toString());
      showsnackbar(context, e.toString());
    }
   }

   Future<List<Product>> getProducts({
    required BuildContext context,
    required  String userId,
   })async{
    List<Product> products = [];
    try{
      final userprovider = Provider.of<userProvider>(context,listen: false);
      http.Response response = await http.get(
        Uri.parse('$baseUri/admin/get-product'),
        headers:{
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : userprovider.user.token,
        },
      );

      HttpErrorhandler(
        response: response, 
        context: context, 
        onpresed: (){
          for(int i=0;i<jsonDecode(response.body).length;i++){
            products.add(
              Product.fromJson(jsonEncode(jsonDecode(response.body)[i]))
            );
          }
        });

    }catch(e){
      showsnackbar(context, e.toString());
    }


    return products;

   }

   Future<bool> detleteProduct({
    required BuildContext context,
    required String productId
   }) async {
    bool deleted=false;
    try{
      final userprovider = Provider.of<userProvider>(context,listen: false);

      print(productId);

      http.Response response = await http.post(
        Uri.parse('$baseUri/admin/delete-product'),
        headers:<String,String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : userprovider.user.token,
          'productId' : productId
        },
      );

      HttpErrorhandler(
        response: response,
        context: context, 
        onpresed: (){
          showsnackbar(context, 'Product deleted');
          deleted = true;
        });

    } catch(e){
      showsnackbar(context, e.toString());
    }
    
    return deleted;

   }

   void changeOrderStatus({
    required BuildContext context,
    required int status,
    required Order order,
    required VoidCallback backPressed
   })async{
    final userprovider = Provider.of<userProvider>(context,listen: false);
    try{
      http.Response response = await http.post(
        Uri.parse('$baseUri/admin/change-order-status'),
        headers: <String,String>{
          'Content-Type' : 'applicatiob/json; charset=UTF-8',
          'x-auth-token' : userprovider.user.token,
        },
        body: jsonEncode({
          'id' : order.id,
          'status' : status,
        })
      );

      HttpErrorhandler(
        response: response, 
        context: context, 
        onpresed: (){
          backPressed;
        });
    }catch(e){
      showsnackbar(context, e.toString());
    }
   }

   Future<List<Product>> fetchOrderPlaced({
    required BuildContext context
   })async{
    List<Product> productlist =[];
    try{
      final userprovider = Provider.of<userProvider>(context,listen: false);
      http.Response response = await http.get(
        Uri.parse('$baseUri/admin/fetch-order'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : userprovider.user.token,
        },
      );

      HttpErrorhandler(
        response: response, 
        context: context, onpresed: (){
          final data = jsonDecode(response.body);
          for(int i=0;i<data.length;i++){
            productlist.add(
              Product.fromJson(jsonEncode(data[i]))
            );
          }
          // print(productlist);
        });

    }catch(e){
      showsnackbar(context, e.toString());
    }

    return productlist;
   }

}