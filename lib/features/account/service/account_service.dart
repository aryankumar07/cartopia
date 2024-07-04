import 'dart:convert';

import 'package:cartopia/constants/error_handle.dart';
import 'package:cartopia/constants/utils.dart';
import 'package:cartopia/locker.dart';
import 'package:cartopia/models/order.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AccountService {
  Future<List<Order>> getUserOrders({
    required BuildContext context,
  })async{
    List<Order> orders = [];
    final userprovider = Provider.of<userProvider>(context,listen: false);
    try{
      http.Response response = await http.get(
        Uri.parse('$baseUri/api/fetch-order'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'x-auth-token' : userprovider.user.token
        }
      );
      // print(response.body.length);
      HttpErrorhandler(
        response: response, 
        context: context, 
        onpresed: (){
          for(int i=0;i<jsonDecode(response.body).length;i++){
            orders.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(response.body)[i]
                  ))
            );
          }
        });
    }catch(e){
      showsnackbar(context, e.toString());
    }

    return orders;
  }
}